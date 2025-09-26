
import SwiftUI

public struct ZvonochekOnbView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    @State private var isRotating = false
    @State private var isBouncing = false
    @State private var showRipple = false
    @State private var rippleScale = 0.5
    @State private var rippleOpacity = 1.0
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()

                // Основной колокол
                Image(bundleResource: "kolokol")
                    .resizable()
                    .frame(width: screenWidth * 0.8, height: screenHeight * 0.5)
                    .padding(.bottom, 120)
               
                // Язычок колокола с улучшенной анимацией
                ZStack {
                    // Эффект ripple (расходящиеся круги)
                    if showRipple {
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 2)
                            .frame(width: 20, height: 20)
                            .scaleEffect(rippleScale)
                            .opacity(rippleOpacity)
                            .offset(
                                x: (screenWidth * 0.6) / 2 - 50,
                                y: -screenHeight * 0.2 + 50
                            )
                    }
                    
                    Image(bundleResource: "zvonok")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(
                            x: (screenWidth * 0.6) / 2 - 50,
                            y: -screenHeight * 0.2 + 50 + (isBouncing ? -2 : 0)
                        )
                        .rotationEffect(Angle(degrees: isRotating ? -8 : 8), anchor: .top)
                        .scaleEffect(isBouncing ? 1.05 : 1.0)
                }
                
                VStack {
                    Spacer()
                    ZStack(alignment: .bottom) {
                        Image(bundleResource: "behindOfKolokol")
                            .resizable()
                            .frame(height: screenHeight * 0.6)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                AppGradient.darkScrim
                                    .frame(height: screenHeight * 0.5),
                                alignment: .bottom
                            )
                    }
                    .padding(.bottom, 70)
                }
                
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
                            Image(bundleResource: "confirm")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("No payment due now")
                                .foregroundStyle(.white)
                                .font(.interMedium(size: 17))
                        }
                        
                        Button {
                            onNext()
                        } label: {
                            Text("Continue for FREE")
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
        .onAppear {
            startBellAnimation()
        }
    }
    
    private func startBellAnimation() {
        // Начинаем анимацию с небольшой задержкой
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Последовательность анимаций для эффекта "дзинь-дзинь"
            withAnimation(.easeInOut(duration: 0.1).repeatCount(3, autoreverses: true)) {
                isRotating.toggle()
            }
            
            withAnimation(.easeInOut(duration: 0.15).delay(0.3)) {
                isBouncing = true
            }
            
            withAnimation(.easeInOut(duration: 0.15).delay(0.45)) {
                isBouncing = false
            }
            
            // Запускаем ripple эффект
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                showRipple = true
                withAnimation(.easeOut(duration: 0.8)) {
                    rippleScale = 3.0
                    rippleOpacity = 0.0
                }
            }
            
            // Повторяем всю анимацию каждые 4 секунды
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                resetAnimation()
                startBellAnimation()
            }
        }
    }
    
    private func resetAnimation() {
        isRotating = false
        isBouncing = false
        showRipple = false
        rippleScale = 0.5
        rippleOpacity = 1.0
    }
    
    private var textContent: Text {
        let part1 = Text("Don't worry — we'll\n")
        let part2 = Text("notify ")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        let part3 = Text("you a day before\n")
        let part4 = Text("the trial period ends.")
        return part1 + part2 + part3 + part4
    }
}

