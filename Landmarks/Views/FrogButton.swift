//
//  Button.swift
//  Landmarks
//
//  Created by JOSE DANIEL CASADO on 12/06/23.
//

import SwiftUI

struct FrogButton: View {
    var body: some View {
        Button {} label: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .buttonStyle(FrogButtonStyle())
        .shadow(radius: 4)
        .disabled(false)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        FrogButton()
    }
}
