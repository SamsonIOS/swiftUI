//
//  CharchingView.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

/// Экран зарядки авто
struct ChargingView: View {
    
    // MARK: - Public Methods
    
    var body: some View {
        backgroundStackView {
            VStack {
                headerView
                carImageView
                Spacer(minLength: 120)
                VStack(spacing: 10) {
                    progressView
                    progressViewPercentageTextView
                    chargeLimitView
                }
                superChargerDisclosureGroupView
            }
        }
    }

    // MARK: - Private Properties
    
    @StateObject private var chargingViewModel = ChargingViewModel()

    private var progressView: some View {
        VStack {
            HStack(spacing: 2) {
                Text("\(Int(chargingViewModel.chargeSliderValue))")
                    .font(.system(size: 35, weight: .semibold))
                Text(Constants.percentText)
                    .padding(.top, 10)
                    .foregroundColor(.gray)
            }
            ZStack {
                CustomChargeProgressViewShape()
                    .fill(
                        LinearGradient(
                            colors: [.white.opacity(0.4), .clear, .white.opacity(0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .background(
                        CustomChargeProgressViewShape()
                            .fill(
                                Color.gradientTopColor
                            )
                            .opacity(0.2)
                            .scaleEffect(
                                x: chargingViewModel.chargeSliderValue / 100,
                                y: 3,
                                anchor: .leading
                            )
                            .blur(radius: 12)
                            .padding(.bottom, 20)
                    )
                    .padding(.bottom, 190)

                CustomChargeProgressViewShape()
                    .fill(
                        LinearGradient(
                            colors: [.gradientTopColor, .gradientBottomColor],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .scaleEffect(
                        x: chargingViewModel.chargeSliderValue / 100,
                        anchor: .leading
                    )
                    .clipShape(CustomChargeProgressViewShape())
                    .padding(.bottom, 190)

                CustomChargeProgressViewShape()
                    .fill(
                        Color.gradientBottomColor
                    )
                    .opacity(0.3)
                    .blur(radius: 12)
                    .scaleEffect(y: 2, anchor: .bottom)
                    .padding(.bottom, 240)
                    .padding(.trailing, 119)
            }
        }
        .frame(width: 274, height: 39)
    }

    private var superChargerDisclosureGroupView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white.opacity(0.2), lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    LinearGradient(
                                        colors: [.black, .clear],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black.opacity(0.7), lineWidth: 4)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                                .mask(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(
                                            LinearGradient(
                                                colors: [.black, .clear],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                )
                        )
                        .frame(width: 338, height: 130)
                )
            HStack {
                Text(Constants.nearbySuperchargersText)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                Button {} label: {
                    Image(systemName: Constants.chevronDownImageName)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20)
                }
                .neumorhismNavigationCircleButtonUnselected()
            }
        }
        .offset(y: -50)
    }

    private var progressViewPercentageTextView: some View {
        HStack(spacing: 25) {
            VStack {
                Rectangle()
                    .foregroundColor(.gradientTopColor)
                    .frame(width: 2, height: 9)
                    .padding(.leading, 31)
                Text(Constants.seventhyFivePercentText)
            }
            .padding(.leading, 100)
            VStack {
                Rectangle()
                    .foregroundColor(.gradientTopColor)
                    .frame(width: 2, height: 9)
                    .padding(.leading, 31)
                Text(Constants.oneHundredPersentText)
            }
        }
        .padding(.leading, 80)
        .offset(y: -50)
    }

    private var chargeLimitView: some View {
        VStack {
            CustomSliderView(sliderValue: $chargingViewModel.chargeSliderValue)
                .frame(height: 9)
                .frame(width: 275)
            Text(Constants.chargeLimitText)
                .foregroundColor(.gray)
        }
        .offset(y: -50)
    }

    private var carImageView: some View {
        Image(Constants.teslaOnSideImageName)
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom, 40)
    }

    private var headerView: some View {
        HStack {
            backButtonView
            Spacer()
            screenNameTextView
            Spacer()
            settingsButtonView
        }
    }

    private var screenNameTextView: some View {
        Text(Constants.chargingScreenNameText)
            .font(.system(size: 20, weight: .semibold))
    }

    private var backButtonView: some View {
        Button {} label: {
            Image(Constants.chevronBack)
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .frame(width: 20, height: 20)
        }
        .neumorhismNavigationCircleButtonUnselected()
    }

    private var settingsButtonView: some View {
        Button {} label: {
            Image(Constants.gearshapeImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
        .neumorhismNavigationCircleButtonUnselected()
    }
}

// MARK: - Private Methods
private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
    ZStack {
        Rectangle()
            .fill(Color.backgroundColor)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .edgesIgnoringSafeArea(.all)
        content()
    }
}

struct ChargingView_Previews: PreviewProvider {
    static var previews: some View {
        ChargingView()
            .environment(\.colorScheme, .dark)
    }
}
