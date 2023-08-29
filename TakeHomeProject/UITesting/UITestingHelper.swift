//
//  UITestingHelper.swift
//  TakeHomeProject
//
//  Created by Eric on 26/08/2023.
//

#if DEBUG

import Foundation

struct UITestingHelper {
    
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
    
    static var isPeopleNetworkingSuccessful: Bool {
        ProcessInfo.processInfo.environment["-people-networking-success"] == "1"
    }
    
    static var isDetailsNetworkingSuccessful: Bool {
        ProcessInfo.processInfo.environment["-details-networking-success"] == "1"
    }
    
    static var isCreateNetworkingSuccessful: Bool {
        ProcessInfo.processInfo.environment["-create-networking-success"] == "1"
    }
}

#endif
