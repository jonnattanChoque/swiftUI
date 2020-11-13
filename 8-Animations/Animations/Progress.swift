//
//  Progress.swift
//  Animations
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct Progress: View {
    @State private var progress: CGFloat = 0.3
    @State private var isComplete = false
    
    var body: some View {
        ZStack {
            Text("\(Int(progress*100))%")
                .font(.system(.title, design: .rounded)).bold()
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 12)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(isComplete ? Color.blue : Color.green, lineWidth: 12)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }.onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                self.progress += 0.01
                if self.progress >= 1.0{
                    self.isComplete = true
                    timer.invalidate()
                }
            }
        }
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}
