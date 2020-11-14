//
//  ContentView.swift
//  Modals
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@State var showModalView = false opcion 1
    @State var selectedCurso: Curso?
    
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
            List(CurseFactory.cursos.indices){ idx in
                Celda(curso: CurseFactory.cursos[idx])
                    .onTapGesture {
                        //self.showModalView = true opcion 1
                        self.selectedCurso = CurseFactory.cursos[idx]
                    }
            }
            // opcion 1
            /*.sheet(isPresented: self.$showModalView){
                if self.selectedCurso != nil{
                    DetailView(curso: self.selectedCurso!)
                }
            }*/
                
            // opcion 2
            .sheet(item: $selectedCurso){ curso in
                DetailView(curso: curso)
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
        }
    }
}


