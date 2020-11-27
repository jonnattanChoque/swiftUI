//
//  CourseDetailView.swift
//  ExpandableButtonSheet
//
//  Created by MacBook Retina on 26/11/20.
//

import SwiftUI

struct CourseDetailView: View {
    var course: Course
    
    @GestureState private var dragState = DragState.none
    @State private var offset: CGFloat = 0
    @State private var cardState = CardState.half
    @Binding var isShow: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                HandlerBar()
                TitleBar(titleBar: "Detalles del curso")
                ScrollView(.vertical){
                    HeaderView(course: course)
                    DescripionView(icon: "dollarsign.circle.fill", content: "\(course.priceLevel)")
                    DescripionView(icon: nil, content: course.description)
                }.animation(nil).disabled(self.cardState == .half || self.dragState.isDragging)
            }
            .background(Color.white)
            .cornerRadius(15, antialiased: true)
            .offset(y: geometry.size.height * 0.3 + self.dragState.translaion.height + self.offset)
            .animation(.interpolatingSpring(stiffness: 100, damping: 20, initialVelocity: 10))
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating(self.$dragState, body: { (value, state, transaction) in
                        state = DragState.dragging(translation: value.translation)
                    }).onEnded({ (value) in
                        switch self.cardState {
                        case .half:
                            if value.translation.height < -0.25 * geometry.size.height{
                                self.offset = -0.2 * geometry.size.height
                                self.cardState = .full
                            }
                            
                            if value.translation.height > 0.25 * geometry.size.height{
                                self.isShow = false
                            }
                            break
                        case .full:
                            if value.translation.height > 0.25 * geometry.size.height{
                                self.offset = 0
                                self.cardState = .half
                            }
                            
                            if value.translation.height > 0.75 * geometry.size.height{
                                self.isShow = false
                            }
                            
                            break
                        }
                    })
            )
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0], isShow: .constant(true)).background(Color.gray)
    }
}

struct HandlerBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 80, height: 8)
            .foregroundColor(Color(.systemGray4))
            .cornerRadius(8)
    }
}

struct TitleBar: View {
    var titleBar: String
    var body: some View {
        Text(titleBar)
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
    }
}

struct HeaderView: View {
    var course: Course
    var body: some View {
        Image(course.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Text(course.name)
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                        Text(course.type)
                            .foregroundColor(.white)
                            .font(.system(.subheadline, design: .rounded))
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    Spacer()
                }.padding()
            )
    }
}

struct DescripionView: View {
    var icon: String?
    var content: String
    var body: some View {
        HStack{
            if icon != nil{
                Image(systemName: icon!).padding(.trailing, 10)
            }
            Text(content)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }.padding(.horizontal)
    }
}

enum CardState {
    case half
    case full
}
