//
//  UserCharacterDetail.swift
//  cmpe235-homework-swiftui
//
//  Created by Lee, Hoseong on 7/12/20.
//  Copyright © 2020 Lee, Hoseong. All rights reserved.
//

import SwiftUI

struct UserCharacterDetail: View {
    let gradient = Gradient(colors: [.blue, .purple])
    var userCharacter: UserCharacter
    var body: some View {
        VStack {
            HStack {
                Spacer()
                CircleImage(image: userCharacter.image)
                    .offset(y: 90)
                Spacer()
            }
                .frame(height: 150)
            .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
            .padding(.bottom, 140)
            VStack(alignment: .leading) {
                Text(userCharacter.name)
                    .font(.title)
                HStack {
                    Text("\(userCharacter.race) \(userCharacter.className)")
                        .font(.subheadline)
                    Spacer()
                    Text("\(userCharacter.serverName) - \(userCharacter.faction)")
                        .font(.subheadline)
                  
                }
            }.padding()
            Spacer()
        }
        .navigationBarTitle(Text(userCharacter.name), displayMode: .inline)
    }
}

struct UserCharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserCharacterDetail(userCharacter: userCharacterData[0])
    }
}
