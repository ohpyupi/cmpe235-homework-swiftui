//
//  UserCharacterDetail.swift
//  cmpe235-homework-swiftui
//
//  Created by Lee, Hoseong on 7/12/20.
//  Copyright © 2020 Lee, Hoseong. All rights reserved.
//

import SwiftUI
import CoreML
import Vision

struct UserCharacterDetail: View {
    @State private var predirectedRace = "Unknown";
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
                    Text("\(predirectedRace) \(userCharacter.className)")
                        .font(.subheadline)
                    Spacer()
                    Text("\(userCharacter.serverName) - \(userCharacter.faction)")
                        .font(.subheadline)
                  
                }
            }.padding()
            Spacer()
        }
        .navigationBarTitle(Text(userCharacter.name), displayMode: .inline)
        .onAppear() {
            self.predictCharacterRace(imageName: self.userCharacter.imageName)
        }
    }
    
    func predictCharacterRace(imageName: String) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let cgImage = ImageStore.loadImage(name: imageName)
                func handlePredirection(request: VNRequest, error: Error?) {
                    let results = request.results as? [VNClassificationObservation]
                    let topPredictedRace = results?[0]
                    self.predirectedRace = topPredictedRace!.identifier
                }
                let model = try VNCoreMLModel(for: WowCharacterRace().model)
                let request = VNCoreMLRequest(model: model, completionHandler: handlePredirection)
                let handler = VNImageRequestHandler(cgImage: cgImage)
                try handler.perform([request])
            } catch {
                fatalError("Something went wrong")
            }
        }
    }
}

struct UserCharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserCharacterDetail(userCharacter: userCharacterData[0])
    }
}
