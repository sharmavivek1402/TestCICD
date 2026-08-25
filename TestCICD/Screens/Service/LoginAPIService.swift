//
//  LoginAPIService.swift
//  TestCaseDemo
//
//  Created by Vivek_Ios on 08/05/26.
//

import Foundation

class LoginAPIService {
    func fetchUserDetails(request:LoginRequest,completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        guard let url = URL(string: "https://dev-api.connected-path.com/auth/login") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
