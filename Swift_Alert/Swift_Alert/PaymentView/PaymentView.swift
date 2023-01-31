// PaymentView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран с платежной информацией
struct PaymentView: View {
    // MARK: - Constants

    private enum Constants {
        static let emptyText = ""
        static let zeroNumber = 0
        static let chevronBackwardImageName = "chevron.backward"
        static let xmarkImageName = "xmark.circle"
        static let chevronDownImageName = "chevron.down"
        static let checkmarkImageName = "checkmark.circle"
        static let paymentText = "Account/Payment"
        static let addNowText = "Add now"
        static let successText = "Success"
        static let failureText = "Failure - write CVV"
        static let cvvText = "CVV"
        static let cardText = "CARD"
        static let cardPlaceholderText = "0000 0000 0000 0000"
        static let cardNumberText = "Card number"
        static let yourNumberText = "Your Name"
        static let cardholderText = "cardholder"
        static let validText = "valid"
        static let addNewCardText = "Add new card"
        static let cardholderNameText = "Cardholder name"
        static let monthText = "Month"
        static let yearText = "Year"
        static let okText = "OK"
    }

    // MARK: - Public Properties

    var body: some View {
        ZStack {
            VStack {
                headerView
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ZStack {
                            frontCardLogoView
                            backCardLogoView
                        }
                        newCardTextView
                        cardholderTextFieldView
                        HStack {
                            VStack {
                                cardNumberTextView
                                cardNumberTextFieldView
                            }
                            .frame(width: 230)
                            Spacer()
                                .frame(width: 40)
                            VStack {
                                cvvNumberTextView
                                cvvNumberTextFieldView
                            }
                        }
                        HStack {
                            monthPickerView
                                .frame(width: 140)
                            Spacer()
                            yearPickerView
                                .frame(width: 140)
                        }
                    }
                    .padding(.vertical, 10)
                }
                .frame(width: 350)
                addNowButtonView
                Spacer()
            }
            .offset(y: viewModel.isKeyboardShown ? -150 : 0)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onTapGesture {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
                )
                viewModel.isKeyboardShown = false
            }
            .blur(radius: viewModel.isAlertShown ? 10 : 0)
            if viewModel.isAlertShown {
                alertView
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }

    // MARK: - Private Properties

    @Environment(\.presentationMode) private var presentation

    @StateObject private var viewModel = PaymentViewModel()

    @FocusState private var cardholderIsFocused: Bool
    @FocusState private var cardIsFocused: Bool
    @FocusState private var cvvIsFocused: Bool

    @State private var monthPickerIndex = Constants.zeroNumber
    @State private var yearPickerIndex = Constants.zeroNumber

    private var headerView: some View {
        ZStack {
            headerBackgroundView(height: 140)
            VStack {
                Spacer()
                    .frame(height: 60)
                HStack {
                    Button {
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: Constants.chevronBackwardImageName)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text(Constants.paymentText)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 80)
            }
        }
    }

    private var addNowButtonView: some View {
        Button(Constants.addNowText) {
            viewModel.isAlertShown.toggle()
        }
        .redButtonModifierView()
        .padding(.vertical, 30)
    }

    private var frontCardLogoView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.orange]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 350, height: 350 / 1.5)
            VStack(spacing: 20) {
                miniCardLogoView
                numberCardLogoView
                HStack {
                    cardholderCardLogoView
                    Spacer()
                    validCardLogoView
                }
            }
            .frame(width: 300)
        }
        .rotation3DEffect(
            Angle(degrees: viewModel.getFrontDegree()),
            axis: (x: 0, y: 1, z: 0)
        )
        .onTapGesture {
            viewModel.isFrontCardShown.toggle()
            viewModel.flipCard()
        }
    }

    private var backCardLogoView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.orange]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 350, height: 350 / 1.5)
            cvvCardLogoView
        }
        .rotation3DEffect(
            Angle(degrees: viewModel.getBackDegree()),
            axis: (x: 0, y: 1, z: 0)
        )
        .onTapGesture {
            viewModel.isFrontCardShown.toggle()
            viewModel.flipCard()
        }
    }

    private var cvvCardLogoView: some View {
        HStack {
            Spacer()
            Text(Constants.cvvText)
                .bold()
                .font(.title2)
                .foregroundColor(.white)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 40)
                Text(viewModel.cvvNumberText.isEmpty ? "\(Constants.cvvText)" : "\(viewModel.cvvNumberText)")
                    .bold()
                    .opacity(viewModel.isCvvAnimate ? 0 : 1)
            }
            Spacer()
                .frame(width: 40)
        }
    }

    private var miniCardLogoView: some View {
        HStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 40)
                Text(Constants.cardText)
                    .bold()
                    .foregroundColor(.purple)
            }
        }
    }

    private var numberCardLogoView: some View {
        VStack {
            HStack {
                Text(
                    viewModel.cardNumberText
                        .isEmpty ? "\(Constants.cardPlaceholderText)" : "\(viewModel.cardNumberText)"
                )
                .bold()
                .font(.title2)
                .foregroundColor(.white)
                .opacity(viewModel.isCardAnimate ? 0 : 1)
                Spacer()
            }
            HStack {
                Text(Constants.cardNumberText)
                    .fontWeight(.semibold)
                    .bold()
                Spacer()
            }
        }
    }

    private var cardholderCardLogoView: some View {
        VStack {
            HStack {
                Text(viewModel.cardholderName.isEmpty ? "\(Constants.yourNumberText)" : "\(viewModel.cardholderName)")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.4)
                    .opacity(viewModel.isCardholderAnimate ? 0 : 1)
                Spacer()
            }
            HStack {
                Text(Constants.cardholderText)
                    .fontWeight(.semibold)
                    .bold()
                Spacer()
            }
        }
    }

    private var validCardLogoView: some View {
        VStack {
            HStack {
                Text(
                    "\(viewModel.monthText[monthPickerIndex]) / \(viewModel.yearText[yearPickerIndex])"
                )
                .bold()
                .font(.title2)
                .foregroundColor(.white)
                .opacity(viewModel.isValidAnimate ? 0 : 1)
                Spacer()
            }
            HStack {
                Text(Constants.validText)
                    .fontWeight(.semibold)
                    .bold()
                Spacer()
            }
        }
        .frame(width: 110)
    }

    private var newCardTextView: some View {
        HStack {
            Text(Constants.addNewCardText)
                .font(.title)
                .bold()
            Spacer()
        }
    }

    private var cardholderTextFieldView: some View {
        VStack {
            TextField(Constants.cardholderNameText, text: $viewModel.cardholderName) { _ in
                viewModel.isKeyboardShown = true
                viewModel.isFrontCardShown = true
                viewModel.flipCard()
            } onCommit: {
                viewModel.isKeyboardShown = false
                cardholderIsFocused = false
                cardIsFocused = true
            }
            .focused($cardholderIsFocused)
            .onChange(of: viewModel.cardholderName) { _ in
                viewModel.startCardholderAnimation()
            }
            .font(.title2)
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .foregroundColor(.gray)
        }
    }

    private var cardNumberTextView: some View {
        HStack {
            Text(Constants.cardNumberText)
                .font(.title2)
            Spacer()
        }
        .padding(.vertical, 10)
    }

    private var cardNumberTextFieldView: some View {
        VStack {
            TextField(Constants.cardPlaceholderText, text: $viewModel.cardNumberText) { _ in
                viewModel.isKeyboardShown = true
                viewModel.isFrontCardShown = true
                viewModel.flipCard()
            } onCommit: {
                viewModel.isKeyboardShown = false
            }
            .focused($cardIsFocused)
            .onChange(of: viewModel.cardNumberText) { totalChars in
                viewModel.cardNumberText = viewModel.cardText(totalChars: totalChars)
                if viewModel.checkCardNumberCount(totalChars: totalChars) {
                    cardIsFocused = false
                    cvvIsFocused = true
                }
                viewModel.startCardAnimation()
            }
            .font(.title3)
            .keyboardType(.numberPad)
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .foregroundColor(.gray)
        }
    }

    private var cvvNumberTextView: some View {
        HStack {
            Text(Constants.cvvText)
                .font(.title3)
            Spacer()
        }
        .padding(.vertical, 10)
    }

    private var cvvNumberTextFieldView: some View {
        VStack {
            SecureField(
                Constants.emptyText,
                text: $viewModel.cvvNumberText,
                onCommit: {
                    viewModel.isKeyboardShown = false
                }
            )
            .focused($cvvIsFocused)
            .onTapGesture {
                viewModel.isKeyboardShown = true
                viewModel.isFrontCardShown = false
                viewModel.flipCard()
            }
            .onChange(of: viewModel.cvvNumberText) { totalChars in
                viewModel.isFrontCardShown = false
                viewModel.flipCard()
                viewModel.cvvNumberText = viewModel.cvvText(totalChars: totalChars)
                if viewModel.checkCvvNumberCount(totalChars: totalChars) {
                    cvvIsFocused = false
                    viewModel.isKeyboardShown = false
                }
                viewModel.startCvvAnimation()
            }
            .font(.title2)
            .keyboardType(.numberPad)
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .foregroundColor(.gray)
        }
    }

    private var monthPickerView: some View {
        VStack {
            HStack {
                Text(Constants.monthText)
                    .font(.title2)
                Spacer()
                Menu {
                    Picker(Constants.emptyText, selection: $monthPickerIndex, content: {
                        ForEach(0 ..< viewModel.monthText.count) {
                            Text(viewModel.monthText[$0])
                        }
                    })
                } label: {
                    Image(systemName: Constants.chevronDownImageName)
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .onChange(of: monthPickerIndex) { _ in
                    viewModel.startValidAnimation()
                }
                .onTapGesture {
                    viewModel.isFrontCardShown = true
                    viewModel.flipCard()
                }
            }
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .foregroundColor(.gray)
        }
    }

    private var yearPickerView: some View {
        VStack {
            HStack {
                Text(Constants.yearText)
                    .font(.title2)
                Spacer()
                Menu {
                    Picker(Constants.emptyText, selection: $yearPickerIndex, content: {
                        ForEach(0 ..< viewModel.yearText.count) {
                            Text(viewModel.yearText[$0])
                        }
                    })
                } label: {
                    Image(systemName: Constants.chevronDownImageName)
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .onChange(of: yearPickerIndex) { _ in
                    viewModel.startValidAnimation()
                }
                .onTapGesture {
                    viewModel.isFrontCardShown = true
                    viewModel.flipCard()
                }
            }
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .foregroundColor(.gray)
        }
    }

    var alertView: some View {
        VStack(spacing: 15) {
            Text((viewModel.cvvNumberText.count == 3) ? Constants.successText : Constants.failureText)
                .font(Font.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            Image(
                systemName: (viewModel.cvvNumberText.count == 3) ? Constants.checkmarkImageName : Constants
                    .xmarkImageName
            )
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor((viewModel.cvvNumberText.count == 3) ? .white : .red)
            Button(Constants.okText) {
                withAnimation {
                    viewModel.isAlertShown.toggle()
                }
            }
            .font(Font.system(size: 20, weight: .bold))
            .foregroundColor(.purple)
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
            }
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 4)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.red]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 300, height: 300)
        )
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
