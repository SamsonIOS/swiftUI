// FiltersView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран с фильтрами
struct FiltersView: View {
    // MARK: - Constants

    private enum Constants {
        static var categoryText = "Category"
        static var pricingText = "Pricing"
        static var chevronBackwardImageName = "chevron.backward"
        static var filtersText = "Filters"
        static var sliderVerticalImageName = "slider.vertical.3"
        static var moreText = "more"
        static var chevronForwardImageName = "chevron.forward"
        static var speedText = "Speed"
        static var minimumPriceText = "100$"
        static var maximumPriceText = "4500$"
        static var priceText = "Price $:"
        static var colorText = "Colors"
        static var zeroNumber = 0.0
        static var minimumSliderNumber = 100.0
        static var maximumSliderNumber = 4500.0
        static var stepSliderNumber = 250.0
    }

    // MARK: - Public Properties

    var body: some View {
        VStack(spacing: 20) {
            headerView
            HStack {
                categoryNameView(name: Constants.categoryText)
                moreView
            }
            furnituresView
            categoryNameView(name: Constants.pricingText)
            priceSliderView
            colorsTitleView
            colorsLazyVGridView
            Spacer()
        }
        .padding(.leading)
        .padding(.trailing)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }

    // MARK: - Private Properties

    private let rows: [GridItem] = [
        .init(.fixed(100))
    ]

    private let column: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]

    @Environment(\.presentationMode) private var presentation

    @StateObject private var viewModel = FiltersViewModel()

    @State private var price = Constants.zeroNumber
    @State private var isEditing = false

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
                            .resizable()
                            .frame(width: 20, height: 30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text(Constants.filtersText)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: Constants.sliderVerticalImageName)
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 80)
            }
        }
    }

    private var moreView: some View {
        HStack {
            Text(Constants.moreText)
                .font(.title2)
                .bold()
                .foregroundColor(.gray)
            Image(systemName: Constants.chevronForwardImageName)
                .resizable()
                .frame(width: 10, height: 15)
                .foregroundColor(.gray)
        }
    }

    private var furnituresView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(viewModel.imageFurnitureName, id: \.self) { name in
                    furnitureView(imageName: name)
                }
            }
            .padding()
        }
        .frame(height: 110)
    }

    private var priceSliderView: some View {
        VStack {
            Slider(
                value: $price,
                in: Constants.minimumSliderNumber ... Constants.maximumSliderNumber,
                step: Constants.stepSliderNumber
            ) {
                Text(Constants.speedText)
            } minimumValueLabel: {
                Text(Constants.minimumPriceText)
            } maximumValueLabel: {
                Text(Constants.maximumPriceText)
            } onEditingChanged: { editing in
                isEditing = editing
            }
            .tint(.purple)
            Text("\(Constants.priceText) \(Int(price))")
        }
    }

    private var colorsTitleView: some View {
        HStack {
            Text(Constants.colorText)
                .font(.title2)
                .bold()
                .foregroundColor(viewModel.selectedColor)
            Spacer()
        }
    }

    private var colorsLazyVGridView: some View {
        LazyVGrid(columns: column) {
            ForEach(viewModel.colors, id: \.self) { color in
                colorCircleView(color: color)
            }
        }
    }

    // MARK: - Private Methods

    private func colorCircleView(color: Color) -> some View {
        Button {
            viewModel.selectedColor = color
        } label: {
            ZStack {
                Circle()
                    .fill(color)
                Circle()
                    .strokeBorder(.gray, lineWidth: 2)
            }
            .frame(width: 50, height: 50)
        }
    }

    private func furnitureView(imageName: String) -> some View {
        ZStack {
            Rectangle()
                .frame(width: 140, height: 100)
                .shadow(radius: 5)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .resizable()
                .frame(width: 100, height: 80)
                .foregroundColor(.orange)
        }
    }

    private func categoryNameView(name: String) -> some View {
        HStack {
            Text(name)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
            Spacer()
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
