//
//  LandmarkRow.swift
//  cmpe235-homework-swiftui
//
//  Created by Lee, Hoseong on 7/12/20.
//  Copyright © 2020 Lee, Hoseong. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[0])
    }
}
