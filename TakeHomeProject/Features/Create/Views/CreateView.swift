//
//  CreateView.swift
//  TakeHomeProject
//
//  Created by Eric on 14/08/2023.
//

import SwiftUI

struct CreateView: View {
    @StateObject private var vm = CreateViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                firstname
                lastname
                job
                
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

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

private extension CreateView {
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
    
    var firstname: some View {
        TextField("First name", text: $vm.person.firstName)
    }
    
    var lastname: some View {
        TextField("Last name", text: $vm.person.lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
    }
    
    var submit: some View {
        Button("Submit") {
            vm.create()
        }
    }
}
