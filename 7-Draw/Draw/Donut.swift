//
//  Donut.swift
//  Draw
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Donut: View {
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: 0.3)
                .stroke(Color(.brown), lineWidth: 60)
            Circle()
                .trim(from: 0.30, to: 0.50)
                .stroke(Color(.systemPink), lineWidth: 60)
            
            Circle()
                .trim(from: 0.50, to: 0.75)
                .stroke(Color(.orange), lineWidth: 60)
            
            Circle()
                .trim(from: 0.75, to: 1.0)
                .stroke(Color(.systemGreen), lineWidth: 65)
                .shadow(color: .gray, radius: 10, x: -70, y: 20)
                .overlay(
                    Text("25%").font(.system(size: 25, weight: .bold, design: .rounded)).foregroundColor(.white).offset(x: 70, y: -70)
                )
        }.frame(width: 200, height: 200, alignment: .center)
    }
}

struct Dougnu_Previews: PreviewProvider {
    static var previews: some View {
        Donut()
    }
}
