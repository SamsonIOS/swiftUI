//
//  CarSettingView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//
 
import SwiftUI

/// Экран с опциями автомобиля
struct CarSettingView: View {
    
    // MARK: - Constants
    private enum ElementsName {
        static let teslaText = "Tesla"
        static let kmText = "187 km"
        static let closeCarImageName = "closeCar"
        static let carImageName = "car"
        static let emptyString = ""
        static let closeText = "Закрыть"
        static let openText = "Открыть"
        static let lockImageName = "lock.fill"
        static let lockOpenImageName = "lock.open.fill"
    }
    // MARK: - Body
    
    var body: some View {
        backgroundStackView {
            VStack {
                headerView
                carView
                controllPanelView
                navigationLinkView
                Spacer()
                    .frame(height: 40)
                if carSettingViewModel.tagSelected == 1 {
                    closedCarControllView
                }
                Spacer()
            }
        }
    }
    
    // MARK: - Private properties
    
    @StateObject private var carSettingViewModel = CarSettingViewModel()
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(ElementsName.teslaText)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(ElementsName.kmText)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(25)
    }
     
    private var carView: some View {
        Image(carSettingViewModel.isCarClose ? ElementsName.closeCarImageName : ElementsName.carImageName)
            .resizable()
            .frame(height: 150)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            colors: [Color.gradientTopColor,
                     Color.gradientBottomColor],
            startPoint: .bottom,
            endPoint: .top)
    }
    
    private var navigationLinkView: some View {
        NavigationLink(isActive: $carSettingViewModel.isNavigationTapped) {
            ClimateView()
                .navigationBarBackButtonHidden()
        } label: {
            Text(ElementsName.emptyString)
        }
    }
    
    private var controllPanelView: some View {
        HStack(spacing: 50) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        carSettingViewModel.tagSelected = index
                    }
                    if index == 2 {
                        carSettingViewModel.isNavigationTapped.toggle()
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .neumorphismSelectedCircleStyle()
                        .overlay(
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(carSettingViewModel.tagSelected == index ? 1 : 0)
                        )
                }
            }
        }
        .frame(width: 330 ,height: 104)
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(Color.backgroundColor))
        .neumorphismUnSelectedStyle()
    }
    
    private var closedCarControllView: some View {
        Button {
            withAnimation {
                carSettingViewModel.isCarClose.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(carSettingViewModel.isCarClose ? ElementsName.closeText : ElementsName.openText)
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: carSettingViewModel.isCarClose ? ElementsName.lockOpenImageName : ElementsName.lockImageName)
                        .renderingMode(.template)
                        .neumorphismUnSelectedStyle()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(Color.backgroundColor))
            .neumorphismSelectedStyle()
        }
        .frame(width: 300)
    }
    
    // MARK: - Private methods
    
    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarSettingView()
            .environment(\.colorScheme, .dark)
    }
}
