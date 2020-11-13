//
//  ContentView.swift
//  Imagenes
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("spiderman")
            .resizable()
            .edgesIgnoringSafeArea(.all)//.all .leading etc
            .aspectRatio(contentMode: .fill)
            .scaledToFit()//.scaledToFill().scaleEffect()
            //.clipShape(Capsule())
            .opacity(0.8)
            .overlay(
                /*Image(systemName: "heart")
                .font(.system(size: 60))
                .foregroundColor(.white)
                .opacity(1)*/
                
                /*Text("Comentario de prueba dentro de la imagen")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .opacity(0.7)
                    .padding(),
                alignment: .bottom,*/
                
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.4)
                    .overlay(
                        Text("Texto dentro del recuadro")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 250)
                    )
                
            )
        
//        Image(systemName: "recordingtape")
//            .font(.system(size: 80))
//            .foregroundColor(.blue)
//            .shadow(color: .gray, radius: 4, x: 0, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
