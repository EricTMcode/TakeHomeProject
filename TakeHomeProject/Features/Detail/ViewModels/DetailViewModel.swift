//
//  DetailViewModel.swift
//  TakeHomeProject
//
//  Created by Eric on 15/08/2023.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published private(set) var userInfo: UserDetailResponse?
    
    func fetchDetails(for id: Int) {
        NetworkingManager.shared.request("https://reqres.in/api/users/\(id)", type: UserDetailResponse.self) { [weak self] res in
            DispatchQueue.main.async {
                switch res {
                case .success(let response):
                    self?.userInfo = response
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
