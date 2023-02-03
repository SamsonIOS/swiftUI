//
//  Extension + View.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Выбор модификатора с тенями
extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
    
    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismSelectedCircle())
    }

    func neumorhismNavigationCircleButtonUnselected() -> some View {
        modifier(NeumorhismNavigationCircleButtonUnselected())
    }
}
