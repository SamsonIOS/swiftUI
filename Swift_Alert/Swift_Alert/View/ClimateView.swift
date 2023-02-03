//
//  SettingsACView.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Экран с настройками климат-контроля машины
struct ClimateView: View {
    
    // MARK: - Constanst
    private enum ElementsName {
        static let ventImageName = "door"
        static let ventText = "Vent"
        static let emptyString = ""
        static let acOnOffImageName = "power"
        static let acOnOffText = "A/C is ON"
        static let bottomSheetText = "Tap to turn off or swipe up for a fast setup"
        static let chevronBackImageName = "chevron.backward"
        static let gearshapeImageName = "gearshape.fill"
        static let climateText = "CLIMATE"
        static let disclousureGroupName = "Settings"
        static let acText = "Ac"
        static let acImageName = "snowflake"
        static let fanText = "Fan"
        static let fanImageName = "wind"
        static let heatText = "Heat"
        static let heatImageName = "humidity.fill"
        static let autoText = "Auto"
        static let autoImageName = "timer"
        static let tempterature = "° C"
        static let teslaSupportLink = "https://www.tesla.com/support"
        static let closeButtonText = "Close"
        static let linkImageName = "link"
        static let switchOffText = "Off"
        static let switchOnText = "On"
    }
    
    // MARK: - Body
    var body: some View {
        backgroundStackView {
            ZStack {
                VStack {
                    headerView
                    Spacer()
                    progressView
                    if climateViewModel.isAlertShown {
                        alertView
                            .offset(y: -300)
                    } else {
                        EmptyView()
                    }
                    Spacer()
                    climateSettingsView
                    Spacer()
                }
                bottomSheetView
            }
        }
    }
    
    // MARK: - Private properties
    @StateObject private var climateViewModel = ClimateViewModel()
    
    private var bottomSheetView: some View {
           BottomSheetView {
               VStack {
                   bottomSheetCapsuleView
                   Spacer()
                   HStack {
                       bottomSheetTextView
                       Spacer()
                       acIsOnButtonView
                   }
                   .padding(.horizontal)
                   HStack(spacing: -20) {
                       onButtonView
                       VStack {
                           stepperView
                           colorPickerView
                               .offset(x: -10)
                       }
                       ventButtonView
                   }
                   .padding(.top)
                   Spacer(minLength: 240)
               }
           }
       }
    
    private var ventButtonView: some View {
            VStack {
                Button {} label: {
                    Image(ElementsName.ventImageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                }
                Text(ElementsName.ventText)
                    .offset(y: 30)
            }
        }
    
    private var onButtonView: some View {
            VStack {
                Button {
                    climateViewModel.isPowerButtonSelected.toggle()
                } label: {
                    if climateViewModel.isPowerButtonSelected {
                        LinearGradient(
                            colors: [Color.gradientTopColor,
                                     Color.gradientBottomColor],
                            startPoint: .top,
                            endPoint: .bottom)
                            .mask(Image(
                                systemName: ElementsName.acOnOffImageName)
                                .resizable())
                            .frame(width: 24, height: 24)
                            
                    } else {
                        Image(systemName: ElementsName.acOnOffImageName)
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 24, height: 24)
                    }
                        
                }
                if climateViewModel.isPowerButtonSelected {
                    LinearGradient(
                        colors: [Color.gradientTopColor,
                                 Color.gradientBottomColor],
                        startPoint: .top,
                        endPoint: .bottom)
                    .mask(Text(ElementsName.switchOffText))
                        .frame(width: 26, height: 24)
                        .offset(y: 30)
                } else {
                    Text(climateViewModel.isPowerButtonSelected ? ElementsName.switchOffText : ElementsName.switchOnText)
                                        .frame(width: 26, height: 24)
                                      .offset(y: 30)
                }
            }
        }
    
    private var stepperView: some View {
           CustomStepperView(
               value: Binding(
                   get: {
                       Int(climateViewModel.acValue)
                   },
                   set: { newValue in
                       climateViewModel.getStepperValue(newValue)
                   }
               )
           )
       }
    
    private var colorPickerView: some View {
            VStack {
                ColorPicker(ElementsName.emptyString, selection: $climateViewModel.color)
            }
            .frame(width: 45)
            .padding(.top, -10)
        }
    
    private var acIsOnButtonView: some View {
            Button {
                climateViewModel.isPowerButtonSelected.toggle()
            } label: {
                Image(systemName: ElementsName.acOnOffImageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 20,
                           height: 20)
                    .padding(25)
                    .background(RoundedRectangle(cornerRadius: 50)
                    .fill(
                        LinearGradient(
                            colors: [Color.gradientTopColor,
                                     Color.gradientBottomColor],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    ))
                    .overlay {
                        Circle()
                            .stroke(
                                LinearGradient(
                                    colors: [Color.gradientTopColor,                    Color.gradientBottomColor],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing), lineWidth: 2
                            )
                    }
                    .neumorphismUnSelectedStyle()
            }
            .padding([.top, .leading], -20)
    }
    
    private var bottomSheetTextView: some View {
            VStack(alignment: .leading) {
                Text(ElementsName.acOnOffText)
                    .font(.system(size: 20, weight: .semibold))
                Text(ElementsName.bottomSheetText)
                    .font(.system(size: 18))
                    .frame(width: 250, height: 50)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                    .padding(.top, -10)
            }
        }
    
    private var bottomSheetCapsuleView: some View {
            Capsule()
                .fill(.gray)
                .frame(width: 80, height: 3)
                .padding(.top)
        }
    
    private var headerView: some View {
        HStack {
            NavigationButton(actionHandler: {
                climateViewModel.isTap.toggle()
            }, iconName: ElementsName.chevronBackImageName).foregroundColor(.gray)
            .padding()
            Spacer()
            Text(ElementsName.climateText)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
            NavigationButton(actionHandler: {
                climateViewModel.isAlertShown.toggle()
            }, iconName: ElementsName.gearshapeImageName).foregroundColor(.gray)
            .padding()
        }
    }
    
    private var climateSettingsView: some View {
        DisclosureGroup(isExpanded: $climateViewModel.settings) {
            VStack {
                settingsOfClimateView(
                    text: ElementsName.acText,
                    imageName: ElementsName.acImageName,
                    sliderValue: $climateViewModel.acValue)
                settingsOfClimateView(
                    text: ElementsName.fanText,
                    imageName: ElementsName.fanImageName,
                    sliderValue: $climateViewModel.fanValue)
                settingsOfClimateView(
                    text: ElementsName.heatText,
                    imageName: ElementsName.heatImageName,
                    sliderValue: $climateViewModel.heatValue)
                settingsOfClimateView(
                    text: ElementsName.autoText,
                    imageName: ElementsName.autoImageName,
                    sliderValue: $climateViewModel.autoValue)
            }
        } label: {
            HStack {
                Text(ElementsName.disclousureGroupName)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .accentColor(.white)
        .padding()
    }
    
    private var progressView: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.firstCircleBackground,
                                 Color.secondCircleBackground],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
                .frame(width: 168.2)
                .shadow(color: Color.white.opacity(0.2), radius: 40, x: -25, y: -20)
                .shadow(color: Color.black.opacity(0.6), radius: 50, x: 25, y: 20)
            Circle()
                .trim(from: 0, to: climateViewModel.acValue / 15)
                .stroke(
                    LinearGradient(colors: [Color.gradientTopColor,
                                            Color.gradientBottomColor.opacity(0.5)],
                                   startPoint: .bottomTrailing,
                                   endPoint: .top), lineWidth: 15)
                .frame(width: 172)
                .rotationEffect(.degrees(-90))
                .shadow(color: Color.gradientTopColor, radius: 6)
                
            Circle()
                .fill(
                LinearGradient(
                    colors: [Color.secondCircleBackground.opacity(0.4),
                             Color.internalBackgroundColor],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                )
                .frame(width: 119.25)
            if climateViewModel.isPowerButtonSelected {
                Text("\(climateViewModel.calculateActualTemperature()) \(ElementsName.tempterature)")
                    .font(.system(size: 28.7, weight: .semibold))
            } else {
                EmptyView()
            }
        }
    }
    
    private var alertView: some View {
           VStack {
               if let url = URL(string: ElementsName.teslaSupportLink) {
                   Link(destination: url) {
                       Image(systemName: ElementsName.linkImageName)
                           .resizable()
                           .frame(width: 50, height: 50)
                   }
                   Button(ElementsName.closeButtonText) {
                       withAnimation(.linear) {
                           climateViewModel.isAlertShown.toggle()
                       }
                   }
                   .foregroundColor(.white)
               }
           }
           .background(Circle()
               .fill(Color.backgroundColor)
               .frame(width: 100, height: 100)
           )
       }
    
    // MARK: - Private methods
    
    private func settingsOfClimateView(text: String, imageName: String, sliderValue: Binding<Double>) -> some View {
           HStack {
               Text(text)
                   .font(.system(size: 17, weight: .semibold))
                   .frame(width: 50)
               Button {
                   climateViewModel.isPowerButtonSelected.toggle()
               } label: {
                   ZStack {
                       Circle()
                           .fill(LinearGradient(
                            colors: [Color.white.opacity(0.15), Color.black.opacity(0.35)],
                            startPoint: .top,
                            endPoint: .bottomTrailing
                           ))
                           .frame(width: 50)
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
                       
                           .shadow(color: Color.lightShadow.opacity(0.2), radius: 3, x: 4)
                           .shadow(color: Color.darkShadow.opacity(0.2), radius: 3)
                       if climateViewModel.isPowerButtonSelected {
                           LinearGradient(colors: [Color.gradientTopColor, Color.gradientBottomColor], startPoint: .top, endPoint: .bottom)
                               .mask(Image(systemName: imageName))
                               .frame(width: 44, height: 44)
                       } else {
                           Image(systemName: imageName)
                       }
                   }
               }
               Slider(value: sliderValue,
                      in: 0...15,
                      step: 1)
               .frame(width: 220)
           }
       }
    
    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.teslaBackgroundFirstColor,
                                 Color.teslaBackgroundSecondColor],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
}

struct SettingsACView_Previews: PreviewProvider {
    static var previews: some View {
        ClimateView()
    }
}
