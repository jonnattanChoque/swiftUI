//
//  TransformFigure.swift
//  Animations
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct TransformFigure: View {
    @State private var animBegin = false
    @State private var circle = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: animBegin ? 30 : 10)
                .frame(width: animBegin ? 60 : 250, height: 60)
                .foregroundColor(animBegin ? .blue : .green)
            .overlay(
                Image(systemName: "keyboard")
                    .font(.system(.largeTitle))
                    .foregroundColor(.white)
                    .scaleEffect(circle ? 0.5 : 1.0)
            )
            
            RoundedRectangle(cornerRadius: animBegin ? 40 : 20)
                .trim(from: 0, to: animBegin ? 0 : 1)
                .stroke(lineWidth: 8)
                .frame(width: animBegin ? 80 : 270, height: 80)
                .foregroundColor(animBegin ? .blue : .green)
        }.onTapGesture {
            withAnimation(Animation.spring()){
                self.animBegin.toggle()
            }
            withAnimation(Animation.spring().repeatForever().delay(0.25)){
                self.circle.toggle()
            }
        }
    }
}

struct TransformFigure_Previews: PreviewProvider {
    static var previews: some View {
        TransformFigure()
    }
}
