//
//  ContentView.swift
//  Buttons
//
//  Created by MacBook Retina on 12/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                //Que debe hacer el boton
                print("Pulse en el boton")
            }) {
                //COmo debe verse el boton
                Text("Hola mundo")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
                    .padding(5)
                        .border(Color.black, width: 1)
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 5)
                    )
            }
            
            Button(action: {
                print("pulse aqui")
            }) {
                HStack {
                    Image(systemName: "trash")
                    Text("Eliminar")
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .bottomTrailing, endPoint: .topLeading))
                //.background(Color.red)
                //.clipShape(Circle())
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                    .shadow(color: .black, radius: 10, x: 5, y: 10)
            }
            
            Button(action: {
                print("boton 3")
            }) {
                Text("Otro botton")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    //.padding()
            }
            
            Button(action: {
                print("pulse aqui")
            }) {
                HStack {
                    Image(systemName: "square.and.pencil")
                    Text("Editar")
                }
            }.buttonStyle(BasicButtonsStyle())
            
            Button(action: {
                print("pulse aqui")
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Enviar")
                }
            }.buttonStyle(BasicButtonsStyle())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicButtonsStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding()
        .background(Color.red)
        .font(.largeTitle)
        .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
    }
}
