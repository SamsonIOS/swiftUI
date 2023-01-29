// ProductsView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран со списком товаров
struct ProductsView: View {
    // MARK: - Constants

    private enum Constants {
        static var dollarText = "$"
        static var minusText = "-"
        static var plusText = "+"
        static var resultPriceText = "Result price: $"
        static var magnifyingglassImageName = "magnifyingglass"
        static var searchText = "Search..."
        static var squareAndPencilImageName = "square.and.pencil"
        static var zeroNumber = 0
    }

    // MARK: - Public Properties

    var body: some View {
        VStack {
            headerView
            ScrollView(showsIndicators: false) {
                ForEach(Constants.zeroNumber ..< productViewModel.furnitures.count) { index in
                    furnitureView(index: index)
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }

    // MARK: - Private Properties

    @StateObject private var productViewModel = ProductsViewModel()

    private var headerView: some View {
        ZStack {
            headerBackgroundView(height: 140)
            VStack {
                Spacer()
                    .frame(height: 40)
                searchHeaderView
                Text("\(Constants.resultPriceText) \(productViewModel.getSumPrice())")
                    .foregroundColor(.white)
                    .font(Font.system(size: 25, weight: .bold))
            }
        }
    }

    private var backgroundFurnitureView: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 80)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width - 40, height: 80)
                .foregroundColor(.white)
                .shadow(radius: 5)
        }
    }

    private var searchHeaderView: some View {
        ZStack {
            HStack {
                Spacer()
                    .frame(width: 20)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 80, height: 40)
                Spacer()
            }
            HStack {
                Image(systemName: Constants.magnifyingglassImageName)
                    .foregroundColor(.gray)
                Text(Constants.searchText)
                    .foregroundColor(.purple)
                Spacer()
                NavigationLink {
                    FiltersView()
                } label: {
                    Image(systemName: Constants.squareAndPencilImageName)
                        .foregroundColor(.white)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 60, alignment: .leading)
        }
    }

    // MARK: - Private Methods

    private func furnitureView(index: Int) -> some View {
        ZStack {
            backgroundFurnitureView
            HStack {
                Image(systemName: productViewModel.furnitures[index].imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)
                Spacer()
                descriptionFurnitureView(index: index)
                Spacer()
                priceFurnitureView(furniture: productViewModel.furnitures[index])
            }
            .frame(width: UIScreen.main.bounds.width - 100, height: 80)
        }
        .frame(height: 100)
    }

    private func priceFurnitureView(furniture: Furniture) -> some View {
        VStack {
            Text("\(Constants.dollarText)\(furniture.price)")
                .foregroundColor(.gray.opacity(0.5))
                .strikethrough()
                .font(Font.system(size: 20, weight: .semibold))
            Text("\(Constants.dollarText)\(furniture.salePrice)")
                .foregroundColor(.purple)
                .font(Font.system(size: 25, weight: .bold))
        }
        .frame(width: 65)
    }

    private func descriptionFurnitureView(index: Int) -> some View {
        VStack(spacing: 5) {
            Text(productViewModel.furnitures[index].name)
                .font(Font.system(size: 20, weight: .bold))
                .frame(height: 30)
            HStack {
                Button(Constants.minusText) {
                    productViewModel.reduceFurnitureCount(index: index)
                }
                .foregroundColor(.black)
                .font(Font.system(size: 20, weight: .bold))
                Text("\(productViewModel.furnitures[index].count)")
                    .foregroundColor(.black)
                    .font(Font.system(size: 20, weight: .bold))
                    .frame(width: 40, height: 30)
                    .border(.gray)
                Button(Constants.plusText) {
                    productViewModel.increaseFurnitureCount(index: index)
                }
                .foregroundColor(.black)
                .font(Font.system(size: 20, weight: .bold))
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
