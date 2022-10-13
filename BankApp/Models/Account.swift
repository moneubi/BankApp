//
//  Account.swift
//  BankApp
//
//  Created by DIFA SGMA on 13/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import Foundation

enum AccountType: String, Codable, CaseIterable{
    case checking
    case saving
}

extension AccountType{
    
    var title: String{
        
        switch self{
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}

struct Account: Codable{
    
    var id: UUID
    var name: String
    var accountype: AccountType
    var balance: Double
}
