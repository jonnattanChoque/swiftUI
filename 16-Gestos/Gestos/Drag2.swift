//
//  Drag2.swift
//  Gestos
//
//  Created by MacBook Retina on 26/11/20.
//

import SwiftUI

struct Drag2: View {
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "paperclip.circle.fill")
            .font(.system(size: 80))
            .foregroundColor(.purple)
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translaion.width, y: position.height + dragState.translaion.height)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { (value, state, transaction) in
                        switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                        }
                    })
                    .onEnded{ (value) in
                        guard case .second(true, let drag?) = value else {return}
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    }
            )
    }
}

struct Drag2_Previews: PreviewProvider {
    static var previews: some View {
        Drag2()
    }
}

