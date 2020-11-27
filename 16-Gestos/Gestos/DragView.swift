//
//  DragView.swift
//  Gestos
//
//  Created by MacBook Retina on 26/11/20.
//

import SwiftUI

struct DragView: View {
    @GestureState private var offSet = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "paperclip.circle.fill")
            .font(.system(size: 80))
            .foregroundColor(.purple)
            .offset(x: position.width + offSet.width, y: position.height + offSet.height)
            .gesture(
                DragGesture()
                    .updating($offSet, body: { (value, state, transaction) in
                        state = value.translation
                    })
                    .onEnded{ (value) in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    }
            )
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
