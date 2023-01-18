//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

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
    }
    
    @State var balance = 0
    @State var walletFirst = 0
    @State var walletSecond = 0
    @State var isOnToggle = false
    @State var isClick = false
    @State var isOpenBankAccount = false
    @State var isAddMoney = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack(spacing: Constants.vstackSpacing, content: {
                        Text("\(Constants.balanceTitle)\(balance) \(Constants.rub)")
                        Text("\(Constants.cardTitle)\(walletFirst) \(Constants.rub)")
                        Text("\(Constants.facialTitle)\(walletSecond) \(Constants.rub)")
                        Spacer()
                        payBag()
                        extractedFunc()
                        addMoney()
                        Spacer().frame(height: Constants.spacerHeigth)
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
        }.animation(.spring(response: Constants.animationSpring, dampingFraction: Constants.dampingFraction, blendDuration: Constants.blendDuration), value: isOnToggle)
    }
    
    fileprivate func payBag() -> some View {
        return Button {
            self.isClick = true
        } label: {
            Text(Constants.addBalance)
        }.confirmationDialog(Constants.chooseBalance, isPresented: $isClick) {
            Button(Constants.addCard, role: .destructive) {
                walletFirst += .random(in: 10...5000)
                balance = walletFirst + walletSecond
            }
            Button(Constants.addFacial, role: .destructive) {
                walletSecond += .random(in: 10...5000)
                balance = walletSecond + walletFirst
            }
        } message: {
            Text(Constants.succesBalance)
        }
    }
    
    fileprivate func extractedFunc() -> some View {
        return Button {
            self.isOpenBankAccount = true
        } label: {
            Text(Constants.openFacial)
        }.alert(Text(Constants.errorTitle), isPresented: $isOpenBankAccount) {
            Button(Constants.okTitle, role: .cancel) {}
        } message: {
            Text(Constants.failureTitle)
        }
    }
    
    fileprivate func addMoney() -> some View {
        return Button {
            self.isAddMoney = true
        } label: {
            Text(Constants.transferFacialToFacial)
        }.alert(Text(Constants.succesTitle), isPresented: $isAddMoney) {
            Button(Constants.cardToFacial, role: .destructive) {
            }
            Button(Constants.facialToCard, role: .destructive) {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
