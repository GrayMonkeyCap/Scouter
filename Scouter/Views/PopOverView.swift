//
//  PopOverView.swift
//  Scouter
//
//  Created by Akhil on 15/12/23.
//

import SwiftUI
extension ContentView{
    struct PopOverView: View {
        var account:Accounts
        @State var tagName = ""
        init(account: Accounts) {
            self.account = account
        }
        
        var body: some View {
            TextField(text: $tagName){ Text("Tag Name")}
                .padding(EdgeInsets())
            Button("Save"){
                print($tagName.wrappedValue)
            }
            .padding(EdgeInsets())
        }
    }
}
//#Preview {
//    PopOverView(account: <#T##Accounts#>)
//}
