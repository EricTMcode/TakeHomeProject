//
//  Endpoint.swift
//  TakeHomeProject
//
//  Created by Eric on 18/08/2023.
//

import Foundation

enum Endpoint {
    case people
    case detail(id: Int)
    case create
}

extension Endpoint {
    var host: String { "" }
    
    var path: String { "" }
}
