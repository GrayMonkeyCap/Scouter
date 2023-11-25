//
//  ContentView.swift
//  Scouter
//
//  Created by Akhil on 11/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    @FetchRequest(sortDescriptors: []) var accountList: FetchedResults<Accounts>
    @State var favourites = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 5)
                Divider()
                    .overlay(Color.yellow)
                List {
                    ForEach(accountList) { account in
                        NavigationLink(destination: SearchUserView()){
                            let listAccount = contentViewModel.convertAccount(account as! Accounts)
                            ListCard(account: listAccount)
                        }
                        .listRowBackground(
                                            RoundedRectangle(cornerRadius: 10)
                                                .background(.clear)
                                                .foregroundColor(Color("Grayish", bundle: Bundle.main))
                                                .padding(
                                                    EdgeInsets(
                                                        top: 2,
                                                        leading: 0,
                                                        bottom: 3,
                                                        trailing: 0
                                                    )
                                                ))
                        .foregroundStyle(.yellow)
                        
                    }
                    .onDelete(perform: deleteAccount)
                }
                .scrollContentBackground(.hidden)

                NavigationLink(destination: SearchUserView()) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.yellow)
                }
                
            }
            .background(Color("LaunchScreenBackgroundColor", bundle: Bundle.main))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("Brand", bundle: Bundle.main)
                        .resizable()
                        .frame(width: 160)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {favourites.toggle()}, label: {
                        switch favourites{
                        case false:
                            Text("View Favourites ").bold().foregroundStyle(Color.yellow)
                        case true:
                            Text("View All ").bold().foregroundStyle(Color.yellow)
                        }
                        
                    })
                }
            }
        }.tint(.yellow)
    }
    
    func deleteAccount(at indexSet:IndexSet){
        contentViewModel.deleteAccount(at: indexSet, accountList: accountList)
    }
}


#Preview {
    ContentView()
        .environment(\.managedObjectContext, DataController.shared.container.viewContext)
}

