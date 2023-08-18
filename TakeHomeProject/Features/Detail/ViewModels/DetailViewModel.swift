//
//  DetailViewModel.swift
//  TakeHomeProject
//
//  Created by Eric on 15/08/2023.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var isLoading = false
    @Published var hasError = false
    
    @MainActor
    func fetchDetails(for id: Int) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            self.userInfo = try await NetworkingManager.shared.request(.detail(id: id), type: UserDetailResponse.self)
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}
