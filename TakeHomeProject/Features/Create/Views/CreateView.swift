//
//  CreateView.swift
//  TakeHomeProject
//
//  Created by Eric on 14/08/2023.
//

import SwiftUI

struct CreateView: View {
    
    @StateObject private var vm: CreateViewModel
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) private var dismiss
    
    private let successfulAction: () -> Void
    
    internal init(successfulAction: @escaping () -> Void) {
        self.successfulAction = successfulAction
        
        #if DEBUG
        if UITestingHelper.isUITesting {
            let mock: NetworkingManagerImpl = UITestingHelper.isCreateNetworkingSuccessful ? NetworkingManagerCreateSuccessMock() : NetworkingManagerCreateFailureMock()
            _vm = StateObject(wrappedValue: CreateViewModel(networkingManager: mock))
        } else {
            _vm = StateObject(wrappedValue: CreateViewModel())
        }
        #else
        _vm = StateObject(wrappedValue: CreateViewModel())
        #endif
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    firstname
                    lastname
                    job
                } footer: {
                    if case .validation(let err) = vm.error,
                       let errorDesc = err.errorDescription {
                        Text(errorDesc)
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    submit
                }
            }
            .disabled(vm.state == .submitting)
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
                }
            }
            .onChange(of: vm.state) { formState in
                if formState == .successful {
                    dismiss()
                    successfulAction()
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) { }
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                }
            }
        }
    }
}

extension CreateView {
    enum Field: Hashable {
        case firstName
        case lastName
        case job
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView {}
    }
}

private extension CreateView {
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
        .accessibilityIdentifier("doneBtn")
    }
    
    var firstname: some View {
        TextField("First name", text: $vm.person.firstName)
            .focused($focusedField, equals: .firstName)
            .accessibilityIdentifier("firstNameTxtfield")
    }
    
    var lastname: some View {
        TextField("Last name", text: $vm.person.lastName)
            .focused($focusedField, equals: .lastName)
            .accessibilityIdentifier("lastNameTxtfield")
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
            .focused($focusedField, equals: .job)
            .accessibilityIdentifier("jobTxtField")
    }
    
    var submit: some View {
        Button("Submit") {
            focusedField = nil
            Task {
                await vm.create()
            }
        }
        .accessibilityIdentifier("submitBtn")
    }
}
