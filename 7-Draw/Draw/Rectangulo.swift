//
//  Rectangulo.swift
//  Draw
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Rectangulo: View {
    var body: some View {
        VStack {
            Text("Prueba 1")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 200, height: 100)
                .background(MyRect().fill(Color.red))
            
            Text("Prueba 2")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 200, height: 100)
                .background(MyRect().fill(Color.blue))
            
            Text("Prueba 3")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 200, height: 100)
                .background(MyRect().fill(Color.green))
        }
    }
}

struct Shape_Previews: PreviewProvider {
    static var previews: some View {
        Rectangulo()
    }
}

struct MyRect: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.size.width*0.2, y: 0))
        path.addQuadCurve(
            to: CGPoint(x: rect.size.width*0.8, y: 0),
            control: CGPoint(x: rect.size.width/2, y: -(rect.size.width*0.4))
        )
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}
