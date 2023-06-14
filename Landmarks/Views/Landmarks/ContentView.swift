//
//  ContentView.swift
//  Landmarks
//
//  Created by JOSE DANIEL CASADO on 02/06/23.
//

import SwiftUI
import MyButton

struct ContentView: View {
    var body: some View {
        VStack {
            MyButton(name: "frog")
            LandmarksList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
