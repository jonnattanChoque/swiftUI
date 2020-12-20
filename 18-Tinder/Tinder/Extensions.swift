//
//  Extensions.swift
//  Tinder
//
//  Created by MacBook Retina on 20/12/20.
//

import Foundation
import SwiftUI

extension AnyTransition{
    static var trailingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
