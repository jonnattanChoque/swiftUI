//
//  ContentView.swift
//  Lists
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*List {
            ForEach(1...5,id: \.self){ index in
                Text("Fila \(index)")
            }
        }*/
        List(1...5,id: \.self){ index in
            Text("Fila \(index)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
