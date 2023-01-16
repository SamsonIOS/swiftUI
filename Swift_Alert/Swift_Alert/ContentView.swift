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
            showAlert()
            showAlertWith()
            showActionSheet()
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
            self.testActionSheet = true
        } label: {
            Text("Показать")
        }.actionSheet(isPresented: $testActionSheet) {
            ActionSheet(title: Text("«Пример ActionSheet»"))
        }
    }
    
    fileprivate func showActionSheetButton() -> some View {
        return Button {
            self.testActionSheetWithButton = true
        } label: {
            Text("Показать 4")
        }.actionSheet(isPresented: $testActionSheetWithButton) {
            ActionSheet(title: Text("Пример"),
                        message: Text("ActionSheet c кнопками и логикой"), buttons: [.destructive(Text("Показать")) {
                print("Test print")
            }, .cancel()])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
