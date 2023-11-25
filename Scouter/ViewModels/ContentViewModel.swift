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
        
        var context = DataController.shared.container.viewContext
        
        func deleteAccount(at offsets:IndexSet,accountList:FetchedResults<Accounts>){
            withAnimation {
                offsets.map { accountList[$0] }.forEach(context.delete)
                }
        }
    }
}
