
import SwiftUI

public struct OnboardingPaywall: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            
            ZStack {
                AppGradient.darkGrayToBlack.ignoresSafeArea()
                ScrollView {
                    VStack {
                        ZStack {
                            HStack{
                                Button {
                                    onNext()
                                } label: {
                                    Text("Restore")
                                        .font(.interMedium(size: 16))
                                        .foregroundStyle(Color.grayBackground)
                                }
                                Spacer()
                                Button {
                                    onNext()
                                } label: {
                                    Image(.closeButton)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, screenHeight * 0.3)
                            
                            Image(.beforeAfter)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(minHeight: screenHeight * 0.3, maxHeight: screenHeight * 0.6)
                                .padding(.horizontal, 50)
                        }
                        Text("97% of Users Feel\nMore Present Within\nFirst 7 Days")
                            .font(.interMedium(size: 28))
                            .kerning(0.28)
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 38)
                        ZStack(alignment: .leading) {
                            Image(.palka)
                                .resizable()
                                .frame(width: 4, height: 160)
                                .padding(.leading, 52)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                
                                HStack(alignment: .top, spacing: 20) {
                                    Image(.galochka)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Today: Get instant\naccess")
                                            .font(.interMedium(size: 18))
                                            .foregroundStyle(Color.white)
                                        Text("Access all Premium features")
                                            .font(.interMedium(size: 12))
                                            .foregroundStyle(Color.grayBackground)
                                    }
                                }

                                HStack(alignment: .top, spacing: 20) {
                                    Image(.zvonochek)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Day 5: See first results")
                                            .font(.interMedium(size: 18))
                                            .foregroundStyle(Color.white)
                                        Text("We'll send you a notification with a report to see how you improved this week")
                                            .font(.interMedium(size: 12))
                                            .foregroundStyle(Color.grayBackground)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }

                                HStack(alignment: .top, spacing: 20) {
                                    Image(.paywallZvezda)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Day 7: Trial Ends")
                                            .font(.interMedium(size: 18))
                                            .foregroundStyle(Color.white)
                                        Text("Your subscription will start on day. Cancel anytime within 24hrs")
                                            .font(.interMedium(size: 12))
                                            .foregroundStyle(Color.grayBackground)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                            }
                            .padding(.leading, 33)
                            .padding(.trailing, 20)
                        }
                        .padding(.top, 49)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        VStack {
                            HStack(spacing: 12) {
                                HStack(spacing: 4) {
                                    ForEach(0..<5, id: \.self) { _ in
                                        Image(.star)
                                            .resizable()
                                            .frame(width: 13, height: 13)
                                    }
                                }
                                Text("1,500 Reviews")
                                    .font(.interMedium(size: 12))
                                    .foregroundStyle(.white)
                            }
                            .padding(.leading, 34)
                            Text("Join to 200k+ people using\nHeadsUp")
                                .font(.interMedium(size: 12))
                                .foregroundStyle(Color.grayBackground)
                        }
                        .padding(.top, 50)
                        .padding(.trailing, 46)
                    }
                    
                    VStack(spacing: 21) {
                        VStack(spacing: 8) {
                            Text("Try Free For 1 Week")
                                .font(.interMedium(size: 16))
                                .foregroundStyle(Color.white)
                            
                            Text("79,99$/year (6,66$/month)")
                                .font(.interMedium(size: 16))
                                .foregroundStyle(Color.white)
                        }
                        
                        // Кнопка
                        Button {
                            onNext()
                        } label: {
                            Text("Start Your Free Week")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        .padding(.top, 5)
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 8) {
                            Image(.okay)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("No payment due now")
                                .foregroundStyle(Color.grayBackground)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.top, 19)
                    .padding(.bottom, 50)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.09, green: 0.09, blue: 0.09))
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                }
            }
        }
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
