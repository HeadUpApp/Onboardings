
import SwiftUI

extension Color {
    static var appBackground: Color { Color(red: 11/255, green: 11/255, blue: 11/255) } // #0B0B0B
    static var backgroundWithOpacity: Color {
        Color(white: 1.0, opacity: 0.5)
    }
    static var grayBackground: Color {
        Color(red: 167/255, green: 167/255, blue: 167/255) // #A7A7A7
    }
    static let appPoloska = Color(hex: "171717")
    
    static var darkGray: Color {
        Color(red: 48/255, green: 46/255, blue: 50/255) // #302e32
    }
    
    static var darkPurple: Color {
        Color(red: 0.137, green: 0.114, blue: 0.161) // #231d29
    }
}


enum AppGradient {
    
    struct TextColors {
        static let light = Color(red: 223/255, green: 194/255, blue: 246/255) // #DFC2F6
        static let mid = Color(red: 169/255, green: 71/255, blue: 246/255)    // #A947F6
        static let dark = Color(red: 122/255, green: 57/255, blue: 233/255)   // #7A39E9
    }
    
    
    // Цвета для кнопочных градиентов
    struct ButtonColors {
        static let light = Color(red: 183/255, green: 156/255, blue: 205/255) // #B79CCD
        static let mid = Color(red: 163/255, green: 82/255, blue: 227/255)    // #A352E3
        static let dark = Color(red: 89/255, green: 10/255, blue: 198/255)    // #590AC6
    }
    
    static let lightScam = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 165/255, green: 99/255, blue: 238/255, opacity: 0),
            Color(red: 165/255, green: 99/255, blue: 238/255, opacity: 0.03),
            Color(red: 165/255, green: 99/255, blue: 238/255, opacity: 0.15)
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let darkScrim = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 11/255, green: 11/255, blue: 11/255, opacity: 0),
            Color(red: 11/255, green: 11/255, blue: 11/255, opacity: 1)
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    static let redTransparentGradient = LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 238/255, green: 25/255, blue: 72/255).opacity(0.15),    // rgba(238, 25, 72, 0.15)
                Color(red: 250/255, green: 13/255, blue: 64/255).opacity(0.12),    // rgba(250, 13, 64, 0.12)
                Color(red: 250/255, green: 13/255, blue: 64/255).opacity(0.03)     // rgba(250, 13, 64, 0.03)
            ]),
            startPoint: UnitPoint.bottom,
            endPoint: UnitPoint.top
        )
        
        // Градиент затемнения поверх фона (снизу вверх)
        static let darkOverlayGradient = LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 11/255, green: 11/255, blue: 11/255),                   // #0B0B0B
                Color.black.opacity(0.7),
                Color.black.opacity(0.8),
                Color.black
            ]),
            startPoint: UnitPoint.bottom,
            endPoint: UnitPoint.top
        )
        
    
        // Яркий красный градиент под углом
        static let brightRedGradient = LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 246/255, green: 194/255, blue: 195/255),                // #F6C2C3
                Color(red: 246/255, green: 71/255, blue: 73/255),                  // #F64749
                Color(red: 206/255, green: 21/255, blue: 24/255)                   // #CE1518
            ]),
            startPoint: UnitPoint(x: 0.0, y: 1.0), // bottomLeading (119.81deg)
            endPoint: UnitPoint(x: 1.0, y: 0.0)    // topTrailing
        )
        
        // Альтернативная версия темного оверлея (если нужен именно тот сложный градиент)
        static let complexDarkOverlay = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.black.opacity(0.0), location: 0.0),
                .init(color: Color.black.opacity(0.7), location: 0.5032),
                .init(color: Color.black.opacity(0.8), location: 0.7478),
                .init(color: Color.black, location: 1.0)
            ]),
            startPoint: UnitPoint.bottom,
            endPoint: UnitPoint.top
        )
    static var buttonSimple: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [ButtonColors.mid, ButtonColors.dark]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    static let darkGrayToBlack = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 30/255, green: 30/255, blue: 30/255), // #1E1E1E
            Color(red: 11/255, green: 11/255, blue: 11/255)  // #0B0B0B
        ]),
        startPoint: .top,    // 180deg = сверху вниз
        endPoint: UnitPoint(x: 0.5, y: 0.4403) // 44.03% от высоты
    )
    
    
    static let orangeGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 255/255, green: 134/255, blue: 101/255), // #FF8665
            Color(red: 229/255, green: 74/255, blue: 30/255),   // #E54A1E
            Color(red: 203/255, green: 61/255, blue: 21/255)    // #CB3D15
        ]),
        startPoint: UnitPoint(x: 0.0, y: 0.0), // topLeading (11.83deg ≈ 0.206 rad)
        endPoint: UnitPoint(x: 1.0, y: 1.0)    // bottomTrailing
    )
    
    static let orangeGradientPrecise = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 255/255, green: 134/255, blue: 101/255),
            Color(red: 229/255, green: 74/255, blue: 30/255),
            Color(red: 203/255, green: 61/255, blue: 21/255)
        ]),
        startPoint: UnitPoint(x: 0.0, y: 0.0),
        endPoint: UnitPoint(x: cos(11.83 * .pi / 180), y: sin(11.83 * .pi / 180))
    )
    
    static var simpleBackground: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 117/255, green: 65/255, blue: 247/255).opacity(0), location: 0.0144),
                .init(color: Color(red: 117/255, green: 65/255, blue: 247/255).opacity(0.08), location: 0.506),
                .init(color: Color(red: 117/255, green: 65/255, blue: 247/255).opacity(0.2), location: 0.9788)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var lightScrim: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 165/255, green: 99/255, blue: 238/255).opacity(0), location: 0.0144),
                .init(color: Color(red: 165/255, green: 99/255, blue: 238/255).opacity(0.03), location: 0.506),
                .init(color: Color(red: 165/255, green: 99/255, blue: 238/255).opacity(0.15), location: 0.9788)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var textPrimary: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [TextColors.light, TextColors.mid, TextColors.dark]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var textPrimaryWithShadow: some View {
        ZStack {
            // Основной градиент
            LinearGradient(
                gradient: Gradient(colors: [TextColors.light, TextColors.mid, TextColors.dark]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Верхняя внутренняя тень (белая)
            LinearGradient(
                gradient: Gradient(colors: [
                    .white.opacity(0.41), // #FFFFFF69 ≈ 41% opacity
                    .clear
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.overlay)
            
            // Нижняя внутренняя тень (фиолетовая)
            LinearGradient(
                gradient: Gradient(colors: [
                    .clear,
                    Color(red: 0.35, green: 0.05, blue: 0.72).opacity(1.0) // #590DB7
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.overlay)
        }
    }
    
    // Горизонтальный текстовый градиент
    static var textHorizontal: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [TextColors.light, TextColors.mid, TextColors.dark]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    // Диагональный текстовый градиент (сверху-слева вниз-вправо)
    static var textDiagonalTLBR: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [TextColors.light, TextColors.mid, TextColors.dark]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // Диагональный текстовый градиент (сверху-справа вниз-влево)
    static var textDiagonalTRBL: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [TextColors.light, TextColors.mid, TextColors.dark]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
    
    // Текстовый градиент с углом 45 градусов
    static var textAngled: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [TextColors.light, TextColors.mid, TextColors.dark]),
            startPoint: UnitPoint(x: 0, y: 0),
            endPoint: UnitPoint(x: 1, y: 1)
        )
    }
    
    // Инвертированный текстовый градиент
    static var textInverted: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [TextColors.dark, TextColors.mid, TextColors.light]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var pickerFadeHorizontal: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    .init(color: .white.opacity(0), location: 0),
                    .init(color: .white.opacity(0.05), location: 0.4663),
                    .init(color: .white.opacity(0), location: 1)
                ]
            ),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
}


struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.interMedium(size: 15))
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(
                AppGradient.buttonSimple
                    .opacity(configuration.isPressed ? 0.85 : 1)
            )
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 99, style: .continuous))
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

extension LinearGradient {
    func withInsetShadow() -> some View {
        self
            .overlay(
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.41), .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, Color(red: 0.35, green: 0.05, blue: 0.72)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
                .blendMode(.overlay)
            )
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
