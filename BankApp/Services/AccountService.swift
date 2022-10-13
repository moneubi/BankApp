//
//  AccountService.swift
//  BankApp
//
//  Created by DIFA SGMA on 13/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case decodingError
    case noData
}

class AccountService{
    
    private init() { }
    
    static let shared = AccountService()
    
    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void){
        
        guard let url = URL.urlForAccounts() else{
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else{
                return completion(.failure(.decodingError))
            }
            completion(.success(accounts))
        }.resume()
    }
}
