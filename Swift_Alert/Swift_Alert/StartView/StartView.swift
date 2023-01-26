// StartView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Стартовый экран
struct StartView: View {
    // MARK: - Constants

    private enum Constants {
        static let titleTextViewName = "ONLINE FURNITURE STORE"
        static let getStartedTextView = "GET STARTED"
        static let questionTextView = "Don't have an account?"
        static let signInTextView = "Sign in here"
        static let urlText = "https://picsum.photos/200"
        static let largeFontSize: CGFloat = 30
        static let defaultWidth: CGFloat = 300
        static let randomImageCornerRadius: CGFloat = 250
        static let getStartedTextCornerRadius: CGFloat = 40
        static let lineWidth: CGFloat = 4
    }

    // MARK: - Public Properties

    var body: some View {
        NavigationView {
            VStack {
                titleTextView
                randomImageView
                Spacer()
                NavigationLink(destination: DetailView()) {
                    getStartedTextView
                }
                Spacer()
                questionTextView
                NavigationLink(destination: AuthenticationView()) {
                    signInTextView
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width)
            .background(
                LinearGradient(colors: [Color.yellow, Color.orange], startPoint: .top, endPoint: .bottom)
            )
        }
    }

    // MARK: - Private Properties

    private var titleTextView: some View {
        Text(Constants.titleTextViewName)
            .font(Font.system(size: Constants.largeFontSize, weight: .bold))
            .foregroundColor(.white)
            .lineSpacing(10)
            .multilineTextAlignment(.center)
    }

    private var randomImageView: some View {
        AsyncImage(url: URL(string: Constants.urlText)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: Constants.defaultWidth,
                        height: Constants.defaultWidth
                    )
                    .cornerRadius(Constants.randomImageCornerRadius)
                    .overlay {
                        RoundedRectangle(cornerRadius: Constants.randomImageCornerRadius)
                            .stroke(.white, lineWidth: Constants.lineWidth)
                    }
            case let .failure(error):
                Text(error.localizedDescription)
            @unknown default:
                fatalError()
            }
        }
    }

    private var getStartedTextView: some View {
        Text(Constants.getStartedTextView)
            .font(Font.system(size: 25, weight: .bold))
            .foregroundColor(.purple)
            .frame(width: 260, height: 70)
            .background(
                LinearGradient(colors: [Color.black.opacity(0.8), Color.blue], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(Constants.getStartedTextCornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.getStartedTextCornerRadius)
                    .stroke(.white, lineWidth: Constants.lineWidth)
            }
    }

    private var questionTextView: some View {
        Text(Constants.questionTextView)
            .foregroundColor(.white)
            .font(Font.system(size: 20, weight: .bold))
    }

    private var signInTextView: some View {
        VStack(spacing: 5) {
            Text(Constants.signInTextView)
                .foregroundColor(.white)
                .font(Font.system(size: Constants.largeFontSize, weight: .bold))
            Rectangle()
                .frame(width: 170, height: 3)
                .foregroundColor(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
