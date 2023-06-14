//
//  ButtonStyle.swift
//  Landmarks
//
//  Created by JOSE DANIEL CASADO on 13/06/23.
//

import Foundation
import SwiftUI

public enum ButtonColor {
    case primary
    case secondary
    case tertiary
}

struct FrogButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        DefaultButton(configuration: configuration)
    }
    
    private struct DefaultButton : View {
        
        let configuration: ButtonStyle.Configuration
        var label : ButtonStyle.Configuration.Label { configuration.label }
        var isPressed : Bool { configuration.isPressed }
        @Environment(\.isEnabled) var isEnabled: Bool
        
        var backgroundColor : Color {
            if (!isEnabled) {
                return Color.gray
            } else if (isPressed) {
                return Color.purple
            } else {
                return Color.blue
            }
        }
        
        var body : some View {
            HStack {
                Spacer()
                label
                Spacer()
            }
            .font(.system(.title, design: .rounded, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(backgroundColor)
            }
            // .scaleEffect(x: configuration.isPressed ? 0.96 : 1, y: configuration.isPressed ? 0.96 : 1)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
        }
    }
}

struct FrogButtonStyle_Preview: PreviewProvider {
    static var previews: some View {
        Button {} label: {
            Text("I am a themed button")
        }.buttonStyle(FrogButtonStyle())
    }
}
