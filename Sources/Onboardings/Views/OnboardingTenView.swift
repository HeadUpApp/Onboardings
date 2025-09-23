
import SwiftUI

public struct OnboardingTenView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                VStack {
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .bottom){
                        VStack(spacing: 0) {
                            Image(.walkingMan)
                                .resizable()
                                .frame(maxWidth: screenWidth * 0.07, maxHeight: screenHeight * 0.39)
                        }
                        Image(.tenViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.39)
                    }
                    .padding(.top, 17)
                    Spacer()
                    Button {
                        onNext()
                    } label: {
                        Text("I understand")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("But the rest is the\n")
        let part2 = Text("active waking life. And\n")
        let part3 = Text("we can ")
        let part4 = Text("influence ")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        let part5 = Text("it.")
        
        return part1 + part2 + part3 + part4 + part5
    }
}
