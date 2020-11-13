//
//  Torta.swift
//  Draw
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Torta: View {
    var body: some View {
        ZStack{
            Path(){ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: CGPoint(x: 180, y: 180), radius: 150, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 200), clockwise: true)
            }.fill(Color.yellow)
            
            Path(){ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: CGPoint(x: 180, y: 180), radius: 150, startAngle: Angle(degrees: 200), endAngle: Angle(degrees: 160), clockwise: true)
            }.fill(Color.pink).offset(x: -20, y: 0)
            .overlay(
                Text("11.2%")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(x: -120, y: -185)
                    .foregroundColor(.white)
            )
            
            Path(){ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: CGPoint(x: 180, y: 180), radius: 150, startAngle: Angle(degrees: 160), endAngle: Angle(degrees: 110), clockwise: true)
            }.fill(Color.green)
            
            Path(){ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: CGPoint(x: 180, y: 180), radius: 150, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 0), clockwise: true)
            }.fill(Color.blue)
        }
    }
}

struct Dona_Previews: PreviewProvider {
    static var previews: some View {
        Torta()
    }
}
