//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

/// Экран с выбором машин
struct CarsView: View {
    
    // MARK: Constants
    private enum Constants {
        static let carsTextOffsetY: CGFloat = 50
        static let priceOffsetY: CGFloat = 70
        static let spacerForPriceTitle: CGFloat = 100
        static let carsImageFrameWidth: CGFloat = 300
        static let carsImageFrameHeight: CGFloat = 200
        static let carsImagePadding: CGFloat = 80
        static let colorFrameWidth: CGFloat = 120
        static let colorFrameHeight: CGFloat = 90
        static let colorCornerRadius: CGFloat = 15
        static let offsetX: CGFloat = 140
        static let offsetY: CGFloat = -100
        static let speedImageName = "speed"
        static let imageFrame: CGFloat = 40
        static let textOffsetY: CGFloat = -75
        static let imageOffsetY: CGFloat = -115
        static let zeroForFrame: CGFloat = 0
        static let fiftyOffsetY: CGFloat = 50
        static let formFrameHeight: CGFloat = 130
        static let formOffsetY: CGFloat = 20
        static let spacerForFormHeight: CGFloat = 10
        static let spacerForSegmentHeight: CGFloat = 140
        static let seatsImageName = "car-seat"
        static let pistonImageName = "piston"
        static let typeOfBuy = "Тип покупки"
        static let complectationTitle = "Комплектация"
        static let emptyString = ""
        static let testDriveTitle = "Тест-Драйв"
        static let testDriveNotAccessTitle = "Тест Драйв недоступен"
        static let sharedTitle = "Поделится"
        static let modelCarTitle = "Марка -"
        static let valueOfSeats = "Кол-во мест -"
        static let powerOfEngine = "Мощность двигателя -"
        static let priceTitle = "Цена -"
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    carNameView
                    priceTitleView
                    Spacer()
                        .frame(height: Constants.spacerForPriceTitle)
                    carImageView
                    HStack {
                        ZStack {
                            Section {
                                speedColorView
                                speedImageView
                                speedTextView
                            }
                            
                            Section {
                                seatsColorView
                                seatsImageView
                                seatsTextView
                            }
                            
                            Section {
                                pistonColorView
                                pistonImageView
                                pistonTextView
                            }
                            
                            Form {
                                typeOfBuyPickerView
                                typeOfComplectationPickerView
                                
                            }
                            .scrollDisabled(true)
                                .frame(height: Constants.formFrameHeight)
                                .offset(y: Constants.formOffsetY)
                        }
                    }
                    Spacer()
                        .frame(height: Constants.spacerForFormHeight)
                    segmentControlView
                    Spacer()
                        .frame(height: Constants.spacerForSegmentHeight)
                    testDriveButtonView
                    sharedButtonView
                }
            }
        }
    }
    
    // MARK: - Private Properties
    
    @State private var segmentIndex = 0
    @State private var isToggle = false
    @State private var segmentBuy = 0
    @State private var isTapOnButtonShown = false
    @State private var isThirdShown = false
    @State private var segmentComplectation = 0
    
    private var complectation = ["Люкс", "Базовая", "Спорт", "Комфорт+"]
    private var buy = ["Кредит", "Наличные"]
    private var cars = ["AUDI", "BWM", "LEXUS"]
    private var price = ["20.000$", "25.000$", "30.000$"]
    private var parameters = ["450 km/h", "320 km/h", "280 km/h"]
    private var carSeats = ["2 seats", "4 seats", "4 seats"]
    private var carHoursePower = ["320 HP", "560 HP", "249 HP"]
    private var carsImageName = ["audi", "bmw", "lexus"]
    
    // MARK: - Private Methods
    
    private var speedColorView: some View {
        Color.purple
            .frame(
                width: Constants.colorFrameWidth,
                height: Constants.colorFrameHeight)
            .cornerRadius(Constants.colorCornerRadius)
            .offset(
                x: -Constants.offsetX,
                y: Constants.offsetY)
    }
    
    private var speedImageView: some View {
        Image(Constants.speedImageName)
            .resizable()
            .frame(
                width: Constants.imageFrame,
                height: Constants.imageFrame)
            .cornerRadius(Constants.colorCornerRadius)
            .offset(
                x: -Constants.offsetX,
                y: Constants.imageOffsetY)
    }
    
    private var speedTextView: some View {
        Text("\(parameters[segmentIndex])")
            .offset(
                x: -Constants.offsetX,
                y: Constants.textOffsetY)
    }
    
    private var seatsColorView: some View {
        Color.purple
            .frame(
                width: Constants.colorFrameWidth,
                height: Constants.colorFrameHeight)
            .cornerRadius(Constants.colorCornerRadius)
            .offset(
                x: Constants.zeroForFrame,
                y: Constants.offsetY)
    }
    
    private var seatsImageView: some View {
        Image(Constants.seatsImageName)
            .resizable()
            .frame(
                width: Constants.imageFrame,
                height: Constants.imageFrame)
            .cornerRadius(Constants.colorCornerRadius)
            .offset(
                x: Constants.zeroForFrame,
                y: Constants.imageOffsetY)
    }
    
    private var seatsTextView: some View {
        Text("\(carSeats[segmentIndex])")
            .offset(
                x: Constants.zeroForFrame,
                y: Constants.textOffsetY)
    }
    
    private var pistonColorView: some View {
        Color.purple
            .frame(
                width: Constants.colorFrameWidth,
                height: Constants.colorFrameHeight)
            .cornerRadius(Constants.colorCornerRadius)
            .offset(
                x: Constants.offsetX,
                y: Constants.offsetY)
    }
    
    private var pistonImageView: some View {
        Image(Constants.pistonImageName)
            .resizable()
            .frame(
                width: Constants.imageFrame,
                height: Constants.imageFrame)
            .cornerRadius(Constants.colorCornerRadius)
            .offset(
                x: Constants.offsetX,
                y: Constants.imageOffsetY)
    }
    
    private var pistonTextView: some View {
        Text("\(carHoursePower[segmentIndex])")
            .offset(
                x: Constants.offsetX,
                y: Constants.textOffsetY)
    }
    
    private var typeOfBuyPickerView: some View {
        Picker(selection: $segmentBuy) {
            ForEach(0..<buy.count) {
                Text(buy[$0])
            }
        } label: {
            Text(Constants.typeOfBuy)
        }.pickerStyle(.navigationLink)
    }
    
    private var typeOfComplectationPickerView: some View {
        Picker(selection: $segmentComplectation) {
            ForEach(0..<complectation.count) {
                Text(complectation[$0])
            }
        } label: {
            Text(Constants.complectationTitle)
        }.pickerStyle(.navigationLink)
    }
    
    private var carNameView: some View {
        Text("\(cars[segmentIndex])")
            .font(.largeTitle)
            .fontDesign(.monospaced)
            .offset(y: Constants.carsTextOffsetY)
    }
    
    private var priceTitleView: some View {
        Text("\(price[segmentIndex])")
            .font(.title)
            .offset(y: Constants.priceOffsetY)
    }
    
    private var carImageView: some View {
        Image("\(carsImageName[segmentIndex])")
            .resizable()
            .frame(
                width: Constants.carsImageFrameWidth,
                height: Constants.carsImageFrameHeight)
            .padding(Constants.carsImagePadding)
    }
    
    private var segmentControlView: some View {
        Picker(selection: $segmentIndex,
               label: Text(Constants.emptyString)) {
            ForEach(Int(Constants.zeroForFrame)..<cars.count) {
                Text(self.cars[$0])
                    .foregroundColor(.purple)
            }
        }
         .pickerStyle(SegmentedPickerStyle())
         .background(Color.purple)
         .offset(y: Constants.fiftyOffsetY)
    }
    
    private var testDriveButtonView: some View {
        Button {
            self.isTapOnButtonShown  = true
        } label: {
            Text(Constants.testDriveTitle)
        }
        .alert(isPresented: $isTapOnButtonShown) {
            Alert(title: Text(Constants.testDriveNotAccessTitle))
        }
        .offset(y: -Constants.fiftyOffsetY)
    }
    
    private var sharedButtonView: some View {
        Button(action: {
            self.isThirdShown = true
        }, label: { Text(Constants.sharedTitle)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
        })
        .sheet(isPresented: $isThirdShown) {
            ActivityView(activityItems:[
                "\(Constants.typeOfBuy)\(buy[segmentBuy])",
                "\(Constants.modelCarTitle)\(cars[segmentIndex])",
                "\(Constants.valueOfSeats)\(carSeats[segmentIndex])",
                "\(Constants.powerOfEngine)\(carHoursePower[segmentIndex])",
                "\(Constants.priceTitle)\(price[segmentIndex])",
                "\(Constants.complectationTitle)\(complectation[segmentComplectation])"])
        }
        .offset(y: -Constants.fiftyOffsetY)
    }
}

/// Отображение экрана с машинами
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
