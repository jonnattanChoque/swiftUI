//
//  Delay.swift
//  Animations
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Delay: View {
    @State private var isLoading = false
    var body: some View {
        HStack {
            ForEach(0...5, id: \.self){ index in
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.blue)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(Animation.linear(duration: 0.5).repeatForever().delay(Double(index)/6))
            }
        }.onAppear(){
            self.isLoading = true
        }
    }
}

struct Delay_Previews: PreviewProvider {
    static var previews: some View {
        Delay()
    }
}
