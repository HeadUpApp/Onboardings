import SwiftUI
import AVKit
import UIKit

public struct EscapeTheRoleView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void = {}) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Auto-looping video (muted, UIKit-backed for reliable autoplay)
                    LoopingPlayerView(resourceName: "videoGleb", fileExtension: "mp4")
                        .frame(width: screenWidth, height: screenHeight * 0.35)
                        .clipped()
                        .cornerRadius(16)
                        .padding(.top, 23)
                        .padding(.horizontal, screenWidth * 0.04)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Try for $0.00")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.02)
                    
                    Text("Just 99,9 $ per year or 12,99 $ per month")
                        .font(.interMedium(size: 17))
                        .foregroundStyle(.white.opacity(0.5))
                        .padding(.horizontal, screenWidth * 0.04)
                        .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("Now it's time to\n")
        let part2 = Text("gain 6+ years of life\n")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        let part3 = Text("back with the ")
        let part4 = Text("HeadUp")
        
        return part1 + part2 + part3 + part4
    }
}

// MARK: - Video loop helper
fileprivate struct LoopingPlayerView: UIViewRepresentable {
    let resourceName: String
    let fileExtension: String

    func makeUIView(context: Context) -> PlayerContainerView {
        let view = PlayerContainerView()
        view.configure(resourceName: resourceName, fileExtension: fileExtension)
        return view
    }

    func updateUIView(_ uiView: PlayerContainerView, context: Context) { }
}

fileprivate final class PlayerContainerView: UIView {
    private var player: AVQueuePlayer?
    private var looper: AVPlayerLooper?

    override class var layerClass: AnyClass { AVPlayerLayer.self }

    func configure(resourceName: String, fileExtension: String) {
        guard let url = Bundle.module.url(forResource: resourceName, withExtension: fileExtension) else { return }
        let item = AVPlayerItem(url: url)
        let queue = AVQueuePlayer()
        let looper = AVPlayerLooper(player: queue, templateItem: item)

        if let layer = self.layer as? AVPlayerLayer {
            layer.player = queue
            layer.videoGravity = .resizeAspectFill
        }

        queue.isMuted = true
        queue.play()
        self.player = queue
        self.looper = looper
    }

    deinit { player?.pause() }
}


