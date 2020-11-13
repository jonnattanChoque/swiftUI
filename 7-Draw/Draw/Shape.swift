//
//  Shape.swift
//  Draw
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Rectangulo: View {
    var body: some View {
        MyRect().fill(Color.red)
    }
}

struct Shape_Previews: PreviewProvider {
    static var previews: some View {
        Rectangulo()
    }
}

struct MyRect: Rectangulo {
    func path(in rect: CGRect) -> Path {
        
    }
}
