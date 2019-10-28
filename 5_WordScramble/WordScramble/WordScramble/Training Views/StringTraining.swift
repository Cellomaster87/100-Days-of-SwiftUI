//
//  StringTraining.swift
//  WordScramble
//
//  Created by Michele Galvagno on 28/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct StringTraining: View {
    var body: some View {
        let input = """
                    a
                    b
                    c
                    """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        return Text("""
                    Word: \(word)
                    Range: \(range.description)
                    MisspelledRange: \(misspelledRange.description)
                    All good: \(allGood.description)
                    """)
    }
}

struct StringTraining_Previews: PreviewProvider {
    static var previews: some View {
        StringTraining()
    }
}
