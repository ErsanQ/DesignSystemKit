import SwiftUI

/// The central source of truth for the ErsanQ Design System.
/// 
/// Contains predefined constants for spacing, radii, colors, and gradients
/// that ensure visual consistency across all ErsanQ-powered applications.
public enum Ersan {
    
    /// Standardized spacing increments for the ErsanQ system.
    public enum Spacing {
        /// 4 points
        public static let extraSmall: CGFloat = 4
        /// 8 points
        public static let small: CGFloat = 8
        /// 16 points
        public static let medium: CGFloat = 16
        /// 24 points
        public static let large: CGFloat = 24
        /// 32 points
        public static let extraLarge: CGFloat = 32
    }
    
    /// Standardized corner radii for UI elements.
    public enum Radius {
        /// 8 points - ideal for small buttons or secondary items.
        public static let small: CGFloat = 8
        /// 12 points - the standard button radius.
        public static let button: CGFloat = 12
        /// 20 points - the standard card radius.
        public static let card: CGFloat = 20
        /// 30 points - for large modals or prominent backgrounds.
        public static let large: CGFloat = 30
    }
    
    /// Semantic colors used throughout the Design System.
    public enum Color {
        /// The primary brand color.
        public static let primary = SwiftUI.Color.blue
        /// A secondary color for accents and states.
        public static let secondary = SwiftUI.Color.gray
        /// Semi-transparent white for glass effects.
        public static let glassWhite = SwiftUI.Color.white.opacity(0.1)
        /// Subtle white for glass surface borders.
        public static let glassStroke = SwiftUI.Color.white.opacity(0.3)
    }
    
    /// Predefined gradients for prominent UI elements.
    public enum Gradient {
        /// The flagship brand gradient.
        public static let primary = SwiftUI.LinearGradient(
            colors: [.blue, .purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        /// A subtle gradient for glass surfaces.
        public static let surface = SwiftUI.LinearGradient(
            colors: [.white.opacity(0.1), .white.opacity(0.05)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
