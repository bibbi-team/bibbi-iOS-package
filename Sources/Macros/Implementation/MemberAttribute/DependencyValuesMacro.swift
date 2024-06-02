//
//  File.swift
//  
//
//  Created by 김건우 on 6/1/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SyntaxHelper

public struct DependencyOrganizerMacro: MemberAttributeMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingAttributesFor member: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [AttributeSyntax] {
        guard
            let _ = declaration.as(ExtensionDeclSyntax.self)
        else {
            throw MacroError.message("이 매크로는 Extension에만 적용할 수 있습니다.")
        }
        
        guard
            let varDecl = member.as(VariableDeclSyntax.self),
            varDecl.isStoredProperty,
            let identifier = varDecl.bindings
                .first?.pattern
                .as(IdentifierPatternSyntax.self)?
                .identifier.text
        else {
            return []
        }
        
        if !varDecl.attributes.isAttributeApplied("DependencyValue") {
           let capitalizedIdentifier = identifier.makeFirstLetterLowercase()
            
            return [
                """
                @DependencyValue(for: \(raw: capitalizedIdentifier)Key.self)
                """
            ]
        }
        return []
        
    }
    
}
