import SwiftUI

public struct OnboardingFourthView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    @State private var selectedAge: Int? = 24 // Индекс для возраста 25 (25-1=24)
    
    private let ages = Array(1...100)
    private let itemHeight: CGFloat = 45.0 // Уменьшено с 58.0
    
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("What is your age?")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    ZStack {
                        // Линия сверху
                        VStack {
                            Rectangle()
                                .fill(AppGradient.pickerFadeHorizontal)
                                .frame(height: 1)
                                .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            // Линия снизу
                            Rectangle()
                                .fill(AppGradient.pickerFadeHorizontal)
                                .frame(height: 1)
                                .padding(.horizontal, 10)
                        }
                        .frame(height: itemHeight)
                        
                        AgePicker(selectedIndex: $selectedAge, items: ages, itemHeight: itemHeight)
                            .frame(height: itemHeight * 5) // Уменьшено с 7
                    }
                    .frame(height: itemHeight * 3) // Уменьшено с 5
                    
                    Spacer()
                    Button {
                        onNext()
                    } label: {
                        Text("Continue")
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
}

public struct AgePicker: View {
    @Binding var selectedIndex: Int?
    public var items: [Int]
    public var itemHeight: CGFloat = 45.0 // Уменьшено с 58.0
    
    public init(selectedIndex: Binding<Int?>, items: [Int], itemHeight: CGFloat = 45.0) {
        self._selectedIndex = selectedIndex
        self.items = items
        self.itemHeight = itemHeight
    }
    
    public var body: some View {
        ZStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(0..<items.count, id: \.self) { index in
                        let age = items[index]
                        let isSelected = selectedIndex == index
                        
                        let backgroundView: some View = {
                            if isSelected {
                                return AnyView(
                                    RoundedRectangle(cornerRadius: 6) // Уменьшено с 8
                                        .fill(Color.clear)
                                )
                            } else {
                                return AnyView(Color.clear)
                            }
                        }()
                        
                        HStack(spacing: 2) { // Уменьшено с 4
                            Text("\(age)")
                                .font(.system(size: isSelected ? 20 : 18)) // Настроены размеры
                                .fontWeight(isSelected ? .bold : .regular)
                            Text("yrs")
                                .font(.system(size: isSelected ? 16 : 14)) // Настроены размеры
                                .fontWeight(isSelected ? .bold : .regular)
                        }
                        .foregroundColor(isSelected ? .white : .white.opacity(0.6))
                        .frame(height: itemHeight)
                        .frame(maxWidth: .infinity)
                        .background(backgroundView)
                        .id(index)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $selectedIndex, anchor: .center)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .background(Color.clear)
            .mask(
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .black, location: 0.3), // Настроены границы
                            .init(color: .black, location: 0.7), // Настроены границы
                            .init(color: .clear, location: 1)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}
