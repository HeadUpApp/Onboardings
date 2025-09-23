
import SwiftUI

public struct OnboardingStartView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    @State private var contentSize: CGSize = .zero
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            
            ZStack(alignment: .topLeading) {
                Color.appBackground.ignoresSafeArea()
                
                // Фоновое изображение
                Image(.hand)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: screenHeight * 0.90)
                
                // Градиентный оверлей
                VStack {
                    Spacer()
                    Image(.blackGradient)
                        .resizable()
                        .frame(height: screenHeight * 0.42)
                        .frame(maxWidth: .infinity)
                }
                
                // Текст
                Text("We want to show\nyou something \nimportant..")
                    .font(.interMedium(size: 36))
                    .kerning(0.36)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(36 * 0.16)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                
                
                // Кнопка - прижата к изображению
                VStack {
                    Spacer()
                    Button {
                        onNext()
                    }
                    label: {
                        Text("What?")
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
}

