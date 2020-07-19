//
//  UserCharacterList.swift
//  cmpe235-homework-swiftui
//
//  Created by Lee, Hoseong on 7/12/20.
//  Copyright © 2020 Lee, Hoseong. All rights reserved.
//

import SwiftUI

struct UserCharacterList: View {
    var body: some View {
        NavigationView {
            List(userCharacterData) { userCharacter in
                NavigationLink(destination: UserCharacterDetail(userCharacter: userCharacter)) {
                   UserCharacterRow(userCharacter: userCharacter)
                }
            }
            .navigationBarTitle(Text("Guild Members"))
        }
    }
}

struct UserCharacterList_Previews: PreviewProvider {
    static var previews: some View {
        UserCharacterList()
    }
}
