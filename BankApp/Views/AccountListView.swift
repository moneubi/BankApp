//
//  AccountListView.swift
//  BankApp
//
//  Created by DIFA SGMA on 13/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import SwiftUI

struct AccountListView: View {
    
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.accountId){ account in
            
            AccountCell(account: account)
        }
    }
}

struct AccountCell: View{
    
    let account: AccountViewModel
    
    var body: some View{
        
        HStack{
            
            VStack(alignment: .leading, spacing: 10){
                
                Text(account.name)
                    .font(.headline)
                
                Text(account.accountType)
                    .opacity(0.5)
            }
            Spacer()
            
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(Color.green)
        }
    }
}
