//
//  DetailView.swift
//  Navigation
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
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
        .navigationBarTitle("", displayMode: .inline)
        //.edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.title)
            })
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(curso: Curso(name: "titulo de mi imagen 1", image: "spiderman"))
    }
}
