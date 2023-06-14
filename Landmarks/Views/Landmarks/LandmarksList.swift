//
//  LandmarksList.swift
//  Landmarks
//
//  Created by JOSE DANIEL CASADO on 02/06/23.
//

import SwiftUI

struct LandmarksList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }.navigationTitle("Landmarks")
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE (3rd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarksList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarksList()
            .environmentObject(ModelData())
    }
}
