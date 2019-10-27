import Foundation


// variant 1
//------------------------

var substrings: [String] = []
let testString: String = "My testable string for solve the Wix test task"   // 46 characters

func splitUpStringToSubstrings(S: String, K: Int) -> Int {
    
    let sourceString = S.trimmingCharacters(in: .whitespaces)
    let maxSubstringLength = K
    
    if sourceString.count < 1 || sourceString.count > 500 {
        return -1
    }
    
    if sourceString.count <= maxSubstringLength {
        substrings.append(sourceString)
        return substrings.count
    }
    
    // solve
    guard let lastIndexOfSubstring = sourceString.index(sourceString.startIndex, offsetBy: maxSubstringLength, limitedBy: sourceString.endIndex) else { return -1 }
    
    if sourceString[lastIndexOfSubstring] == " " {
        let wordWrapSubstring = sourceString[..<lastIndexOfSubstring]
        substrings.append(String(wordWrapSubstring))
        let taleOfSourceString = String(sourceString[lastIndexOfSubstring...])
        return splitUpStringToSubstrings(S: taleOfSourceString, K: maxSubstringLength)
        
    } else {
        let rawSubstring = sourceString[...lastIndexOfSubstring]
        guard let indexOfLastSpace = rawSubstring.lastIndex(of: " ") else { return -1 }
        let wordWrapSubstring = sourceString[..<indexOfLastSpace]
        substrings.append(String(wordWrapSubstring))
        let taleOfSourceString = String(sourceString[indexOfLastSpace...])
        return splitUpStringToSubstrings(S: taleOfSourceString, K: maxSubstringLength)
    }
}

// use
splitUpStringToSubstrings(S: testString, K: 3)     // -1
substrings.removeAll()
splitUpStringToSubstrings(S: testString, K: 8)     // 8
substrings.removeAll()
splitUpStringToSubstrings(S: testString, K: 22)    // 3




// variant 2
//------------------

func solution(S: String, K: Int) -> Int {
    
    var sourceString = S
    let maxSubstringLength = K
    var substringCounter = 0

    if sourceString.count < 1 || sourceString.count > 500 {
        return -1
    }
    
    // solve
    while maxSubstringLength < sourceString.count {
        
        guard let lastIndexOfSubstring = sourceString.index(sourceString.startIndex, offsetBy: maxSubstringLength, limitedBy: sourceString.endIndex) else { return -1 }
        
        if sourceString[lastIndexOfSubstring] == " " {
            sourceString = String(sourceString[lastIndexOfSubstring...].dropFirst())
            substringCounter += 1
            
        } else {
            let rawSubstring = sourceString[...lastIndexOfSubstring]
            guard let indexOfLastSpace = rawSubstring.lastIndex(of: " ") else { return -1 }
            sourceString = String(sourceString[indexOfLastSpace...].dropFirst())
            substringCounter += 1
        }
    }
    
    if sourceString.count <= maxSubstringLength {
        substringCounter += 1
    }
    
    return substringCounter
}

// use
solution(S: testString, K: 44)     // 2
