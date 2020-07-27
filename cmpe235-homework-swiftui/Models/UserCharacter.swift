//
//  UserCharacter.swift
//  cmpe235-homework-swiftui
//
//  Created by Lee, Hoseong on 7/12/20.
//  Copyright © 2020 Lee, Hoseong. All rights reserved.
//

import Foundation
import SwiftUI

struct UserCharacter: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var faction: String
    var race: String
    var className: String
    var serverName: String
    var imageName: String
}


extension UserCharacter {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
