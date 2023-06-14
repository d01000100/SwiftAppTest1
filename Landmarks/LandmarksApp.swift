//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by JOSE DANIEL CASADO on 02/06/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
