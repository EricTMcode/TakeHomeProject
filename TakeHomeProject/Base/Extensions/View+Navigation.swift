//
//  View+Navigation.swift
//  TakeHomeProject
//
//  Created by Eric on 29/08/2023.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func embedInNavigation() -> some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                self
            }
        } else {
            NavigationView {
                self
            }
        }
    }
}

