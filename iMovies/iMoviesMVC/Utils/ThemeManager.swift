//
//  ThemeManager.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

#if canImport(UIKit)
import UIKit

public enum Theme: String {
    case light, dark // , graphical

    var barStyle: UIBarStyle {
        .default
    }
}

public struct ThemeManager {
    public enum Font: String {
        /// Avenir-Book
        case Book                        = "Avenir-Book"
        /// Avenir-Roman
        case Roman                       = "Avenir-Roman"
        /// Avenir-Light
        case Light                       = "Avenir-Light"
        /// Avenir-Medium
        case Medium                      = "Avenir-Medium"
        /// Avenir-Heavy
        case Heavy                       = "Avenir-Heavy"
        /// Avenir-Black
        case Black                       = "Avenir-Black"

        public enum Size: CGFloat {
            /// 10pt
            case xxsmall        = 10
            /// 12.4pt
            case xsmall         = 12.4
            /// 13pt
            case small          = 13
            /// 14pt
            case smallmedium    = 14
            /// 15pt
            case medium         = 15
            /// 18pt
            case mediumlarge    = 18
            ///20pt
            case large          = 20
            /// 22pt
            case larger         = 22
            /// 24pt
            case xlarge         = 24
            /// 28pt
            case xxlarge        = 28
        }

        /// size as predifined size
        public func font(size: Size) -> UIFont? {
            let fontSize = size.rawValue
            let fontName = self.rawValue
            return UIFont(name: fontName, size: fontSize)
        }

        /// size as CGFloat
        public func font(size: CGFloat) -> UIFont? {
            let fontSize = size
            let fontName = self.rawValue
            return UIFont(name: fontName, size: fontSize)
        }
    }
}
#endif
