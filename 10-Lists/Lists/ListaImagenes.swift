//
//  ListaImagenes.swift
//  Lists
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ListaImagenes: View {
    var cursosName = ["Imagen 1", "Imagen 2", "Imagen 3", "Imagen 4"]
    var cursosImage = ["spiderman", "spiderman", "spiderman", "spiderman"]
    
    var cursos = [
        Curso(name: "Imagen 1", image: "spiderman"),
        Curso(name: "Imagen 2", image: "spiderman"),
        Curso(name: "Imagen 3", image: "spiderman"),
        Curso(name: "Imagen 4", image: "spiderman"),
        Curso(name: "Imagen 5", image: "spiderman"),
        Curso(name: "Imagen 6", image: "spiderman"),
        Curso(name: "Imagen 7", image: "spiderman")
    ]
    var body: some View {
//        List(cursos, id: \.id){ curso in
//            CeldaFull(curso: curso)
//        }
        
        List(cursos.indices){ idx in
            if idx % 2 == 0{
                CeldaFull(curso: self.cursos[idx])
            }else{
                Celda(curso: self.cursos[idx])
            }
        }
    }
}

struct ListaImagenes_Previews: PreviewProvider {
    static var previews: some View {
        ListaImagenes()
    }
}

struct Curso: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct Celda: View {
    var curso : Curso
    var body: some View {
        HStack {
            Image(curso.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(25)
            Text(curso.name)
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundColor(.blue)
        }
    }
}

struct CeldaFull: View {
    var curso : Curso
    var body: some View {
        ScrollView {
            ZStack {
                Image(curso.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray)
                            .opacity(0.6)
                    )
                Text(curso.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}
