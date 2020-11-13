//
//  ContentView.swift
//  first_app
//
//  Created by MacBook Retina on 11/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.")
            .fontWeight(.bold)
            .font(.system(size: 30, design: .rounded))
            //.font(.title)
            //.underline()
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .lineLimit(nil).truncationMode(.head).lineSpacing(8)
            .padding()
            //.rotationEffect(.degrees(45), anchor: UnitPoint(x: 0, y: 0))
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .yellow, radius: 1, x: 2, y: 8)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
