// AuthenticationView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран аутентификации
struct AuthenticationView: View {
    // MARK: - Constants

    private enum Constants {
        static let emptyText = ""
        static let detailViewTagText = "DetailView"
        static let logInText = "Log in"
        static let signUpText = "Sign up"
        static let placeholderNumberText = "+7 (000) 000-00-00"
        static let passwordText = "Password"
        static let placeholderPasswordText = "******"
        static let signUpButtonText = "SIGN UP"
        static let checkButtonText = "Check verification"
        static let forgotButtonText = "Forgot your password?"
        static let alertTitleText = "Support number: +7-999-111-11-77"
        static let okText = "OK"
        static let largeFontSize: CGFloat = 30
        static let defaultWidth: CGFloat = 300
        static let defaultHeight: CGFloat = 80
        static let rectangleSpacing: CGFloat = 60
        static let defaultHorizontalSpacing: CGFloat = 10
        static let strokeWidth: CGFloat = 3
    }

    // MARK: - Public Properties

    var body: some View {
        VStack(spacing: 60) {
            Spacer()
            logInSignUpView
            numberTextEditorView
            passwordTextEditorView
            Spacer()
            detailNavigationLink
            signUpTextView
            NavigationLink(destination: VerificationView()) {
                checkTextView
            }
            forgotPasswordButtonView
            Spacer()
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }

    // MARK: - Private Properties

    @StateObject private var viewModel = AuthenticationViewModel()
    @FocusState private var numberIsFocused: Bool
    @FocusState private var passwordIsFocused: Bool
    @State private var phoneNumberText = ""
    @State private var passwordText = ""
    @State private var isAlertShown = false
    @State private var selectionViewText: String?

    private var detailNavigationLink: some View {
        NavigationLink(
            destination: DetailView(),
            tag: Constants.detailViewTagText,
            selection: $selectionViewText,
            label: {
                EmptyView()
            }
        )
    }

    private var logInSignUpView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(Color.gray)
            RoundedRectangle(cornerRadius: 35)
                .frame(width: 290, height: 70)
                .foregroundColor(Color.white)
            HStack {
                Text(Constants.logInText)
                Spacer()
                Text(Constants.signUpText)
            }
            .padding()
            .font(Font.system(size: Constants.largeFontSize, weight: .bold))
            .foregroundColor(.purple)
        }
        .frame(width: Constants.defaultWidth, height: Constants.defaultHeight)
    }

    private var numberTextEditorView: some View {
        VStack {
            TextField(Constants.placeholderNumberText, text: $phoneNumberText)
                .font(.system(size: Constants.largeFontSize))
                .keyboardType(.numberPad)
                .padding(.horizontal, Constants.defaultHorizontalSpacing)
                .focused($numberIsFocused)
                .onChange(of: phoneNumberText) { totalChars in
                    phoneNumberText = viewModel.phoneNumberText(totalChars: totalChars)
                    if viewModel.checkPhoneNumberCount(totalChars: totalChars) {
                        numberIsFocused = false
                        passwordIsFocused = true
                    }
                }
            Rectangle()
                .frame(
                    width: UIScreen.main.bounds.width - Constants.rectangleSpacing,
                    height: Constants.strokeWidth
                )
                .foregroundColor(Color.gray)
        }
    }

    private var passwordTextEditorView: some View {
        VStack {
            HStack {
                Text(Constants.passwordText)
                Spacer()
            }
            SecureField(Constants.placeholderPasswordText, text: $passwordText)
                .font(.system(size: Constants.largeFontSize))
                .focused($passwordIsFocused)
                .onChange(of: passwordText) { totalChars in
                    passwordText = viewModel.passwordText(totalChars: totalChars)
                }
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - Constants.rectangleSpacing, height: Constants.strokeWidth)
                .foregroundColor(Color.gray)
        }
        .padding(.horizontal, Constants.defaultHorizontalSpacing)
    }

    private var signUpTextView: some View {
        Button(Constants.signUpText) {
            selectionViewText = viewModel.getResultUserCheck()
        }
        .redButtonModifier()
    }

    private var checkTextView: some View {
        Text(Constants.checkButtonText)
            .redButtonModifier()
    }

    private var forgotPasswordButtonView: some View {
        Button(Constants.forgotButtonText) {
            isAlertShown = true
        }
        .alert(isPresented: $isAlertShown) {
            Alert(
                title: Text(Constants.alertTitleText),
                dismissButton: .default(Text(Constants.okText))
            )
        }
        .foregroundColor(.purple)
        .font(Font.system(size: 20))
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
