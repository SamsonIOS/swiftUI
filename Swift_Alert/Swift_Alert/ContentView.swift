//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
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
                    VStack(spacing: 10, content: {
                        Text("Баланс: \(balance) руб.")
                        Text("Карта: \(walletFirst) руб.")
                        Text("Лицевой счет: \(walletSecond) руб.")
                        Spacer()
                        payBag()
                        extractedFunc()
                        addMoney()
                        Spacer().frame(height: 500)
                    }).padding()
                    Spacer()
                }
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(.yellow)
                    .offset(x: isOnToggle ? 250 : 0)
            }
            Toggle(isOn: $isOnToggle) {
                Text("Профиль")
            }.padding()
        }.animation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0.4), value: isOnToggle)
    }
    
    fileprivate func payBag() -> some View {
        return Button {
            self.isClick = true
        } label: {
            Text("Пополнить баланс")
        }.confirmationDialog("Выберите баланс зачисления", isPresented: $isClick) {
            Button("Пополнить карту", role: .destructive) {
                walletFirst += .random(in: 10...5000)
                balance = walletFirst + walletSecond
            }
            Button("Пополнить лицевой счет", role: .destructive) {
                walletSecond += .random(in: 10...5000)
                balance = walletSecond + walletFirst
            }
        } message: {
            Text("Баланс успешно пополнен!")
        }
    }
    
    fileprivate func extractedFunc() -> some View {
        return Button {
            self.isOpenBankAccount = true
        } label: {
            Text("Открыть счет")
        }.alert(Text("Ошибка"), isPresented: $isOpenBankAccount) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Невозможно создать счет")
        }
    }
    
    fileprivate func addMoney() -> some View {
        return Button {
            self.isAddMoney = true
        } label: {
            Text("Перевод между счетами")
        }.alert(Text("Успешно"), isPresented: $isAddMoney) {
            Button("С карты на лицевой счет", role: .destructive) {
            }
            Button("Со счета на карту", role: .destructive) {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
