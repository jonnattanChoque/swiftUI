//
//  CardView.swift
//  Tinder
//
//  Created by MacBook Retina on 20/12/20.
//

import SwiftUI

struct CardView: View, Identifiable {
    let id = UUID()
    let courses: Course
    
    var body: some View {
        Image(courses.imag)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .overlay(
                VStack{
                    Text(courses.name)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold).padding(.horizontal, 40)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                }.padding([.top], 20),alignment: .top
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(courses: course[0])
    }
}
