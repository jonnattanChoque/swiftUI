//
//  IndicadorCarga.swift
//  Animations
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct IndicadorCarga: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 10)
                .frame(width: 250, height: 250)
            Circle()
                .trim(from: 0.0, to: 0.85)
                .stroke(Color.green, lineWidth: 8)
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            .onAppear(){
                self.isLoading = true
            }
        }
    }
}

struct IndicadorCarga_Previews: PreviewProvider {
    static var previews: some View {
        IndicadorCarga()
    }
}
