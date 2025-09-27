

import SwiftUI
import AVKit

public struct SecondVideoView: View {
    let onNext: () -> Void
    @State private var player: AVPlayer?
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
         
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScam.ignoresSafeArea()
           
                VStack {
                    Spacer()
                    AppGradient.darkScrim
                        .frame(height: screenHeight * 0.6)
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()
                
                VStack {
                    videoPlayer
                        .aspectRatio(16/9, contentMode: .fill)
                        .frame(
                            width: screenWidth * 0.52,
                            height: screenHeight * 0.6
                        )
                        .clipped()
                        .padding(.top, 24)
      
                    Text("Block apps by schedule")
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 16)
                        .padding(.top, 30)
                   
                    Text("HeadUp lets you block distracting apps at\nchosen times, so you can fully focus on work\nor study.")
                        .font(.interMedium(size: 16))
                        .kerning(0.36)
                        .foregroundStyle(Color.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .padding(.top, 2)
                    
                    HStack(spacing: 8) {
                        // Первая точка - белая (активная)
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 8, height: 8)
                        
                        // Вторая точка - серая
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                        
                        // Третья точка - серая
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 8, height: 8)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    VStack {
                        Button {
                            onNext()
                        } label: {
                            Text("Continue")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 14)
                }
            }
        }
        .onAppear {
            setupVideo()
        }
        .onDisappear {
            player?.pause()
            player = nil
        }
    }
    
    private var videoPlayer: some View {
        Group {
            if let player = player {
                VideoPlayer(player: player)
                    .disabled(true)
                    .allowsHitTesting(false)
            } else {
                Image(bundleResource: "videoView")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        ProgressView()
                            .tint(.white)
                    )
            }
        }
    }
    
    private func setupVideo() {
        // Правильный способ загрузки из SPM
        guard let videoURL = getVideoURLFromSPM() else {
            print("Video not found in SPM resources")
            // Fallback: попробуем загрузить из main bundle (если видео в проекте)
            if let fallbackURL = Bundle.main.url(forResource: "SecondVideo", withExtension: "mp4") {
                setupPlayer(with: fallbackURL)
            }
            return
        }
        
        setupPlayer(with: videoURL)
    }
    
    private func getVideoURLFromSPM() -> URL? {
        Bundle.module.url(forResource: "SecondVideo", withExtension: "mp4")
    }
    
    private func setupPlayer(with url: URL) {
        print("Loading video from: \(url.lastPathComponent)")
        
        let newPlayer = AVPlayer(url: url)
        newPlayer.isMuted = true
        newPlayer.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: newPlayer.currentItem,
            queue: .main
        ) { _ in
            Task { @MainActor in
                newPlayer.seek(to: .zero)
                newPlayer.play()
            }
        }
        
        player = newPlayer
        player?.play()
    }
    
}

private class BundleFinder {}




