//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct CodableKeyMacro: PeerMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard
            let segments = node.arguments?
                .as(LabeledExprListSyntax.self)?
                .first?.expression
                .as(StringLiteralExprSyntax.self)?
                .segments,
            segments.count == 1
        else {
            throw MacroError.message("유효하지 않은 문자열 리터럴입니다.")
        }
        
        return []
    }
    
}


