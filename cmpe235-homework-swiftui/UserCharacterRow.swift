//
//  UserCharacterRow.swift
//  cmpe235-homework-swiftui
//
//  Created by Lee, Hoseong on 7/12/20.
//  Copyright © 2020 Lee, Hoseong. All rights reserved.
//

import SwiftUI

struct UserCharacterRow: View {
    var userCharacter: UserCharacter
    var body: some View {
        HStack {
            userCharacter.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(userCharacter.name)
            Spacer()
        }
    }
}

struct UserCharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        UserCharacterRow(userCharacter: userCharacterData[0])
    }
}
