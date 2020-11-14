//
//  ContentView.swift
//  Transitions
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showCard = false
    
    var body: some View {
        VStack {
            if !showCard{
                Rectangle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.orange)
                .overlay(
                    Text("Car")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
            }
            if showCard{
                Rectangle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.purple)
                .overlay(
                    Text("Carro")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
                .animation(.default)
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
        }.onTapGesture {
            withAnimation(Animation.spring()){
                self.showCard.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition{
    static var scaleOffsetOpacity: AnyTransition{
        AnyTransition.scale(scale: 0, anchor: .bottom).combined(with: .offset(x: -700, y: 0)).combined(with: .opacity)
    }
}
