//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by DIFA SGMA on 13/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import Foundation

class AccountSummaryViewModel: ObservableObject{
    
    private var _accountModels = [Account]()
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    
    var total: Double{
        _accountModels.map{ $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts(){
        
        AccountService.shared.getAllAccounts{ result in
            
            switch result{
                
                case .success(let accounts):
                    if let accounts = accounts{
                        self._accountModels = accounts
                        DispatchQueue.main.async {
                            self.accounts = accounts.map(AccountViewModel.init)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}

class AccountViewModel{
    
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var accountId: String{
        account.id.uuidString
    }
    
    var name: String{
        account.name
    }
    
    var balance: Double{
        account.balance
    }
    
    var accountType: String{
        account.accountype.title
    }
}
