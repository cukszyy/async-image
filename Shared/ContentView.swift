//
//  ContentView.swift
//  Shared
//
//  Created by Lucas Portella Santos on 21/04/22.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL), scale: 3.0, transaction: .init(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            if let image = phase.image {
                image
                    .fitImage()
                    .transition(.scale)
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill")
                    .setAsIcon()
                    .foregroundColor(.red)
                    .transition(.scale)
            } else {
                Image(systemName: "photo.circle.fill")
                    .setAsIcon()
                    .foregroundColor(.cyan)
            }
        }
    }
}

extension Image {
    func fitImage() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func setAsIcon() -> some View {
        self
            .fitImage()
            .frame(maxWidth: 128)
            .opacity(0.7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
