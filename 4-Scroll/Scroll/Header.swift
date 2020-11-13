//
//  Header.swift
//  Scroll
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            Text("Jonnattan Choque").font(.largeTitle).fontWeight(.black).padding()
            Text("Programador Web").font(.title).underline()
            Text("Valid Colombia").font(.system(size: 20, weight: .heavy, design: .rounded)).fontWeight(.bold).padding()
        }.background(Color.gray)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
