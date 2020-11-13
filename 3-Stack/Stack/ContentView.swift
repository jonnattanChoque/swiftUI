//
//  ContentView.swift
//  Stack
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            HStack {
                PlanesView(title: "Básico", price: "$999", color: Color.white, bgColog: Color.green, subtitle: "Curso incluido")
                ZStack {
                    PlanesView(title: "Carrera", price: "$9999", color: Color.black, bgColog: Color.gray, subtitle: "Carrera completa")
                    Text("El mejor para empezar")
                        .font(.system(size:10, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color.green)
                    .offset(x: 0, y: -60)
                }
            }.padding(.all)
            
            ZStack {
                PlanesView(title: "Definitivo", price: "$999999", color: Color.white, bgColog: Color.black, subtitle: "Todos los cursos incluidos en este plan",icon: "lightbulb")
                Text("Conviertete en un maestro del desarrollo")
                    .font(.system(size:10, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(8)
                    .background(Color.yellow)
                .offset(x: 0, y: -80)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            //Spacer()
            VStack(alignment: .leading, spacing: 10){
                Text("Elige tu itinerario")
                    .font(.title)
                    .fontWeight(.bold)
                Text("de aprendizaje")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
        }.padding()
    }
}

struct PlanesView: View {
    var title: String
    var price: String
    var color: Color
    var bgColog : Color
    var subtitle: String
    var icon: String?
    
    var body: some View {
        VStack{
            
            //Opcion 1
            icon.map({
                Image(systemName: $0)
                .font(.largeTitle)
                .foregroundColor(.white)
            })
            
            //Opcion 2
            /*if icon != nil{
                Image(systemName: icon!)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }*/
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(color)
            Text(price)
                .font(.system(size: 35, weight:.heavy, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(color)
            Text(subtitle)
                .font(.headline)
                .foregroundColor(color)
        }
        .padding().background(bgColog).cornerRadius(10)
    }
}
