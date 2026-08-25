//
//  FAQViewModel.swift
//  TestCaseDemo
//
//  Created by Vivek_Ios on 08/05/26.
//

import Foundation

class FAQViewModel {
    
    //var faqs: [FAQItem] = []
    
    var onFaqLoaded: ((FAQ) -> Void)?
    var onError: ((String) -> Void)?
    
    private let service: FAQAPIService
    
    init(service: FAQAPIService = FAQAPIService()) {
        self.service = service
    }
    
    func fetchFAQDataFromServer() {
        service.fetchFAQs { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if response.success {
                        //self?.faqs = response.data?.faqs ?? []
                        if let faq = response.data {
                            self?.onFaqLoaded?(faq)
                        }
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
