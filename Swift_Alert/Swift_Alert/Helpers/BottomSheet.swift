//
//  BottomSheet.swift
//  Swift_Alert
//
//  Created by coder on 02.02.2023.
//

import SwiftUI

/// Универсальный боттомшит
struct BottomSheetView<Content: View>: View {

    // MARK: - Public Propeties
    
    let contentClosure: () -> Content

    var body: some View {
        ZStack {
            contentClosure()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .background(
                    .ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 10))
                .ignoresSafeArea(.all, edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 2 + 100)
                .offset(y: bottomSheetViewModel.currentMenuOffsetY)
                .gesture(dragGesture)
        }
        .ignoresSafeArea(edges: .top)
    }

// MARK: - Private Properties
    
    @GestureState private var gestureOffset = CGSize.zero

    @StateObject private var bottomSheetViewModel = BottomSheetViewModel()

    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, _ in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { _ in
                bottomSheetViewModel.getOffsetY()
            }
    }

    // MARK: - Private Methods
    
   private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            bottomSheetViewModel.currentMenuOffsetY = gestureOffset.height + bottomSheetViewModel.lastMenuOffsetY
        }
    }

}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView {
            VStack {
                Capsule()
                    .fill(.white)
                    .frame(width: 80, height: 3)
                    .padding(.top)
                ForEach(0..<4) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(height: 100)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}
