//
//  URLMacro.swift
//
//
//  Created by 김건우 on 5/24/24.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct URLMacro: ExpressionMacro {
    
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard
            let argument = node.argumentList.first?.expression,
            let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
            segments.count == 1,
            case let .stringSegment(literalSegment)? = segments.first
        else {
            throw MacroError.message("올바른 문자열 리터럴을 전달해야 합니다.")
        }
        
        let stringLiteral = literalSegment.content.text
        
        guard
            let _ = URL(string: stringLiteral)
        else {
            throw MacroError.message("유효하지 않은 URL: \(stringLiteral)")
        }
        
        return "URL(string: \(literal: stringLiteral))!"
    }
    
}

