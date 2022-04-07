/*
See LICENSE folder for this sample’s licensing information.
*/


import SwiftUI

enum Theme: String, CaseIterable, Identifiable { // CaseIterable - to iterate cases | Identifiable - to identify each case but you need to conform to its protocol
    
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String { // conforming to Identifiable (ENUM)
        name
    }
}
