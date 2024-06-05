//
//  File.swift
//  
//
//  Created by 김건우 on 5/24/24.
//

import SwiftDiagnostics

struct MacroDiagnostic: DiagnosticMessage, Error {
    let message: String
    let diagnosticID: MessageID
    let severity: DiagnosticSeverity
}

extension MacroDiagnostic: FixItMessage {
    var fixItID: MessageID { diagnosticID }
}

enum MacroError: Error, CustomStringConvertible {
    
    case message(String)
    
    var description: String {
        switch self {
        case .message(let text):
            return text
        }
    }
    
}
