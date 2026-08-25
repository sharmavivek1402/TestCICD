//
//  FAQAPIService.swift
//  TestCaseDemo
//
//  Created by Vivek_Ios on 08/05/26.
//

import Foundation

class FAQAPIService {
    func fetchFAQs(completion: @escaping (Result<FAQModel, Error>) -> Void) {
        guard let url = URL(string: "https://dev-api.connected-path.com/auth/faq") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(FAQModel.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
