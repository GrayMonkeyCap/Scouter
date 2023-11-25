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
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 5)
                Divider()
                    .overlay(Color.yellow)
                Spacer()
                List {
                    ForEach(accountList) { account in
                        NavigationLink(destination: SearchUserView()){
                            Text("\(account)")
                        }
                        
                    }
                    .onDelete(perform: deleteAccount)
                }
                .scrollContentBackground(.hidden)
//                    ForEach() {
//                        accounts in
//                        let account = searchViewModel.convertAccount(accounts)
//                        AccountCard(account: account)
//                    }
                
                //                    NavigationLink(destination:SearchUserView()) {
                //                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                //                            Image(systemName: "plus")
                //                                .resizable()
                //                                .frame(width: 40,height: 40)
                //                                .foregroundColor(.yellow)
                //
                //                        })
                //                    }
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
                    Button(action: {}, label: {
                        Text("Edit").bold().foregroundStyle(Color.yellow)
                    })
                }
            }
        }.tint(.yellow)
    }
    //    body {
    //        NavigationView {
//                List {
//                    ForEach(items) { item in
//                        NavigationLink {
//                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                        } label: {
//                            Text(item.timestamp!, formatter: itemFormatter)
//                        }
//                    }
//                    .onDelete(perform: deleteItems)
//                }
    //            .toolbar {
    //                ToolbarItem(placement: .navigationBarTrailing) {
    //                    EditButton()
    //                }
    //                ToolbarItem {
    //                    Button(action: addItem) {
    //                        Label("Add Item", systemImage: "plus")
    //                    }
    //                }
    //            }
    //            Text("Select an item")
    //        }
    //    }
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    func deleteAccount(at indexSet:IndexSet){
        contentViewModel.deleteAccount(at: indexSet, accountList: accountList)
    }
}


#Preview {
    ContentView()
//        .environment(\.managedObjectContext, dataController.container.viewContext)
}

