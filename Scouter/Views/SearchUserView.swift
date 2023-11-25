//
//  SearchUserView.swift
//  Scouter
//
//  Created by Akhil on 11/11/23.
//

import SwiftUI

struct SearchUserView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var searchViewModel = SearchViewModel()
    @State var searchText = ""
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("LaunchScreenBackgroundColor", bundle: Bundle.main).ignoresSafeArea()
                VStack{
                    Spacer().frame(height: 2)
                    Divider()
                        .overlay(.yellow)
                    if let account = searchViewModel.searchedAccount{
                        AccountCard(account: account,saveAction:{ searchViewModel.saveAccount()
                            dismiss()
                        })
                    }else{
                        Text("Search User...")
                            .font(.system(size: 38))
                            .foregroundStyle(.yellow)
                            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    
                }
                
            }.searchable(text: $searchText, placement: .automatic)
                .onSubmit(of: .search) {
                     searchViewModel.getAccount(searchText)
                    
                }
                .foregroundStyle(.yellow)
                .tint(.yellow)
                
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Add Account")
                        .foregroundStyle(.yellow)
                        .font(.title)
                }
            }

        }
    }
}

#Preview {
    SearchUserView()
}
