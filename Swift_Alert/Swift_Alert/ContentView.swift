//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI
/// Экран с алертами
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
    
    @State private var isFirstViewShown = false
    @State private var isSecondViewShown = false
    @State private var isFirstAlertShown = false
    @State private var isSecondAlertShown = false
    @State private var isActionSheetShown = false
    @State private var isActionSheetWithButtonShown = false
    
    var body: some View {
        VStack(spacing: Constants.spacing, content: {
            Text(Constants.firstBlockTitle)
            showAlert
            if !isFirstAlertShown {
                Text(Constants.secondBlockTitle)
            } else {
                Text(Constants.secondBlockTitleAfterTap)
            }
            showAlertWith
            Text(Constants.thirdBlockTitle)
            showActionSheet
            if !isSecondAlertShown {
                Text(Constants.fourthBlockTitle)
            } else {
                Text(Constants.fourthBlockTitleAfterTap)
                    .foregroundColor(.red)
            }
            showActionSheetButton
        })
    }
    
    private var showAlert: some View {
        Button {
            self.isFirstViewShown = true
        } label: {
            Text(Constants.showTitle)
        }.alert(isPresented: $isFirstViewShown) {
            Alert(title: Text(Constants.firstBlockTitle))
        }
    }
    
    private var showAlertWith: some View {
        Button {
            self.isSecondViewShown = true
        } label: {
                Text(Constants.showTitle)
        }.alert(isPresented: $isSecondViewShown) {
            Alert(title:Text(Constants.secondBlockTitle),
                  primaryButton: .destructive(Text(Constants.changeTitle)) {
                self.isFirstAlertShown = true
            }, secondaryButton: .cancel())
        }
    }
    
    private var showActionSheet: some View {
        Button {
            isActionSheetShown = true
        } label: {
            Text(Constants.showTitle)
        }.confirmationDialog(Constants.transferMoneyTitle, isPresented: $isActionSheetShown, titleVisibility: .visible) {
            Button(Constants.yesTitle, role: .destructive) {}
            Button(Constants.cancelTitle, role: .cancel) {}
        } message: {
            Text(Constants.areYouSureTitle)
        }
    }
    
    private var showActionSheetButton: some View {
        Button {
            isActionSheetWithButtonShown = true
        } label: {
            Text(Constants.showTitle)
        }.confirmationDialog(Constants.changeColorTitle, isPresented: $isActionSheetWithButtonShown, titleVisibility: .visible) {
            Button(Constants.yesTitle, role: .destructive) {
                isSecondAlertShown = true
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
