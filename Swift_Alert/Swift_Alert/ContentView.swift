//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    private enum Constants {
        static let showTitle = "Показать"
        static let firstBlockTitle = "Пример Alert"
        static let secondBlockTitle = "Пример Alert c 2 кнопками и логикой"
        static let secondBlockTitleAfterTap = "Другой текст"
        static let thirdBlockTitle = "Пример ActionSheet"
        static let fourthBlockTitle = "Пример ActionSheet c кнопками и логикой"
        static let fourthBlockTitleAfterTap = "Пример ActionSheet c кнопками и логикой"
        static let changeTitle = "Изменить текст"
        static let changeColorTitle = "Сменить цвет?"
        static let transferMoneyTitle = "Перевести деньги"
        static let yesTitle = "Да"
        static let cancelTitle = "Отмена"
        static let areYouSureTitle = "Вы уверены?"
        static let answerTitle = "Выберите вариант ответа"
        static let spacing: CGFloat = 25

    }
    
    @State var testFirstView = false
    @State var testSecondView = false
    @State var forFirstAlertFlag = false
    @State var forSecondAlertFlag = false
    @State var testActionSheet = false
    @State var testActionSheetWithButton = false
    
    var body: some View {
        VStack(spacing: Constants.spacing, content: {
            Text(Constants.firstBlockTitle)
            showAlert()
            if !forFirstAlertFlag {
                Text(Constants.secondBlockTitle)
            } else {
                Text(Constants.secondBlockTitleAfterTap)
            }
            showAlertWith()
            Text(Constants.thirdBlockTitle)
            showActionSheet()
            if !forSecondAlertFlag {
                Text(Constants.fourthBlockTitle)
            } else {
                Text(Constants.fourthBlockTitleAfterTap)
                    .foregroundColor(.red)
            }
            showActionSheetButton()
        })
    }
    
    fileprivate func showAlert() -> some View {
        return Button {
            self.testFirstView = true
        } label: {
            Text(Constants.showTitle)
        }.alert(isPresented: $testFirstView) {
            Alert(title: Text(Constants.firstBlockTitle))
        }
    }
    
    fileprivate func showAlertWith() -> some View {
        return Button {
            self.testSecondView = true
        } label: {
                Text(Constants.showTitle)
        }.alert(isPresented: $testSecondView) {
            Alert(title:Text(Constants.secondBlockTitle),
                  primaryButton: .destructive(Text(Constants.changeTitle)) {
                self.forFirstAlertFlag = true
            }, secondaryButton: .cancel())
        }
    }
    
    fileprivate func showActionSheet() -> some View {
        return Button {
            testActionSheet = true
        } label: {
            Text(Constants.showTitle)
        }.confirmationDialog(Constants.transferMoneyTitle, isPresented: $testActionSheet, titleVisibility: .visible) {
            Button(Constants.yesTitle, role: .destructive) {}
            Button(Constants.cancelTitle, role: .cancel) {}
        } message: {
            Text(Constants.areYouSureTitle)
        }
    }
    
    fileprivate func showActionSheetButton() -> some View {
        return Button {
            testActionSheetWithButton = true
        } label: {
            Text(Constants.showTitle)
        }.confirmationDialog(Constants.changeColorTitle, isPresented: $testActionSheetWithButton, titleVisibility: .visible) {
            Button(Constants.yesTitle, role: .destructive) {
                forSecondAlertFlag = true
            }
            Button(Constants.cancelTitle, role: .cancel) {}
        } message: {
            Text(Constants.answerTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
