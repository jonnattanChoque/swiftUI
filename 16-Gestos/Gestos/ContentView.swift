//
//  ContentView.swift
//  Gestos
//
//  Created by MacBook Retina on 26/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var hasPressed = false
    @GestureState private var hasLongPressed = false
    
    var body: some View {
        Image(systemName: "paperclip.circle.fill")
            .font(.system(size: 150))
            .foregroundColor(.purple)
            .opacity(hasPressed ? 0.5 : 1.0)
            .scaleEffect(hasPressed ? 2.0 : 1.0)
            .gesture(
                LongPressGesture(minimumDuration: 2.0)
                //TapGesture()
                    .updating($hasLongPressed, body: { (value, state, transaction) in
                        state = value
                    })
                    .onEnded{ _ in
                        print("HOla")
                        self.hasPressed.toggle()
                    }
            ).animation(.easeIn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
