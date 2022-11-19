//
//  FontsViewModel.swift
//  iOSFonts
//
//  Created by Eric Ziegler on 11/18/22.
//

import SwiftUI
import UIKit

class FontsViewModel: ObservableObject {
    
    @Published var fonts = [String]()
    @Published var selectedWeight: Font.Weight = .regular
    @Published var sampleText = ""
    @Published var selectedFont = ""
    @Published var showSelectedFont = false
    let fontWeights: [Font.Weight] = [
        .regular,
        .thin,
        .ultraLight,
        .light,
        .medium,
        .semibold,
        .bold,
        .black,
        .heavy
    ]
    
    init() {
        loadFonts()
    }
    
    private func loadFonts() {
        var newFonts = [String]()
        UIFont.familyNames.forEach({ familyName in
            newFonts.append(familyName)
        })
        fonts = newFonts
    }
    
}

extension Font.Weight {
 
    var displayText: String {
        switch self {
        case .thin:
            return "Thin"
        case .ultraLight:
            return "Ultra Light"
        case .light:
            return "Light"
        case .medium:
            return "Medium"
        case .semibold:
            return "Semibold"
        case .bold:
            return "Bold"
        case .black:
            return "Black"
        case .heavy:
            return "Heavy"
        default:
            return "Regular"
        }
    }
    
}
