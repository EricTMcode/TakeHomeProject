//
//  PeopleView.swift
//  TakeHomeProject
//
//  Created by Eric on 06/08/2023.
//

import SwiftUI

struct PeopleView: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @StateObject private var vm: PeopleViewModel
    @State private var shouldShowCreate = false
    @State private var shouldShowSuccess = false
    @State private var hasAppeared = false
    
    init() {
        #if DEBUG
        
        if UITestingHelper.isUITesting {
            
            let mock: NetworkingManagerImpl = UITestingHelper.isNetworkingSuccessful ? NetworkingManagerUserResponseSuccessMock() : NetworkingManagerUserResponseFailureMock()
            _vm = StateObject(wrappedValue: PeopleViewModel(networkingManager: mock))
            
        } else {
            _vm = StateObject(wrappedValue: PeopleViewModel())
        }
        
        #else
            _vm = StateObject(wrappedValue: PeopleViewModel())
        #endif
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                
                if vm.isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(vm.users, id: \.id) { user in
                                NavigationLink {
                                    DetailView(userId: user.id)
                                } label: {
                                    PersonItemView(user: user)
                                        .accessibilityIdentifier("item_\(user.id)")
                                        .task {
                                            if vm.hasReachEnd(of: user) && !vm.isFetching {
                                                await vm.fetchNextSetOfUsers()
                                            }
                                        }
                                }
                            }
                        }
                        .padding()
                        .accessibilityIdentifier("peopleGrid")
                    }
                    .overlay(alignment: .bottom) {
                        if vm.isFetching {
                            ProgressView()
                        }
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    refresh
                }
            }
            .task {
                if !hasAppeared {
                    await vm.fetchUsers()
                    hasAppeared = true
                }
            }
            .sheet(isPresented: $shouldShowCreate) {
                CreateView {
                    haptic(.success)
                    withAnimation(.spring().delay(0.25)) {
                        self.shouldShowSuccess.toggle()
                    }
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button("Retry") {
                    Task {
                        await vm.fetchUsers()
                    }
                }
            }
            .overlay {
                if shouldShowSuccess {
                    CheckmarkPopoverView()
                        .transition(.scale.combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation(.spring()) {
                                    self.shouldShowSuccess.toggle()
                                }
                            }
                        }
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}


private extension PeopleView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var create: some View {
        Button {
            shouldShowCreate.toggle()
        } label: {
            Symbols.plus
                .font(.system(.headline, design: .rounded))
                .bold()
        }
        .disabled(vm.isLoading)
    }
    
    var refresh: some View {
        Button {
            Task {
                await vm.fetchUsers()
            }
        } label: {
            Symbols.refresh
        }
        .disabled(vm.isLoading)
    }
}
