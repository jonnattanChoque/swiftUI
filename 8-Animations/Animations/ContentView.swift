//
//  ContentView.swift
//  Animations
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var btnColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 180, height: 180, alignment: .center)
                .foregroundColor(btnColorChanged ? Color(.systemGray4) : .green)
            Image(systemName: "keyboard")
                .font(.system(size: 70, weight: .bold, design: .rounded))
                .foregroundColor(btnColorChanged ? .green : Color(.systemGray6))
                .scaleEffect(iconSizeChanged ? 1.0 : 0.5)
        }.onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.5)){
                self.btnColorChanged.toggle()
                self.iconColorChanged.toggle()
                self.iconSizeChanged.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
