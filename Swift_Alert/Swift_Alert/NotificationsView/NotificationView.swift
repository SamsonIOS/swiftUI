// NotificationView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран с настройками уведомлений
struct NotificationsView: View {
    // MARK: - Constants

    private enum Constants {
        static var chevronBackwardImageName = "chevron.backward"
        static var notificationsText = "Notifications"
        static var updateSettingText = "Update Setting"
        static var settingsApplyText = "Settings apply"
        static var okText = "OK"
        static var zeroNumber = 0
    }

    // MARK: - Public Properties

    var body: some View {
        VStack {
            headerView
            settingsView
            Spacer()
            settingsButtonView
            Spacer()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }

    // MARK: - Private Properties

    @Environment(\.presentationMode) private var presentation

    @StateObject private var viewModel = NotificationsViewModel()

    @State private var isAlertShow = false

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
                    Text(Constants.notificationsText)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 80)
            }
        }
    }

    private var settingsButtonView: some View {
        Button(Constants.updateSettingText) {
            isAlertShow = true
        }
        .redButtonModifierView()
        .alert(isPresented: $isAlertShow) {
            Alert(title: Text(Constants.settingsApplyText), dismissButton: .default(Text(Constants.okText)))
        }
    }

    private var settingsView: some View {
        ScrollView {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(height: 400)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 5)
                    .padding()
                VStack {
                    ForEach(Constants.zeroNumber ..< viewModel.settings.count) { index in
                        settingView(setting: viewModel.settings[index], index: index)
                    }
                }
            }
        }
        .frame(height: 400)
    }

    private var onToggleView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
                .frame(width: 40, height: 20)
            Circle()
                .fill(.white)
                .frame(width: 16, height: 16)
                .offset(x: 10)
        }
    }

    private var offToggleView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.5))
                .frame(width: 40, height: 20)
            Circle()
                .fill(.gray)
                .frame(width: 16, height: 16)
                .offset(x: -10)
        }
    }

    // MARK: - Private Methods

    private func settingView(setting: Setting, index: Int) -> some View {
        VStack {
            HStack {
                Text(setting.title)
                    .font(Font.system(size: 20, weight: .bold))
                    .frame(height: 30)
                Spacer()
                orangeToggleView(index: index)
            }
            HStack {
                Text(setting.description)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 1)
                .fill(.gray.opacity(0.5))
                .frame(height: 2)
        }
        .frame(height: 80)
        .padding(.horizontal)
        .padding(.horizontal)
    }

    private func orangeToggleView(index: Int) -> some View {
        ZStack {
            if viewModel.settings[index].isOn {
                onToggleView
            } else {
                offToggleView
            }
        }
        .onTapGesture {
            viewModel.settings[index].isOn.toggle()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
