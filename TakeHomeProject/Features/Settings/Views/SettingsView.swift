//
//  SettingsView.swift
//  TakeHomeProject
//
//  Created by Eric on 17/08/2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(UserDefaultKeys.hapticsEnabled) private var isHapticsEnable = true
    
    var body: some View {
            Form {
                haptics
            }
            .navigationBarTitle("Settings")
            .embedInNavigation()
    }
}

private extension SettingsView {
    var haptics: some View {
        Toggle("Enable Haptics", isOn: $isHapticsEnable)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
