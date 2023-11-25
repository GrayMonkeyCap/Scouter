//
//  ListCard.swift
//  Scouter
//
//  Created by Akhil on 25/11/23.
//

import SwiftUI

struct ListCard: View {
    let account:Account
    init(account:Account){
        self.account = account
        self.favourite = account.favourite
    }
    @State var favourite:Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
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
                    VStack(alignment: .leading, content: {
                        Text(account.name)
                        HStack {
                            Image(systemName: "person.fill")
                            Text(account.login)
                                
                        }.font(.caption)
                    })
                }
                
                Text(account.bio ?? "")
                    .font(.caption)
            })
            Spacer()
            Button(action: {}, label: {
                if(account.favourite){
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 25,height: 25)
                }else{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 25,height: 25)
                }
            })
            
            
            
        }}
}

#Preview {
    ListCard(account: Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "John Watson", bio: "Lorem ipsum dolor sit amet",type: "Organisation",favourite: true))
}
