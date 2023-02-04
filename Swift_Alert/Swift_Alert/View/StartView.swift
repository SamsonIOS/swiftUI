//
//  StartView.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Экран блокировки
struct StartView: View {
    
    // MARK: - Constants
    private enum ElementName {
        static let hiText = "Hi"
        static let welcomeText = "Welcome Back"
        static let closedCarImageName = "closed"
        static let openCarImageName = "opened"
        static let gearshapeImageName = "gearshape.fill"
        static let lockText = "Lock"
        static let unlockText = "Unlock"
        static let openImageName = "lock.open.fill"
        static let lockImageName = "lock.fill"
    }
    
    // MARK: - Public properties
    
    var body: some View {
        backgroundStackView {
            ZStack {
                VStack {
                    settingsButtonView
                        .padding(.leading, 300)
                    Spacer()
                    welcomeTextView
                    Spacer()
                    teslaImageView
                        .animation(starViewModel.isCarClose ? .easeInOut(duration: 5) : .easeIn, value: starViewModel.isCarClose)
                    Spacer()
                    closedCarControllView
                }
            }
        }
    }
    
    // MARK: - Private properties
    
    @StateObject private var starViewModel = StartViewModel()
    
    private var welcomeTextView: some View {
        VStack {
            if starViewModel.isCarClose {
                Text(ElementName.hiText)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                Text(ElementName.welcomeText)
                    .bold()
                    .font(.system(size: 40))
            } else {
                EmptyView()
            }
        }
    }
    
    private var teslaImageView: some View {
        Image(starViewModel.isCarClose ? ElementName.openCarImageName : ElementName.closedCarImageName)
            .resizable()
            .scaledToFit()
            .frame(width: starViewModel.isCarClose ? 407 : 382.5,
                   height: starViewModel.isCarClose ? 330 : 255)
            .padding(.bottom, starViewModel.isCarClose ? 0 : 55)
    }
    
    private var settingsButtonView: some View {
        NavigationLink(isActive: $starViewModel.isCarSettingsViewShown) {
            CarSettingView()
                .navigationBarBackButtonHidden(true)
        } label: {
            ZStack {
                if starViewModel.isCarClose {
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color.leftButtonThirdEllipseFirstColor.opacity(0.6), Color.leftButtonThirdEllipseSecondColor.opacity(0.8)], startPoint: .top, endPoint: .bottomTrailing)
                        )
                        .frame(width: 62)
                        .shadow(color: .white, radius: 10, x: -5, y: -5).opacity(0.5)
                        .shadow(color: .black, radius: 10, x: 5, y: 5).opacity(0.7)
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color.leftButtonSecondEllipseFirstColor.opacity(0.4), Color.leftButtonSecondEllipseSecondColor.opacity(0.5)], startPoint: .top, endPoint: .trailing)
                        )
                        .frame(width: 50)
                    Circle()
                        .stroke(
                            LinearGradient(colors: [Color.leftButtonFirstEllipseFirstColor.opacity(0.9), Color.leftButtonFirstEllipseSecondColor.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            , lineWidth: 1)
                        .frame(width: 50)
                    Image(systemName: ElementName.gearshapeImageName)
                        .frame(width: 12, height: 22)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color.leftButtonThirdEllipseFirstColor.opacity(0.1), Color.leftButtonThirdEllipseSecondColor.opacity(0.8)], startPoint: .top, endPoint: .bottomTrailing)
                        )
                        .frame(width: 62)
                        .shadow(color: .white, radius: 15, x: -10, y: -10).opacity(0.4)
                        .shadow(color: .black, radius: 15, x: 10, y: 10).opacity(0.7)
                    Circle()
                        .stroke(
                            LinearGradient(colors: [Color.leftButtonFirstEllipseFirstColor.opacity(0.7), Color.leftButtonFirstEllipseSecondColor.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            , lineWidth: 1)
                        .frame(width: 50)
                    Image(systemName: ElementName.gearshapeImageName)
                        .foregroundColor(.gray)
                        .frame(width: 12, height: 22)
                        .padding()
                }
            }
        }
    }
    
    private var closedOpenCarButton: some View {
        Circle()
            .fill(LinearGradient(
                colors: [Color.white.opacity(0.15), Color.black.opacity(0.35)],
                startPoint: .top,
                endPoint: .bottomTrailing
            ))
            .frame(width: 49)
            .overlay(Circle().stroke(
                LinearGradient(
                    colors: [Color.black.opacity(0.6), Color.white.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            ))
            .padding(.all, 0)
            .background(Circle().fill(Color.backgroundColor))
    }
    
    private var backgroundClosedCarControllView: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(Color.black.opacity(0.5))
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black.opacity(1), lineWidth: 8)
                    .blur(radius: 8)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 50).fill(LinearGradient(
                        colors: [Color.black, Color.clear],
                        startPoint: .top,
                        endPoint: .bottom)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.white.opacity(0.15), lineWidth: 8)
                    .blur(radius: 8)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 50).fill(LinearGradient(
                        colors: [Color.clear, Color.black],
                        startPoint: .top,
                        endPoint: .bottom)))
            )
            .frame(width: 165, height: 79)
    }
    
    private var closedCarTextView: some View {
        Text(starViewModel.isCarClose ? ElementName.lockText : ElementName.unlockText)
            .foregroundColor(.white)
            .frame(width: 60)
    }
    
    private var gradientForCarControllView: some View {
        LinearGradient(colors: [Color.gradientTopColor, Color.gradientBottomColor], startPoint: .top, endPoint: .bottom)
            .mask(Image(systemName: starViewModel.isCarClose ? ElementName.openImageName : ElementName.lockImageName))
            .frame(width: 44, height: 44)
    }
    
    private var closedCarControllView: some View {
        Button {
            withAnimation {
                starViewModel.isCarClose.toggle()
            }
        } label: {
            HStack {
                Label {
                    closedCarTextView
                } icon: {
                    ZStack {
                        ZStack {
                            closedOpenCarButton
                        }
                        gradientForCarControllView
                    }
                }
            }
            .padding()
            .background(
                backgroundClosedCarControllView
            )
        }
    }
    
    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            if !starViewModel.isCarClose {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors:
                                [Color.firstBackgroundClosedCar,
                                 Color.secondBackgroundClosedCar,
                                 Color.secondBackgroundClosedCar,
                                 Color.thirdBackgroundClosedCar],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                content()
            } else {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors:
                                [Color.firstBackgroundOpenCar,
                                 Color.secondBackgroundOpenCar],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                content()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environment(\.colorScheme, .dark)
    }
}
