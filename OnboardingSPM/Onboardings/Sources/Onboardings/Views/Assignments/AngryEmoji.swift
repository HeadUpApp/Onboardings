
import SwiftUI


public struct AngryEmoji: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        ZStack {
            Image(.backgroundMoln)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    ZStack {
                        AppGradient.complexDarkOverlay
                        AppGradient.redTransparentGradient
                        VStack {
                            Spacer()
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .clear,
                                    .black.opacity(0.5),
                                    .black.opacity(1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                                .frame(height: UIScreen.main.bounds.height * 0.7)
                        }
 
                    }
                    .ignoresSafeArea()
                )
            
            
            VStack(spacing:0) {
                Image(.angryEmoji)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 356, maxHeight: 306)
                textContent
                    .font(.interMedium(size: 36))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Text("It offers instant pleasure, but often\nleaves us drained and disconnected\nin the long run.")
                    .font(.interMedium(size: 18))
                    .foregroundStyle(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
            }
            VStack {
                Spacer()
                Button {
                    onNext()
                } label: {
                    Text("Continue")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(PrimaryButtonStyle())
                .frame(maxWidth: 360)
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
                
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("Social media\n")
        let part2 = Text("is a ")
        let part3 = Text("drug")
            .foregroundStyle(AppGradient.brightRedGradient)
            .font(.interMedium(size: 36))
        return part1 + part2 + part3
    }
}

