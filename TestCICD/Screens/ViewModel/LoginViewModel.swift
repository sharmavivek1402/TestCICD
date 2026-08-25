//
//  LoginViewModel.swift
//  TestCaseDemo
//
//  Created by Vivek_Ios on 08/05/26.
//

import Foundation

class LoginViewModel {
    
    var onSucess: ((LoginResponse) -> Void)?
    var onError: ((String) -> Void)?
    
    private let service: LoginAPIService
    
    init(service: LoginAPIService = LoginAPIService()) {
        self.service = service
    }
    
    func loginToServer(request:LoginRequest) {
        service.fetchUserDetails(request: request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if response.success {
                        //self?.faqs = response.data?.faqs ?? []
                            self?.onSucess?(response)
                       
                    } else {
                        //self?.errorMessage = "API returned failure"
                        self?.onError?("Failed to load data")
                    }
                case .failure(let error):
                    //self?.onError?(error.localizedDescription)
                    let message = error.localizedDescription.isEmpty ? "Unknown error occurred" : error.localizedDescription
                    self?.onError?(message)
                }
            }
        }
    }
}

