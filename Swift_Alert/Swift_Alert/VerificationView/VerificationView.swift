// VerificationView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран верификации
struct VerificationView: View {
    // MARK: - Constants

    private enum Constants {
        static var emptyText = ""
        static var checkText = "Check the SMS"
        static var getCodeText = "message to get a verification code"
        static var noSmsText = "Didn’t receive sms"
        static var mailImageName = "envelope.fill"
        static var verificationCodeText = "Verification Code"
        static var zeroText = "0"
        static var continueText = "Continue"
        static var bugText = "We already know about the bug and fix it soon"
        static var sendSmsText = "Send sms again"
        static var messageText = "Fill in from message"
        static var okText = "OK"
    }

    // MARK: - Public Properties

    var body: some View {
        VStack(spacing: 20) {
            mailImageView
            verificationTextView
            smsNumberView
            Text(Constants.checkText)
            Text(Constants.getCodeText)
            continueButtonView
            progressView
            Text(Constants.noSmsText)
            sendSmsButtonView
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }

    // MARK: - Private Properties

    @StateObject private var viewModel = VerificationViewModel()
    @FocusState private var firstNumberIsFocused: Bool
    @FocusState private var secondNumberIsFocused: Bool
    @FocusState private var thirdNumberIsFocused: Bool
    @FocusState private var fourNumberIsFocused: Bool
    @State private var firstVerificationNumber = Constants.emptyText
    @State private var secondVerificationNumber = Constants.emptyText
    @State private var thirdVerificationNumber = Constants.emptyText
    @State private var fourVerificationNumber = Constants.emptyText
    @State private var isActionSheetShown = false
    @State private var isAlertShown = false

    private var mailImageView: some View {
        Image(systemName: Constants.mailImageName)
            .resizable()
            .frame(width: 250, height: 200)
    }

    private var verificationTextView: some View {
        Text(Constants.verificationCodeText)
            .font(Font.system(size: 30))
    }

    private var smsNumberView: some View {
        HStack {
            TextField(Constants.zeroText, text: $firstVerificationNumber)
                .verificationTextEditorModifier()
                .focused($firstNumberIsFocused)
                .onChange(of: firstVerificationNumber) { totalChars in
                    firstVerificationNumber = viewModel.smsText(totalChars: totalChars)
                    secondNumberIsFocused = true
                }

            TextField(Constants.zeroText, text: $secondVerificationNumber)
                .verificationTextEditorModifier()
                .focused($secondNumberIsFocused)
                .onChange(of: secondVerificationNumber) { totalChars in
                    secondVerificationNumber = viewModel.smsText(totalChars: totalChars)
                    thirdNumberIsFocused = true
                }

            TextField(Constants.zeroText, text: $thirdVerificationNumber)
                .verificationTextEditorModifier()
                .focused($thirdNumberIsFocused)
                .onChange(of: thirdVerificationNumber) { totalChars in
                    thirdVerificationNumber = viewModel.smsText(totalChars: totalChars)
                    fourNumberIsFocused = true
                }

            TextField(Constants.zeroText, text: $fourVerificationNumber)
                .verificationTextEditorModifier()
                .focused($fourNumberIsFocused)
                .onChange(of: fourVerificationNumber) { totalChars in
                    fourVerificationNumber = viewModel.smsText(totalChars: totalChars)
                    firstNumberIsFocused = true
                }
        }
    }

    private var continueButtonView: some View {
        Button(Constants.continueText) {
            isActionSheetShown = true
            viewModel.progressViewActivate()
        }
        .redButtonModifier()

        .actionSheet(isPresented: $isActionSheetShown) {
            ActionSheet(title: Text(Constants.bugText))
        }
    }

    private var progressView: some View {
        ProgressView(
            Constants.emptyText,
            value: Double(viewModel.progressViewCount),
            total: 10.0
        )
        .frame(width: 200)
    }

    private var sendSmsButtonView: some View {
        Button(Constants.sendSmsText) {
            isAlertShown = true
            viewModel.getRandomNumber()
        }
        .foregroundColor(.purple)
        .font(Font.system(size: 20))
        .alert(isPresented: $isAlertShown) {
            Alert(
                title: Text(viewModel.randomNumberText),
                message: Text(Constants.messageText),
                dismissButton: .default(Text(Constants.okText), action: {
                    (
                        firstVerificationNumber,
                        secondVerificationNumber,
                        thirdVerificationNumber,
                        fourVerificationNumber
                    ) = viewModel.randomTupleText
                })
            )
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
