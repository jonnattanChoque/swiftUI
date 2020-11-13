//
//  PackMan.swift
//  Draw
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct PackMan: View {
    var body: some View {
        VStack {
            Path(){ path in
                path.move(to: CGPoint(x: 150, y: 150))
                path.addArc(center: CGPoint(x: 150, y: 150), radius: 60, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: true)
            }
            
            Path(){ path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addArc(center: CGPoint(x: 180, y: 180), radius: 150, startAngle: Angle(degrees: -45), endAngle: Angle(degrees: 45), clockwise: true)
            }.fill(Color.yellow)
        }
    }
}

struct PackMan_Previews: PreviewProvider {
    static var previews: some View {
        PackMan()
    }
}
