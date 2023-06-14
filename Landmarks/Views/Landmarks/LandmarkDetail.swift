//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by JOSE DANIEL CASADO on 02/06/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData : ModelData
    var landmark : Landmark
    
    var landmarkIndex : Int {
        // El signo de explamación es porque firstIndex puede regresar nil
        // y el ! forza el tipo a ser Int. Si al momento de ejecución no
        // se encuentra el id, se bloqueará la ejecución
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
            }
            .foregroundColor(Color.black)
            .padding()
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
