//
//  VPNView.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

/// Экран с данными о подключении к впн
struct StatusVPNView: View {

    // MARK: - Constants
    
    private enum Constats {
        static let imageCountryFrame: CGFloat = 250
        static let setCountryTitle = "Выбрать страну"
        static let emptyString = ""
        static let ipAddressTitle = "IP Address"
        static let ipTitle = "127.0.0.1"
        static let offset: CGFloat = 180
        static let offsetFortext: CGFloat = 140
        static let vstackSpacing: CGFloat = 10
        static let textFrameLeading: CGFloat = 130
        static let textFrameTrailing: CGFloat = 70
        static let receivedTitle = "Received"
        static let valueOfMB = "0 MB"
        static let sentTitle = "Sent"
        static let daysfOfSubscribe = "Service will expire after 15 days"
        static let textFrameWidth: CGFloat = 250
        static let textFrameHeight: CGFloat = 50
        static let tabItemImageName = "network.badge.shield.half.filled"
        static let tabItemText = "VPN"
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            countryImageView
            selectCountryPicker
            toggleView
            VStack(spacing: Constats.vstackSpacing) {
                HStack {
                    ipAddressTitleView
                    ipTitleView
                }
                
                HStack {
                    receivedTitleView
                    receivedTextView
                }
                
                HStack {
                    sentTitleView
                    sentValueView
                }
            }
            daysOfSubscribeView
        }
        .tabItem {
            Image(systemName: Constats.tabItemImageName)
            Text(Constats.tabItemText)
        }
    }
    
    // MARK: - Private properties
    @StateObject private var viewModel = StatusVPNViewModel()
    
    // MARK: - Private Methods
    
    private var countryImageView: some View {
        Image(viewModel.getCountryImage())
            .resizable()
            .frame(
                width: Constats.imageCountryFrame,
                height: Constats.imageCountryFrame)
    }
    
    private var selectCountryPicker: Picker<Text, Int, ForEach<Range<Int>, Int, Text>> {
        Picker(selection: $viewModel.index) {
            ForEach(0..<viewModel.countryFlags.count) {
                Text(viewModel.countryFlags[$0])
            }
        } label: {
            Text(Constats.setCountryTitle)
        }
    }
    
    private var toggleView: some View {
        Toggle(isOn: $viewModel.isOn) {
            Text(Constats.emptyString)
        }
        .offset(x: -Constats.offset)
    }
    
    private var ipAddressTitleView: some View {
        Text(Constats.ipAddressTitle)
            .frame(
                width: Constats.textFrameLeading,
                alignment: .leading)
            .font(.title2)
    }
    
    private var ipTitleView: some View {
        Text(Constats.ipTitle)
            .frame(
                width: Constats.textFrameTrailing,
                alignment: .trailing)
            .bold()
    }
    
    private var receivedTitleView: some View {
        Text(Constats.receivedTitle)
            .frame(
                width: Constats.textFrameLeading,
                alignment: .leading)
            .font(.title2)
    }
    
    private var receivedTextView: some View {
        Text(Constats.valueOfMB)
            .frame(
                width: Constats.textFrameTrailing,
                alignment: .trailing)
            .bold()
    }
    
    private var sentTitleView: some View {
        Text(Constats.sentTitle)
            .frame(
                width: Constats.textFrameLeading,
                alignment: .leading)
            .font(.title2)
    }
    
    private var sentValueView: some View {
        Text(Constats.valueOfMB)
            .frame(
                width: Constats.textFrameTrailing,
                alignment: .trailing)
            .bold()
    }
    
    private var daysOfSubscribeView: some View {
        Text(Constats.daysfOfSubscribe)
            .frame(
                width: Constats.textFrameWidth,
                height: Constats.textFrameHeight)
            .offset(y: Constats.offsetFortext)
    }
}
