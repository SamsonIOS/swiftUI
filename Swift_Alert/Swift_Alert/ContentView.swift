//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

/// Экран профиля пользователя
struct ContentView: View {
    
    private enum Constants {
        static let balanceTitle = "Баланс: "
        static let cardTitle = "Карта: "
        static let facialTitle = "Лицевой счет: "
        static let profileTitle = "Профиль"
        static let addBalance = "Пополнить баланс"
        static let chooseBalance = "Выберите баланс зачисления"
        static let addCard = "Пополнить карту"
        static let addFacial = "Пополнить лицевой счет"
        static let succesBalance = "Баланс успешно пополнен!"
        static let openFacial = "Открыть счет"
        static let errorTitle = "Ошибка"
        static let okTitle = "OK"
        static let failureTitle = "Невозможно создать счет"
        static let transferFacialToFacial = "Перевод между счетами"
        static let succesTitle = "Успешно"
        static let cardToFacial = "С карты на лицевой счет"
        static let facialToCard = "Со счета на карту"
        static let spacerHeigth: CGFloat = 500
        static let offSetTrue: CGFloat = 250
        static let offSetFalse: CGFloat = 0
        static let viewCornerRadius: CGFloat = 10
        static let vstackSpacing: CGFloat = 10
        static let rub = "руб."
        static let animationSpring: CGFloat = 0.3
        static let dampingFraction: CGFloat = 0.9
        static let blendDuration: CGFloat = 0.4
        static let randomMoney = 10...5000
    }
    
    @State private var balance = 0
    @State private var walletFirst = 0
    @State private var walletSecond = 0
    @State private var isOnToggle = false
    @State private var isClick = false
    @State private var isOpenBankAccountShown = false
    @State private var isAddMoneyShown = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack(spacing: Constants.vstackSpacing, content: {
                        Text("\(Constants.balanceTitle)\(balance) \(Constants.rub)")
                        Text("\(Constants.cardTitle)\(walletFirst) \(Constants.rub)")
                        Text("\(Constants.facialTitle)\(walletSecond) \(Constants.rub)")
                        Spacer()
                        payBag
                        extractedFunc
                        addMoney
                        Spacer()
                            .frame(height: Constants.spacerHeigth)
                    }).padding()
                    Spacer()
                }
                Spacer()
                RoundedRectangle(cornerRadius: Constants.viewCornerRadius)
                    .fill(.yellow)
                    .offset(x: isOnToggle ? Constants.offSetTrue : Constants.offSetFalse)
            }
            Toggle(isOn: $isOnToggle) {
                Text(Constants.profileTitle)
            }.padding()
        }.animation(
            .spring(
                response: Constants.animationSpring,
                dampingFraction: Constants.dampingFraction,
                blendDuration: Constants.blendDuration),
            value: isOnToggle)
    }
    
    private var payBag: some View {
        Button {
            self.isClick = true
        } label: {
            Text(Constants.addBalance)
        }.confirmationDialog(Constants.chooseBalance, isPresented: $isClick) {
            Button(Constants.addCard, role: .destructive) {
                walletFirst += .random(in: Constants.randomMoney)
                balance = walletFirst + walletSecond
            }
            Button(Constants.addFacial, role: .destructive) {
                walletSecond += .random(in: Constants.randomMoney)
                balance = walletSecond + walletFirst
            }
        } message: {
            Text(Constants.succesBalance)
        }
    }
    
    private var extractedFunc: some View {
        Button {
            self.isOpenBankAccountShown = true
        } label: {
            Text(Constants.openFacial)
        }.alert(Text(Constants.errorTitle), isPresented: $isOpenBankAccountShown) {
            Button(Constants.okTitle, role: .cancel) {}
        } message: {
            Text(Constants.failureTitle)
        }
    }
    
    private var addMoney: some View {
        Button {
            self.isAddMoneyShown = true
        } label: {
            Text(Constants.transferFacialToFacial)
        }.alert(Text(Constants.succesTitle), isPresented: $isAddMoneyShown) {
            Button(Constants.cardToFacial, role: .destructive) {}
            Button(Constants.facialToCard, role: .destructive) {}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
