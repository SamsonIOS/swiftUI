//
//  CustomTabBarView.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

// Кастомный табвью
struct CustomTabView<Content: View>: View {
    
    // MARK: - Public Properties
    
    @Binding var selection: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            content
            CustomTabViewBackground()
                .fill(Color.black)
                .shadow(color: .gray, radius: 3)
                .ignoresSafeArea()
            HStack {
                tabsView
            }
        }
        .onPreferenceChange(TabItemPreferenceKey.self) { value in
            customTabViewModel.tabs = value
        }
    }

    // MARK: - Private Properties
    
    @StateObject private var customTabViewModel = CustomTabViewModel()

    @Namespace private var tabBarItem
    
    private var content: Content
    
    private var tabsView: some View {
        ForEach(Array(customTabViewModel.tabs.enumerated()), id: \.offset) { index, element in
            Spacer()
            VStack(spacing: 5) {
                Image(systemName: element.icon)
                    .font(.system(size: 20))
                    .foregroundColor(.tabBarItem)
            }
            .foregroundColor(selection == index ? .black : .gray)
            .background(
                ZStack {
                    if selection == index {
                        Circle()
                            .fill(Color.gradientTopColor)
                            .blur(radius: 10)
                            .opacity(0.4)
                            .frame(width: 45, height: 45)
                            .matchedGeometryEffect(
                                id: Constants.tabBarItemIdentifierText,
                                in: tabBarItem
                            )
                    }
                }
            )
            .onTapGesture {
                withAnimation {
                    selection = index
                }
            }
            Spacer()
        }
    }

    // MARK: - Init
    
    public init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environment(\.colorScheme, .dark)
    }
}
