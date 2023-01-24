//
//  BacketView.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

struct BacketView: View {
    @EnvironmentObject private var viewModel: PurchaseViewModel
    @StateObject private var backetViewModel = BacketViewModel()
    
    private enum Constants {
        static let vpnImageName = "vpn"
        static let vpnImageFrameWidth: CGFloat = 400
        static let vpnImageFrameHeight: CGFloat = 250
        static let rateText = "Вы выбрали тариф:"
        static let zaText = "за"
        static let rubText = "руб."
        static let infoAboutRateOffsetY: CGFloat = 30
        static let buyText = "Купить"
        static let buttonBuyFrameWidth: CGFloat = 200
        static let buttonBuyFrameHeight: CGFloat = 20
        static let buttonBuyCornerRadius: CGFloat = 10
        static let alertTitleText = "Покупка совершена"
        static let alerOffsetY: CGFloat = 100
        static let tabItemImageName = "basket.fill"
        static let tabItemText = "Корзина"
    }
    
    var body: some View {
        VStack {
            vpnImageView
            Text(Constants.rateText)
                .font(.largeTitle)
            rateView
            buyButtonView
        }
        
        
        .tabItem {
            Image(systemName: Constants.tabItemImageName)
            Text(Constants.tabItemText)
        }
        .environmentObject(viewModel)
    }
    
    private var vpnImageView: some View {
        Image(Constants.vpnImageName)
            .resizable()
            .frame(
                width: Constants.vpnImageFrameWidth,
                height: Constants.vpnImageFrameHeight)
    }
    
    private var rateView: some View {
        Text("\(viewModel.getTarif()) \(Constants.zaText) \(viewModel.getPrice()) \(Constants.rubText)")
            .font(.title)
            .offset(y: Constants.infoAboutRateOffsetY)
    }
    
    private var buyButtonView: some View {
        Button {
            self.backetViewModel.isBuy = true
        } label: {
            Text(Constants.buyText)
                .frame(
                    width: Constants.buttonBuyFrameWidth,
                    height: Constants.buttonBuyFrameHeight)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(Constants.buttonBuyCornerRadius)
            
        }.alert(isPresented: $backetViewModel.isBuy, content: {
            Alert(title: Text(Constants.alertTitleText))
        })
        .offset(y: Constants.alerOffsetY)
    }
}
