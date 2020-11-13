//
//  ContentView.swift
//  Scroll
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ScrollView(.vertical){
                Header()
                CardsHorizont()
                CardsHorizont()
                CardsHorizont()
                CardsHorizont()
            }.background(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardsHorizont: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Curso 1 de programación", price: "$11.99", oldPrice: "$111.99").frame(width:300)
                Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Diseño 2 de programación", price: "$11.99", oldPrice: "$111.99").frame(width:300)
                Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Curso 3 de programación", price: "$11.99", oldPrice: "$111.99").frame(width:300)
                Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Diseño 4 de programación", price: "$11.99", oldPrice: "$111.99").frame(width:300)
            }
            Spacer()
        }
    }
}
