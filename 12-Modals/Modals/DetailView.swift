//
//  DetailView.swift
//  Modals
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    var curso : Curso
    
    var body: some View {
        VStack {
            Image(curso.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            Text(curso.name)
                .font(.system(size: 30, weight: .black, design: .rounded))
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        //self.presentationMode.wrappedValue.dismiss()
                        
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 90)
                    .padding(.top, 30)
                    Spacer()
                }
            }
        ).alert(isPresented: $showAlert) {
            Alert(
                title: Text("Cuidado"),
                message: Text("Estas a punto de salir"),
                primaryButton: .default(Text("Si"), action: {self.presentationMode.wrappedValue.dismiss()}),
                secondaryButton: .cancel()
            )
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(curso: Curso(name: "titulo de mi imagen 1", image: "spiderman"))
    }
}
