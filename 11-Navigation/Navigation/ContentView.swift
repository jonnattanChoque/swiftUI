//
//  ContentView.swift
//  Navigation
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var cursos = [
        Curso(name: "Imagen 1", image: "spiderman"),
        Curso(name: "Imagen 2", image: "spiderman"),
        Curso(name: "Imagen 3", image: "spiderman"),
        Curso(name: "Imagen 4", image: "spiderman"),
        Curso(name: "Imagen 5", image: "spiderman"),
        Curso(name: "Imagen 6", image: "spiderman"),
        Curso(name: "Imagen 7", image: "spiderman")
    ]
    
    init() {
        let apariencia = UINavigationBarAppearance()
        apariencia.largeTitleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 32)!,
            .foregroundColor: UIColor.systemGreen
        ]
        apariencia.titleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 18)!,
            .foregroundColor: UIColor.systemGreen
        ]
        apariencia.setBackIndicatorImage(UIImage(systemName: "arrow.left.circle.fill"), transitionMaskImage: UIImage(systemName: "arrow.left.circle"))
        
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().standardAppearance = apariencia
        UINavigationBar.appearance().compactAppearance = apariencia
        UINavigationBar.appearance().scrollEdgeAppearance = apariencia
    }
    var body: some View {
        NavigationView {
            List(cursos.indices){ idx in
                ZStack {
                    NavigationLink(destination: DetailView(curso: self.cursos[idx])) {
                        Celda(curso: self.cursos[idx])
                    }
                }.background(Color.blue)
            }
            .navigationBarTitle("Mi listado con texto muy grande", displayMode: .automatic)//.inline .large
        }
    }
}

struct ListaImagenes_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
                .frame(width: 50, height: 50, alignment: .center)
                .clipped()
                .cornerRadius(25)
            Text(curso.name)
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundColor(.blue)
                .frame(width: 150, height: 50)
        }.background(Color.yellow)
    }
}
