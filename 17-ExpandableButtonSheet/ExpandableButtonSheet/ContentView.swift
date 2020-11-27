//
//  ContentView.swift
//  ExpandableButtonSheet
//
//  Created by MacBook Retina on 26/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showCourseDetail: Bool = false
    @State private var selectedCourse: Course?
    
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    ForEach(courses){ course in
                        BasicRow(course: course)
                            .onTapGesture {
                                self.showCourseDetail = true
                                self.selectedCourse = course
                            }
                    }
                }.navigationTitle("Cursos 1").font(.title)
            }.animation(.easeIn(duration: 0.5)).offset(y: self.showCourseDetail ? -150 : 0)
            
            if showCourseDetail{
                BlankelView(color: .gray).opacity(0.5).onTapGesture {
                    self.showCourseDetail = false
                }
                self.selectedCourse.map {
                    CourseDetailView(course: $0, isShow: $showCourseDetail).transition(.move(edge: .bottom))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

struct BasicRow: View {
    var course: Course
    
    var body: some View{
        HStack{
            Image(course.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .cornerRadius(10)
            Text(course.name)
        }
    }
}

struct BlankelView: View {
    var color: Color
    
    var body: some View{
        VStack{
            Spacer()
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, maxHeight: .infinity).background(color).edgesIgnoringSafeArea(.all)
    }
}
