//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

/// Экран плеера
struct ContentView: View {
    
    // MARK: - Private Constants
    private enum Constants {
        static let hstackSpacing: CGFloat = 15
        static let songNameWidth: CGFloat = 300
        static let songNameHeigth: CGFloat = 30
        static let songNameCornerRadius: CGFloat = 10
        static let songImageAspectRatio: CGFloat = 1
        static let songImageCornerRadius: CGFloat = 65
        static let downloadButtonTitle = "Скачать"
        static let confirmationDialogTitle = "Трек сохранен в папку Загрузки"
        static let firstButtonTitleOfActionSheet = "Завершить"
        static let downloadButtonWidth: CGFloat = 100
        static let downloadButtonHeight: CGFloat = 40
        static let downloadButtonCornerRadius: CGFloat = 10
        static let sharedButtonTitle = "Поделится"
        static let sharedButtonWidth: CGFloat = 100
        static let sharedButtonHeight: CGFloat = 40
        static let sharedButtonCornerRadius: CGFloat = 10
        static let sharedButtonAlertTitle = "Поделится?"
        static let sharedButtonAlertButtonTitle = "Да"
        static let nextSongImageName = "arrow.forward.to.line.circle.fill"
        static let nextSongImageWidth: CGFloat = 70
        static let nextSongImageHeight: CGFloat = 40
        static let nextSongImageCornerRadius: CGFloat = 10
        static let backSongImageName = "arrow.backward.to.line.circle.fill"
        static let backSongImageWidth: CGFloat = 70
        static let backSongImageHeight: CGFloat = 40
        static let backSongImageCornerRadius: CGFloat = 10
        static let startButtonImageName = "play.circle"
        static let startButtonImageWidth: CGFloat = 70
        static let startButtonImageHeight: CGFloat = 40
        static let startButtonImageCornerRadius: CGFloat = 10
        static let stopButtonImageName = "stop.circle"
        static let stopButtonImageWidth: CGFloat = 70
        static let stopButtonImageHeight: CGFloat = 40
        static let stopButtonImageCornerRadius: CGFloat = 10
        static let zeroCurrentTime: Float = 0
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            getSongImage
            getSongName
            HStack {
                slider.padding()
            }
            HStack(spacing: Constants.hstackSpacing) {
                backSongButton
                startButton
                stopButton
                nextSongButton
            }.padding()
            
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    downloadButton
                    Spacer()
                    sharedButton
                    Spacer()
                }
            }
        }
    }
    
    // MARK: - StateObject private properties
    @StateObject private var viewModel = PlayerViewModel()
    
    // MARK: - State private properties
    
    @State private var progress: Double = 0.0
    @State private var isDownload = false
    @State private var isShared = false
    @State private var isSave = false
    
    // MARK: - Private properties
    
    private var getSongName: some View {
        Text(viewModel.getSongName())
            .frame(
                width: Constants.songNameWidth,
                height: Constants.songNameHeigth)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(Constants.songNameCornerRadius)
            .font(.callout)
    }
    
    private var getSongImage: some View {
        return Image(viewModel.getSongImageName())
            .resizable()
            .aspectRatio(Constants.songImageAspectRatio, contentMode: .fit)
            .padding()
            .cornerRadius(Constants.songImageCornerRadius)
    }
    
    private var downloadButton: some View {
        Button {
            isDownload = true
        } label: {
            Text(Constants.downloadButtonTitle)
                .frame(
                    width: Constants.downloadButtonWidth,
                    height: Constants.downloadButtonHeight)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(Constants.downloadButtonCornerRadius)
        }.confirmationDialog(Constants.confirmationDialogTitle, isPresented: $isDownload,
            titleVisibility: .visible) {
            Button(Constants.firstButtonTitleOfActionSheet,
                   role: .destructive) {}
            
        } message: {
            Text("\(viewModel.getSongName())")
        }
    }
    
    private var sharedButton: some View {
        Button {
            self.isShared = true
        } label: {
            Text(Constants.sharedButtonTitle)
                .frame(
                    width: Constants.sharedButtonWidth,
                    height: Constants.sharedButtonHeight)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(Constants.sharedButtonCornerRadius)
        }.alert(isPresented: $isShared) {
            Alert(title: Text(Constants.sharedButtonAlertTitle), message: Text("\(viewModel.getSongName())"), primaryButton: .destructive(
                Text(Constants.sharedButtonAlertButtonTitle)),
                  secondaryButton: .cancel())
        }
    }
    
    private var slider: some View {
        Slider(value: Binding(get: {
            Double(viewModel.currentTime)
        }, set: { newValue in
            viewModel.currentTime = Float(newValue)
            self.viewModel.setTime(value: Float(viewModel.currentTime))
        }), in: 0...viewModel.maxDutarion) {
            Text("\(progress)")
        } minimumValueLabel: {
            Text(verbatim: (viewModel.getStartTime().formatted(.dateTime.minute().second())))
        } maximumValueLabel: {
            Text(verbatim: (viewModel.getTimeLeft().formatted(.dateTime.minute().second())))
            
        }
    }
    
    private var nextSongButton: Button<some View> {
        Button {
            self.viewModel.nextSong()
            viewModel.isPlaying = true
        } label: {
            Image(systemName: Constants.nextSongImageName)
                .font(.title)
                .frame(
                    width: Constants.nextSongImageWidth,
                    height: Constants.nextSongImageHeight)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(Constants.nextSongImageCornerRadius)
        }
    }
    
    private var backSongButton: Button<some View> {
        Button {
            self.viewModel.backSong()
        } label: {
            Image(systemName: Constants.backSongImageName)
                .font(.title)
                .frame(
                    width: Constants.backSongImageWidth,
                    height: Constants.backSongImageHeight)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(Constants.backSongImageCornerRadius)
        }
    }
    
    private var startButton: Button<some View> {
        Button {
            if self.viewModel.isPlaying {
                self.viewModel.play()
                self.viewModel.isPlaying = false
            } else {
                self.viewModel.play()
                self.viewModel.isPlaying = true
            }
        } label: {
            Image(systemName: Constants.startButtonImageName)
                .font(.title)
                .frame(
                    width: Constants.startButtonImageWidth,
                    height: Constants.startButtonImageHeight)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(Constants.startButtonImageCornerRadius)
        }
    }
    
    private var stopButton: Button<some View> {
        Button {
            viewModel.currentTime = Constants.zeroCurrentTime
            viewModel.stop()
        } label: {
            Image(systemName: Constants.stopButtonImageName)
                .font(.title)
                .frame(
                    width: Constants.stopButtonImageWidth,
                    height: Constants.stopButtonImageHeight)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(Constants.stopButtonImageCornerRadius)
        }
    }
}

/// Отображения экрана с плеером
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
