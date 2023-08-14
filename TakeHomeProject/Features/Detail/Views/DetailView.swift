//
//  DetailView.swift
//  TakeHomeProject
//
//  Created by Eric on 14/08/2023.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            background
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 8) {
                        PillView(id: 0)
                        firstname
                        lastname
                        email
                    }
                }
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

private extension DetailView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
}

private extension DetailView {
    
    @ViewBuilder
    var firstname: some View {
        Text("First Name")
            .font(.system(.body, design: .rounded)
                .weight(.semibold))
        
        Text("<First Name Here>")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var lastname: some View {
        Text("Last Name")
            .font(.system(.body, design: .rounded)
                .weight(.semibold))
        
        Text("<Last Name Here>")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var email: some View {
        Text("Email")
            .font(.system(.body, design: .rounded)
                .weight(.semibold))
        
        Text("<Email Here>")
            .font(.system(.subheadline, design: .rounded))
    }
}
