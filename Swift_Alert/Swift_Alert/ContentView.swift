//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var testFirstView = false
    @State var testSecondView = false
    @State var yellow = false
    @State var testActionSheet = false
    @State var testActionSheetWithButton = false
    
    var body: some View {
        VStack(spacing: 25, content: {
            Text("Пример Alert")
            showAlert()
            Text("Пример Alert c 2 кнопками и логикой")
            showAlertWith()
            Text("Пример ActionSheet")
            showActionSheet()
            Text("Пример ActionSheet c кнопками и логикой")
            showActionSheetButton()
        })
    }
    
    fileprivate func showAlert() -> some View {
        return Button {
            self.testFirstView = true
        } label: {
            Text("Показать")
        }.alert(isPresented: $testFirstView) {
            Alert(title: Text("Пример Alert"))
        }
    }
    
    fileprivate func showAlertWith() -> some View {
        return Button {
            self.testSecondView = true
        } label: {
            if !yellow {
                Text("Показать")
            } else {
                Text("Показать")
                    .foregroundColor(.black)
            }
        }.alert(isPresented: $testSecondView) {
            Alert(title:Text("Пример Alert c 2 кнопками и логикой"),
                primaryButton: .destructive(Text("Сменить цвет")) {
                self.yellow = true
            } , secondaryButton: .cancel())
        }
    }
    
    fileprivate func showActionSheet() -> some View {
        return Button {
            testActionSheet = true
        } label: {
            Text("Показать")
        }.confirmationDialog("Перевести деньги", isPresented: $testActionSheet, titleVisibility: .visible) {
            Button("Да", role: .destructive) {}
            Button("Отмена", role: .cancel) {}
        } message: {
            Text("Вы уверены?")
        }
    }
    
    fileprivate func showActionSheetButton() -> some View {
        return Button {
            testActionSheetWithButton = true
        } label: {
            Text("Показать 4")
        }.confirmationDialog("Перевести деньги", isPresented: $testActionSheetWithButton, titleVisibility: .visible) {
            Button("Да", role: .destructive) {
                print("Заказ отправлен")
            }
            Button("Отмена", role: .cancel) {}
        } message: {
            Text("Вы уверены?")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
