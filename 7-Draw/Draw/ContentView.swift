//
//  ContentView.swift
//  Draw
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Path() { path in
                    path.move(to: CGPoint(x: 30, y: 30))
                    path.addLines([
                        CGPoint(x: 230, y: 30),
                        CGPoint(x: 230, y: 150),
                        CGPoint(x: 30, y: 150),
                        CGPoint(x: 30, y: 30)
                    ])
                }.fill(Color.blue)
                
                Path() { path in
                    path.move(to: CGPoint(x: 30, y: 30))
                    path.addLines([
                        CGPoint(x: 230, y: 30),
                        CGPoint(x: 230, y: 150),
                        CGPoint(x: 30, y: 150),
                        CGPoint(x: 30, y: 30)
                    ])
                    path.closeSubpath()
                }.stroke(Color.red, lineWidth: 2)
                
                Path() { path in
                    path.move(to: CGPoint(x: 30, y: 130))
                    path.addLine(to: CGPoint(x: 60, y: 130))
                    path.addQuadCurve(
                        to: CGPoint(x: 200, y: 130),
                        control: CGPoint(x: 130, y: 40)
                    )
                    path.addLines([
                        CGPoint(x: 230, y: 130),
                        CGPoint(x: 230, y: 150),
                        CGPoint(x: 30, y: 150),
                        CGPoint(x: 30, y: 130)
                    ])
                }.fill(Color.green)
                
                ZStack {
                    Path() { path in
                        path.move(to: CGPoint(x: 30, y: 30))
                        path.addLines([
                            CGPoint(x: 230, y: 30),
                            CGPoint(x: 230, y: 150),
                            CGPoint(x: 30, y: 150),
                            CGPoint(x: 30, y: 30)
                        ])
                        path.closeSubpath()
                    }.fill(Color.red)
                    Path() { path in
                        path.move(to: CGPoint(x: 30, y: 30))
                        path.addLines([
                            CGPoint(x: 230, y: 30),
                            CGPoint(x: 230, y: 150),
                            CGPoint(x: 30, y: 150),
                            CGPoint(x: 30, y: 30)
                        ])
                        path.closeSubpath()
                    }.stroke(Color.blue, lineWidth: 10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
