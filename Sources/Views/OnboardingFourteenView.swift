import SwiftUI

public struct OnboardingFourteenView: View {
    let onNext: () -> Void
    
    @State private var selectedHours: Int? = nil
    @State private var isPickerReady = false
    
    private let hours = Array(1...15)
    private let itemHeight: CGFloat = 45.0
    
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
                
                VStack(spacing: 0) {
                    Text("How many hours do\nyou work daily?")
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
                        
                        HoursPicker(selectedIndex: $selectedHours, items: hours, itemHeight: itemHeight)
                            .frame(height: itemHeight * 5)
                    }
                    .frame(height: itemHeight * 3)
                    
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
        .onAppear {
            // Устанавливаем значение после небольшой задержки, чтобы избежать лага анимации
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                selectedHours = 7 // Индекс для 8 часов
                isPickerReady = true
            }
        }
    }
}

public struct HoursPicker: View {
    @Binding var selectedIndex: Int?
    public var items: [Int]
    public var itemHeight: CGFloat = 45.0
    
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
                        let hours = items[index]
                        let isSelected = selectedIndex == index
                        
                        let backgroundView: some View = {
                            if isSelected {
                                return AnyView(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.clear)
                                )
                            } else {
                                return AnyView(Color.clear)
                            }
                        }()
                        
                        HStack(spacing: 2) {
                            Text("\(hours)")
                                .font(.system(size: isSelected ? 20 : 18))
                                .fontWeight(isSelected ? .bold : .regular)
                            Text("hrs")
                                .font(.system(size: isSelected ? 16 : 14))
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
            .animation(.none, value: selectedIndex)
            .scrollIndicators(.hidden)
            .background(Color.clear)
            .mask(
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .black, location: 0.3),
                            .init(color: .black, location: 0.7),
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