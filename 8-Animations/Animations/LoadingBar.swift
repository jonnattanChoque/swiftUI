//
//  LoadingBar.swift
//  Animations
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct LoadingBar: View {
    @State private var loading = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemGray4), lineWidth: 6)
                .frame(width: 300, height: 5)
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.green, lineWidth: 6)
                .frame(width: 50, height: 5)
                .offset(x: loading ? 125 : -125, y: 0)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            .onAppear(){
                    self.loading = true
            }
        }
    }
}

struct LoadingBar_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBar()
    }
}
