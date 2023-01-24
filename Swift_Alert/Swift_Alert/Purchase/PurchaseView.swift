//
//  PurchaseView.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

struct PurchaseView: View {
    
    @EnvironmentObject private var viewModel: PurchaseViewModel
    
    // MARK: Constants
    
    private enum Constants {
        static let privacyMattersTitle = "Privacy Matters"
        static let infoVPNTitle = "Protect your online activities with VPN Plus"
        static let infoAboutRate = "Vacation (7 days) 99 RUB"
        static let firstRateImageName = "7days"
        static let rateImageFrame: CGFloat = 100
        static let buttonName = "Buy"
        static let secondRateImageName = "30days"
        static let buttonFrameWidth: CGFloat = 100
        static let buttonFrameHeight: CGFloat = 50
        static let buttonCornerRadius: CGFloat = 10
        static let firstButtonTag: CGFloat = 0
        static let secondButtonTag: CGFloat = 1
        static let secondInfoAboutRate = "Standart (1 month) 179 RUB"
        static let firstIndex = 0
        static let secondIndex = 1
        static let tabItemImageName = "person.fill"
        static let tabItemText = "Purchase"
    }
    
    private var sevenDaysImageView: some View {
        Image(Constants.firstRateImageName)
            .resizable()
            .frame(
                width: Constants.rateImageFrame,
                height: Constants.rateImageFrame)
    }
    
    private var sevenDaysBuyButtonView: some View {
        Button(Constants.buttonName) {
            viewModel.index = Constants.firstIndex
        }
        .frame(
            width: Constants.buttonFrameWidth,
            height: Constants.buttonFrameHeight)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(Constants.buttonCornerRadius)
        .tag(Constants.firstButtonTag)
    }
    
    private var thirtyDaysImageView: some View {
        Image(Constants.secondRateImageName)
            .resizable()
            .frame(
                width: Constants.rateImageFrame,
                height: Constants.rateImageFrame)
    }
    
    private var thirtyDaysBuyButtonView: some View {
        Button(Constants.buttonName) {
            viewModel.index = Constants.secondIndex
        }
        .frame(
            width: Constants.buttonFrameWidth,
            height: Constants.buttonFrameHeight)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(Constants.buttonCornerRadius)
        .tag(Constants.secondButtonTag)
    }
    
    var body: some View {
        VStack {
            Section {
                Text(Constants.privacyMattersTitle)
                    .font(.largeTitle)
                Text(Constants.infoVPNTitle)
                    .padding()
                sevenDaysImageView
                Text(Constants.infoAboutRate)
                sevenDaysBuyButtonView
            }
            Spacer()
            
            Section {
                thirtyDaysImageView
                Text(Constants.secondInfoAboutRate)
                thirtyDaysBuyButtonView
            }
            Spacer()
        }
        .tabItem {
            Image(systemName: Constants.tabItemImageName)
            Text(Constants.tabItemText)
        }
    }
}
