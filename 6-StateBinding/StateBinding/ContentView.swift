//
//  ContentView.swift
//  StateBinding
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var contadorPadre1 = 0
    @State private var contadorPadre2 = 0
    @State private var contadorPadre3 = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill").font(.system(size: 100, weight: .bold, design: .rounded)).foregroundColor(isPlaying ? Color.red : Color.blue)
            }
            Spacer()
            Counter(contadorHijo: $contadorPadre1, bgColor: .blue)
            Counter(contadorHijo: $contadorPadre2, bgColor: .purple)
            Counter(contadorHijo: $contadorPadre3, bgColor: .orange)
            Text("\(contadorPadre1+contadorPadre2+contadorPadre3)")
                .font(.system(size: 80, weight: .bold, design: .rounded))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Counter: View {
    @Binding var contadorHijo: Int
    var bgColor : Color
    
    var body: some View {
        Button(action: {
            self.contadorHijo += 1
        }) {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(bgColor)
                .overlay(
                    Text("\(self.contadorHijo)")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
            )
            
        }
    }
}
