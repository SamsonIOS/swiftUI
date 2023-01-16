//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isOnToggle = false
    @State var isClick = false
    @State var isOpenBankAccount = false
    @State var isAddMoney = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack(spacing: 10, content: {
                        payBag()
                        openBankAccount()
                        addMoney()
                        Spacer().frame(height: 600)
                    }).padding()
                    Spacer()
                }
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(.yellow)
                    .offset(x: isOnToggle ? 170 : 0)
            }
            Toggle(isOn: $isOnToggle) {
                Text("Профиль")
            }.padding()
        }.animation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0.4), value: isOnToggle)
    }
    
    fileprivate func payBag() -> Button<Text> {
        return Button {
            self.isClick = true
        } label: {
            Text("Пополнить баланс")
        }
    }
    
    fileprivate func openBankAccount() -> Button<Text> {
        return Button {
            self.isOpenBankAccount = true
        } label: {
            Text("Открыть счет")
                
        }
    }
    
    fileprivate func addMoney() -> Button<Text> {
        return Button {
            self.isAddMoney = true
        } label: {
            Text("Перевести на счет")
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
