//
//  File.swift
//  
//
//  Created by 김건우 on 6/5/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ReactorMacro: ExtensionMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {        
        let reactorExtension = try ExtensionDeclSyntax("extension \(type.trimmed): Reactor { }")
        
        return [reactorExtension]
    }
    
}
