//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

/// Экран настроек телефона
struct ContentView: View {
    
    private enum Constants {
        static let switchOn = "Вкл."
        static let switchOff = "Выкл."
        static let connect = "Подключено"
        static let disconnect = "Не подключено"
        static let lionImageName = "lion"
        static let userName = "Samson"
        static let firstButtonTitle = "Apple ID, iCloud, контент и покупки"
        static let secondButtonTitle = "Предложения Apple ID"
        static let firstRedCircleImage = "4.circle.fill"
        static let thirdButtonTitle = "IOS 16.2: уже доступно"
        static let secondRedCircleImage = "1.circle.fill"
        static let airplaneImageName = "airplane"
        static let airplaneButtonTitle = "Авиарежим"
        static let wifiImageName = "wifi"
        static let wifiButtonTitle = "Wi-Fi"
        static let bluethoothImageName = "blute"
        static let bluethoothButtonTitle = "Bluethooth"
        static let operatorImageName = "antenna.radiowaves.left.and.right"
        static let operatorButtonTitle = "Сотовая связь"
        static let hotspotImageName = "personalhotspot"
        static let hotspotButtonTitle = "Режим модема"
        static let vpnImageName = "network.badge.shield.half.filled"
        static let vpnButtonTitle = "VPN"
        static let navigationBarTitle = "Настройки"
    }
    
    private enum Values {
        static let frameWidth: CGFloat = 30
        static let frameHeigth: CGFloat = 30
        static let imageWidth: CGFloat = 75
        static let imageHeight: CGFloat = 75
        static let cornerRadius: CGFloat = 3
        static let imageCornerRadius: CGFloat = 50
        static let imageOffsetX: CGFloat = -65
        static let padding: CGFloat = 1
    }
    
    @State private var section = 0
    @State private var sectionWifi = 0
    @State private var switchWifi = [Constants.disconnect, Constants.connect]
    @State private var switchOnOff = [Constants.switchOn, Constants.switchOff]
    @State private var isOnFly = false
    @State private var isOnVPN = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $sectionWifi) {
                    } label: {
                        Image(Constants.lionImageName)
                            .frame(
                                width: Values.imageWidth,
                                height: Values.imageHeight)
                            .cornerRadius(Values.imageCornerRadius)
                        Spacer()
                        VStack {
                            Text(Constants.userName)
                                .font(.title2)
                                .padding(Values.padding)
                                .offset(x: Values.imageOffsetX)
                            Text(Constants.firstButtonTitle)
                                .font(.caption)
                        }
                    }.pickerStyle(.navigationLink)
                    
                    Picker(Constants.secondButtonTitle, selection: $switchOnOff) {
                        Image(systemName: Constants.firstRedCircleImage)
                            .foregroundColor(.red)
                    }.pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker(Constants.thirdButtonTitle, selection: $switchOnOff) {
                        Image(systemName: Constants.secondRedCircleImage)
                            .foregroundColor(.red)
                    }.pickerStyle(.navigationLink)
                }
                
                Section {
                    HStack {
                        Image(systemName: Constants.airplaneImageName)
                            .frame(
                                width: Values.frameWidth,
                                height: Values.frameHeigth)
                            .background(.orange)
                            .cornerRadius(Values.cornerRadius)
                            .foregroundColor(.white)
                        Toggle(isOn: $isOnFly) {
                            Text(Constants.airplaneButtonTitle)
                        }
                    }
                    
                    Picker(selection: $sectionWifi) {
                        ForEach(0..<switchWifi.count) {
                            Text(self.switchWifi[$0])
                        }
                    } label: {
                        Image(systemName: Constants.wifiImageName)
                            .frame(
                                width: Values.frameWidth,
                                height: Values.frameHeigth)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(Values.cornerRadius)
                        Text(Constants.wifiButtonTitle)
                    }.pickerStyle(.navigationLink)
                    
                    
                    Picker(selection: $section) {
                        ForEach(0..<switchOnOff.count) {
                            Text(self.switchOnOff[$0])
                        }
                    } label: {
                        Image(Constants.bluethoothImageName)
                            .frame(
                                width: Values.frameWidth,
                                height: Values.frameHeigth)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(Values.cornerRadius)
                        Text(Constants.bluethoothButtonTitle)
                    }.pickerStyle(.navigationLink)
                    
                    Picker(selection: $section) {
                    } label: {
                        Image(systemName: Constants.operatorImageName)
                            .frame(
                                width: Values.frameWidth,
                                height: Values.frameHeigth)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(Values.cornerRadius)
                        Text(Constants.operatorButtonTitle)
                    }.pickerStyle(.navigationLink)
                    
                    Picker(selection: $section) {
                        ForEach(0..<switchOnOff.count) {
                            Text(self.switchOnOff[$0])
                        }
                    } label: {
                        Image(systemName: Constants.hotspotImageName)
                            .frame(
                                width: Values.frameWidth,
                                height: Values.frameHeigth)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(Values.cornerRadius)
                        Text(Constants.hotspotButtonTitle)
                    }.pickerStyle(.navigationLink)
                    HStack {
                        Image(systemName: Constants.vpnImageName)
                            .frame(
                                width: Values.frameWidth,
                                height: Values.frameHeigth)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(Values.cornerRadius)
                        Toggle(isOn: $isOnVPN) {
                            Text(Constants.vpnButtonTitle)
                        }
                    }
                }
            }.navigationBarTitle(Constants.navigationBarTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
