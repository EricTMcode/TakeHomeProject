//
//  CreateView.swift
//  TakeHomeProject
//
//  Created by Eric on 14/08/2023.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        Form {
            firstname
            lastname
            job
            
            Section {
                submit
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
    var firstname: some View {
        TextField("First name", text: .constant(""))
    }
    
    var lastname: some View {
        TextField("Last name", text: .constant(""))
    }
    
    var job: some View {
        TextField("Job", text: .constant(""))
    }
    
    var submit: some View {
        Button("Submit") {
            // TODO: Handle ation
        }
    }
}
