//
//  ContentViewModel.swift
//  Scouter
//
//  Created by Akhil on 25/11/23.
//

import Foundation
import SwiftUI
extension ContentView{
    class ContentViewModel:ObservableObject{
        let dataController = DataController.shared
        var context = DataController.shared.container.viewContext
        
        func deleteAccount(at offsets:IndexSet,accountList:Array<Accounts>){
            withAnimation {
                offsets.map { accountList[$0] }.forEach(context.delete)
                dataController.saveData()
            }
        }
        
        func convertAccount(_ a:Accounts) ->Account{
            let acc = Account(login: a.login!, avatar_url: a.avatar_url!, url: a.url!, repos_url: a.repos_url!, name: a.name!, bio: a.bio ?? "", type: a.type!,favourite: a.favourite)
            print(acc)
            return acc
        }
    }
}
