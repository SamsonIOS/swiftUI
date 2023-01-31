// DetailView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран с мебелью
struct DetailView: View {
    // MARK: - Constants

    private enum Constants {
        static var chairText = "Chair"
        static var chairImageName = "chair"
        static var costText = "$55"
        static var heartText = "heart"
        static var buyNowText = "Buy now"
        static var basketText = "basket"
        static var heartFillText = "heart.fill"
        static var descriptionText = "Description"
        static var charsText = "Chars"
        static var oneHundredText = "/ 100"
        static var progressViewTotal = 100.0
        static var defaultSpacing: CGFloat = 20
        static var basketFrame: CGFloat = 30
    }

    // MARK: - Public Properties

    var body: some View {
        VStack(spacing: Constants.defaultSpacing) {
            headerBackgroundView(height: 100)
            chairImageView
            ZStack {
                whiteRectangleView
                HStack(spacing: 60) {
                    chairCostView
                    buyChairView
                }
            }
            titleDescriptionView
            progressView
            descriptionTextEditorView
            Spacer()
        }
        .padding(.horizontal, Constants.defaultSpacing)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }

    // MARK: - Private Properties

    @StateObject private var viewModel = DetailViewModel()

    @State private var descriptionText = ""
    @State private var descriptionTextCount = 0
    @State private var descriptionTextMaxCount = 150
    @State private var scale: CGFloat = 1
    @State private var isHeartFill = false

    private var chairImageView: some View {
        Image(systemName: Constants.chairImageName)
            .resizable()
            .frame(width: 200, height: 300)
            .foregroundColor(.orange.opacity(0.8))
            .scaleEffect(scale)
            .gesture(magnificationGesture)
    }

    private var whiteRectangleView: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 350, height: 150)
            .foregroundColor(.white)
            .shadow(color: .gray.opacity(0.4), radius: 10)
    }

    private var chairCostView: some View {
        VStack {
            Text(Constants.chairText)
                .font(Font.system(size: 30, weight: .bold))
            Rectangle()
                .frame(width: 100, height: 4)
                .foregroundColor(Color.orange)
            Text(Constants.costText)
                .font(Font.system(size: 30, weight: .bold))
                .foregroundColor(.purple)
        }
    }

    private var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                if value <= 2 {
                    scale = value
                }
            }
            .onEnded { _ in
                withAnimation {
                    scale = 1
                }
            }
    }

    private var buyChairView: some View {
        VStack {
            Image(systemName: isHeartFill ? Constants.heartFillText : Constants.heartText)
                .resizable()
                .frame(width: 40, height: 30)
                .foregroundColor(.red)
                .onTapGesture {
                    withAnimation {
                        isHeartFill.toggle()
                    }
                }
                .offset(x: 50, y: 10)
            Text(Constants.buyNowText)
                .multilineTextAlignment(.trailing)
                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 100, height: 40)
                .background(Color.red)
                .cornerRadius(40)
                .offset(x: 40, y: 20)
        }
    }

    private var titleDescriptionView: some View {
        HStack {
            Image(systemName: Constants.basketText)
                .resizable()
                .frame(
                    width: Constants.basketFrame,
                    height: Constants.basketFrame
                )
                .foregroundColor(.orange)
            Text(Constants.descriptionText)
                .font(Font.system(size: 25, weight: .bold))
            Spacer()
        }
    }

    private var descriptionTextEditorView: some View {
        TextEditor(text: $descriptionText)
            .frame(height: 100)
            .font(Font.system(size: 20))
            .onChange(of: descriptionText) { text in
                descriptionText = viewModel.descriptionText(totalChars: text)
            }
    }

    private var progressView: some View {
        ProgressView(
            "\(Constants.charsText) \(viewModel.lastDescriptionText.count) \(Constants.oneHundredText)",
            value: Double(viewModel.lastDescriptionText.count),
            total: Constants.progressViewTotal
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
