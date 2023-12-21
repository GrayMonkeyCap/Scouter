//
//  SearchedAccountCard.swift
//  Scouter
//
//  Created by Akhil on 15/11/23.
//

import SwiftUI

struct AccountCard: View {
    let account:Account
    let saveAction : ()->Void
    init(account: Account,saveAction:@escaping ()->Void) {
        self.account = account
        self.saveAction = saveAction
    }
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImage(url: URL(string: account.avatar_url)){ phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "photo")
                            .frame(width: 60, height: 60)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 60, maxHeight: 60)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: 60, height: 60)
                    @unknown default:
                        EmptyView()
                            .frame(width: 60, height: 60)
                    }
                }
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(50)
                Spacer()
                Text(account.name ?? "")
                    .font(.title)
                
                
            }
            Text(account.bio ?? "")
                .font(.title2)
            Text(account.login)
                .font(.title3)
            Text(account.type)
                .font(.footnote)
            Button(action: saveAction, label: {
                Text("Save")
            })
            
        }
        .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50)))
        .background(Color("Grayish", bundle: Bundle.main))
        .foregroundStyle(.yellow)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
    }
}

#Preview {
    AccountCard(account: Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "John Watson", bio: "Lorem ipsum dolor sit amet",type: "Organisation",favourite: true),saveAction: {
        print("Save")
    })
}
