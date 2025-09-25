import SwiftUI

public struct VideoOnbView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            let screenHeight = geometry.size.height
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScam.ignoresSafeArea()
                
                Image(.videoView)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 565)
                    .padding(.top, 116)
                    .padding(.horizontal, 48)
                
                VStack {
                    Spacer()
                    AppGradient.darkScrim
                        .frame(height: screenHeight * 0.7)
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()

                VStack {
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 16)
                    
                    Spacer()

                    VStack(spacing: 16) {
                        HStack {
                            Image(.confirm)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("No payment due now")
                                .font(.interMedium(size: 17))
                                .foregroundStyle(.white)
                        }
                        
                        Button {
                            onNext()
                        } label: {
                            Text("Try for $0.00")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        
                        Text("Just 99,9 $ per year or 12,99 $ per month")
                            .font(.interMedium(size: 17))
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .padding(.bottom, 6)
                    
                }
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("Now it's time to\n")
        let part2 = Text(" gain 6+ years of life\n")
        let part3 = Text("back with the ")
        let part4 = Text("HeadUp")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        return part1 + part2 + part3 + part4
    }
}
