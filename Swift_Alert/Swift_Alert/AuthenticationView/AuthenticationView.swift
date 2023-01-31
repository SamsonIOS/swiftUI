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

        static let progressViewTotal = 10.0
        static var xmarkText = "xmark"
    }

    // MARK: - Public Properties

    var body: some View {
        VStack(spacing: 60) {
            headerBackgroundView(height: 150)
            logInSignUpView
            numberTextEditorView
            passwordTextEditorView
            detailNavigationLinkView
            progressView
            signUpTextView
            NavigationLink(destination: VerificationView()) {
                checkTextView
            }
            forgotPasswordButtonView
            Spacer()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }

    // MARK: - Private Properties

    @StateObject private var viewModel = AuthenticationViewModel()

    @FocusState private var isNumberIsFocused: Bool
    @FocusState private var isPasswordIsFocused: Bool

    private var detailNavigationLinkView: some View {
        NavigationLink(
            destination: MainTabBarView(),
            tag: Constants.detailViewTagText,
            selection: $viewModel.selectionViewText,
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
        .scaleEffect(viewModel.scaleLogInSignUpViewNumber)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).delay(0.4)) {
                viewModel.scaleLogInSignUpViewNumber = 1
            }
        }
    }

    private var numberTextEditorView: some View {
        VStack {
            TextField(Constants.placeholderNumberText, text: $viewModel.phoneNumberText)
                .font(.system(size: Constants.largeFontSize))
                .keyboardType(.numberPad)
                .padding(.horizontal, Constants.defaultHorizontalSpacing)
                .focused($isNumberIsFocused)
                .onChange(of: viewModel.phoneNumberText) { totalChars in
                    viewModel.phoneNumberText = viewModel
                        .phoneNumberText(totalChars: totalChars)
                    if viewModel.checkPhoneNumberCount(totalChars: totalChars) {
                        isNumberIsFocused = false
                        isPasswordIsFocused = true
                    }
                }
            Rectangle()
                .frame(
                    width: UIScreen.main.bounds.width - Constants.rectangleSpacing,
                    height: Constants.strokeWidth
                )
                .foregroundColor(Color.gray)
        }
        .scaleEffect(viewModel.scaleNumberTextEditorViewNumber)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).delay(0.8)) {
                viewModel.scaleNumberTextEditorViewNumber = 1
            }
        }
    }

    private var passwordTextEditorView: some View {
        VStack {
            HStack {
                Text(Constants.passwordText)
                Spacer()
            }
            ZStack {
                SecureField(Constants.placeholderPasswordText, text: $viewModel.passwordText)
                    .font(.system(size: Constants.largeFontSize))
                    .focused($isPasswordIsFocused)
                    .onChange(of: viewModel.passwordText) { totalChars in
                        viewModel.passwordText = viewModel.passwordText(totalChars: totalChars)
                    }
                HStack {
                    Spacer()
                    if viewModel.isXmarkShown {
                        Image(systemName: Constants.xmarkText)
                            .font(.system(size: Constants.largeFontSize))
                            .foregroundColor(.red)
                    }
                }
            }
            .offset(x: viewModel.isPasswordViewAnimate ? -10 : 0)
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - Constants.rectangleSpacing, height: Constants.strokeWidth)
                .foregroundColor(Color.gray)
        }
        .padding(.horizontal, Constants.defaultHorizontalSpacing)
        .scaleEffect(viewModel.scalePasswordTextEditorViewNumber)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).delay(1.2)) {
                viewModel.scalePasswordTextEditorViewNumber = 1
            }
        }
    }

    private var progressView: some View {
        ProgressView(
            Constants.emptyText,
            value: Double(viewModel.progressViewCount),
            total: Constants.progressViewTotal
        )
        .tint(.purple)
        .frame(width: Constants.defaultWidth)
        .scaleEffect(viewModel.scaleProgressViewNumber)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).delay(1.6)) {
                viewModel.scaleProgressViewNumber = 1
            }
        }
    }

    private var signUpTextView: some View {
        Button(Constants.signUpText) {
            viewModel.progressViewActivate { result in
                switch result {
                case Constants.detailViewTagText:
                    viewModel.selectionViewText = result
                default:
                    viewModel.isXmarkShown.toggle()
                    withAnimation(Animation.linear(duration: 0.1).repeatCount(6, autoreverses: true)) {
                        viewModel.isPasswordViewAnimate.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        viewModel.isPasswordViewAnimate.toggle()
                        viewModel.isXmarkShown.toggle()
                    }
                }
            }
        }
        .redButtonModifierView()
        .scaleEffect(viewModel.scaleSignUpTextViewNumber)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).delay(2.0)) {
                viewModel.scaleSignUpTextViewNumber = 1
            }
        }
    }

    private var checkTextView: some View {
        Text(Constants.checkButtonText)
            .redButtonModifierView()
            .scaleEffect(viewModel.scaleCheckTextViewNumber)
            .onAppear {
                withAnimation(Animation.linear(duration: 0.4).delay(2.4)) {
                    viewModel.scaleCheckTextViewNumber = 1
                }
            }
    }

    private var forgotPasswordButtonView: some View {
        Button(Constants.forgotButtonText) {
            viewModel.isAlertShown = true
        }
        .alert(isPresented: $viewModel.isAlertShown) {
            Alert(
                title: Text(Constants.alertTitleText),
                dismissButton: .default(Text(Constants.okText))
            )
        }
        .foregroundColor(.purple)
        .font(Font.system(size: 20))
        .scaleEffect(viewModel.scaleForgotPasswordButtonViewNumber)
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).delay(2.8)) {
                viewModel.scaleForgotPasswordButtonViewNumber = 1
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
