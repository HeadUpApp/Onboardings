
import SwiftUI
import AVKit

public struct FourthVideoView: View {
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
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                       
                    Text("HeadUp lets you block distracting apps at\nchosen times, so you can fully focus\non work or study")
                        .font(.interMedium(size: 17))
                        .kerning(0.36)
                        .foregroundStyle(Color.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .padding(.top, 12)
                    
                    videoPlayer
                        .aspectRatio(16/9, contentMode: .fill)
                        .frame(
                            width: screenWidth * 0.64,
                            height: screenHeight * 0.6
                        )
                        .clipped()
                        .padding(.top, 20)
                        
                    Spacer()
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
                    .padding(.bottom, 24)
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
            if let fallbackURL = Bundle.main.url(forResource: "FirstVideo", withExtension: "mp4") {
                setupPlayer(with: fallbackURL)
            }
            return
        }
        
        setupPlayer(with: videoURL)
    }
    
    private func getVideoURLFromSPM() -> URL? {
        Bundle.module.url(forResource: "FirstVideo", withExtension: "mp4")
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
    
    private var textContent: Text {
        let part1 = Text("Block Apps by\n")
        let part2 = Text("Schedule")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        return part1 + part2
    }
}

private class BundleFinder {}
