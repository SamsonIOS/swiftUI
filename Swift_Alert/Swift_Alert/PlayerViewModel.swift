//
//  PlayerViewModel.swift
//  Swift_Alert
//
//  Created by coder on 20.01.2023.
//

import AVFoundation

/// Вью модель плеера
final class PlayerViewModel: ObservableObject {
    // MARK: - Private Constants
    private enum Constats {
        static let firstSong = ["eminem", "eminem", "Eminem - Sing For The Moment"]
        static let secondSong = ["muz", "lion", "Антон Токарев - Седьмой лепесток"]
        static let oneInt = 1
        static let zeroInt = 0
        static let emptyString = ""
        static let typeOfSong = "mp3"
    }
    
    // MARK: - Published Properties
    @Published var maxDutarion = 0.0
    @Published var currentTime: Float = 0.0
    @Published var isPlaying = false
    
    // MARK: - Private Properties
    private var currentSong = 0
    private var player = AVAudioPlayer()
    private var songs: [SongInfo] = [
        SongInfo(
            name: Constats.firstSong[0],
            image: Constats.firstSong[1],
            artist: Constats.firstSong[2]),
        SongInfo(
            name: Constats.secondSong[0],
            image: Constats.secondSong[1],
            artist: Constats.secondSong[2])
    ]
    
    // MARK: - Public Methods
    
    func play() {
        if isPlaying {
            player.stop()
        } else {
            playSong(number: currentSong)
            setTime(value: currentTime)
        }
        
    }
    
    func stop() {
        isPlaying = false
        setTime(value: currentTime)
        player.stop()
    }
    
    func nextSong() {
        currentSong += Constats.oneInt
        playSong(number: currentSong)
        player.play()
    }
    
    func backSong() {
        currentSong -= Constats.oneInt
        playSong(number: currentSong)
        player.play()
    }
    
    func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player.currentTime = time
        player.play()
        setupCurrentTime()
    }
    
    func getTimeLeft() -> Date {
        let progresSong = Date(timeIntervalSince1970: maxDutarion - Double(currentTime))
           return progresSong
        }
    
    func getStartTime() -> Date {
        let progresSong = Date(timeIntervalSince1970: Double(currentTime))
        return progresSong
    }
    
    func getSongImageName() -> String {
            guard currentSong < songs.count
        else { return Constats.emptyString }
        return songs[currentSong].image
        }
    
    func getSongName() -> String {
        guard currentSong < songs.count
        else { return Constats.emptyString }
        return songs[currentSong].artist
    }
    
    // MARK: - Private Methods
    private func playSong(number: Int) {
        if number >= songs.count {
            currentSong = Constats.zeroInt
                } else if number < Constats.zeroInt {
                    currentSong = songs.count - Constats.oneInt
                }
        
        guard let audioPath = Bundle.main.path(forResource: songs[currentSong].name, ofType: Constats.typeOfSong)
        else { return }
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
            maxDutarion = player.duration
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupCurrentTime() {
        Timer.scheduledTimer(withTimeInterval: Double(Constats.oneInt), repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.currentTime = Float(self.player.currentTime)
            }
        }
}
