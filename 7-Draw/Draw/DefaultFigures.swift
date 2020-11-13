//
//  DefaultFigures.swift
//  Draw
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct DefaultFigures: View {
    var body: some View {
        Circle()
            .foregroundColor(.green)
            .frame(width: 200, height: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
            .frame(width: 80, height: 80)
                .foregroundColor(.white)
        )
    }
}

struct DefaultFigures_Previews: PreviewProvider {
    static var previews: some View {
        DefaultFigures()
    }
}
