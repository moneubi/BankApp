//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by DIFA SGMA on 13/10/2022.
//  Copyright © 2022 MBAYE Libasse. All rights reserved.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM: AccountSummaryViewModel = AccountSummaryViewModel()
    
    var body: some View {
        
        VStack{
            
            GeometryReader{ g in
                VStack{
                    AccountListView(accounts: self.accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(self.accountSummaryVM.total)")
                    Spacer()
                }
            }
        }
        .onAppear{
            
            self.accountSummaryVM.getAllAccounts()
        }
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
