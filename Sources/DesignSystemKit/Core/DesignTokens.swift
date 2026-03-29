import SwiftUI

/// Design tokens for the ErsanQ Design System.
public enum Ersan {
    
    /// Predefined colors for a premium, modern aesthetic.
    public enum Color {
        public static let primary = SwiftUI.Color.blue
        public static let secondary = SwiftUI.Color(red: 0.1, green: 0.1, blue: 0.1)
        public static let accent = SwiftUI.Color.purple
        public static let glassWhite = SwiftUI.Color.white.opacity(0.12)
        public static let glassStroke = SwiftUI.Color.white.opacity(0.5)
    }
    
    /// Beautiful gradients for backgrounds and buttons.
    public enum Gradient {
        public static let primary = LinearGradient(colors: [Ersan.Color.primary, Ersan.Color.accent], startPoint: .topLeading, endPoint: .bottomTrailing)
        public static let surface = LinearGradient(colors: [.white.opacity(0.1), .white.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    /// Spacing metrics for layouts.
    public enum Spacing {
        public static let small: CGFloat = 8
        public static let medium: CGFloat = 16
        public static let large: CGFloat = 24
    }
    
    /// Geometric radii for rounded components.
    public enum Radius {
        public static let card: CGFloat = 24
        public static let button: CGFloat = 14
    }
}
