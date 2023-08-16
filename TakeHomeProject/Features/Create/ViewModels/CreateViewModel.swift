//
//  CreateViewModel.swift
//  TakeHomeProject
//
//  Created by Eric on 16/08/2023.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func create() {
        state = .submitting
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(person)
        
        NetworkingManager.shared.request(methodType: .POST(data: data), "https://reqres.in/api/users?delay=3") { [weak self] res in
            DispatchQueue.main.async {
                switch res {
                case .success:
                    self?.state = .successful
                case .failure(let err):
                    self?.state = .unsuccessful
                    self?.hasError = true
                    self?.error = err as? NetworkingManager.NetworkingError
                }
            }
        }
    }
}

extension CreateViewModel {
    enum SubmissionState {
        case unsuccessful
        case successful
        case submitting
    }
}
