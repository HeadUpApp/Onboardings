
import SwiftUI

public struct OnboardingTwentyView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isSmallScreen = screenHeight <= 667
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
                            Image(.rainbow)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: screenWidth * 0.08)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.14)
                            Image(.shadowSmartphone)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: screenWidth * 0.08)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.18)
                            Image(.shadowDedushka)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: isSmallScreen ? screenWidth * 0.08 : screenWidth * 0.10)
                                .frame(minHeight: screenHeight * 0.03, maxHeight: screenHeight * 0.22)
                            Image(.shadowProgrammer)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: isSmallScreen ? screenWidth * 0.08 : screenWidth * 0.10)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.11)
                            Image(.shadowHome)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: screenWidth * 0.08)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.06)
                        }
                        Image(.twentyViewGraphic)
                            .resizable()
                            .frame(minWidth: screenWidth * 0.60, maxWidth: screenWidth * 0.80)
                            .frame(minHeight: screenHeight * 0.40, maxHeight: screenHeight * 0.80)
                    }
                    .padding(.top, 23)
                    Image(.cifry18)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenWidth * 0.6)
                        .frame(minHeight: screenHeight * 0.01, maxHeight: 20)
                        .padding(.leading, screenWidth * 0.32)
                        .padding(.bottom, 24)
                    Button {
                        onNext()
                    } label: {
                        Text("Wow")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.01)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
    private var textContent: Text {
        let part1 = Text("And in the end, you \n")
        let part2 = Text("have only 11 years\n")
        let part3 = Text("left for ")
        let part4 = Text("real life.")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
           
        return part1 + part2 + part3 + part4
    }
}
