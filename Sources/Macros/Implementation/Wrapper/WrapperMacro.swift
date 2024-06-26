//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct WrapperMacro { }

extension WrapperMacro: MemberMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard
            let _ = declaration.as(ClassDeclSyntax.self)
        else {
            throw MacroError.message("이 매크로는 Class에만 적용할 수 있습니다.")
        }
        
        guard
            let genericArguments = node.attributeName
                .as(IdentifierTypeSyntax.self)?
                .genericArgumentClause?
                .arguments,
            let firstGenericType = genericArguments
                .first?
                .argument,
            let lastGenericType = genericArguments
                .last?
                .argument
        else {
            throw MacroError.message("매크로 선언으로 전달된 Generic 타입이 유효하지 않습니다.")
        }
        
        let scope = declaration.getAccessControl()
        
        return [
            """
            \(scope)typealias R = \(firstGenericType)
            """,
            """
            \(scope)typealias V = \(lastGenericType)
            """,
            
            """
            \(scope)func makeViewController() -> V {
                return \(lastGenericType)(reactor: makeReactor())
            }
            """,
            
            """
            \(scope)var viewController: V {
                return makeViewController()
            }
            """,
            """
            \(scope)var reactor: R {
                return makeReactor()
            }
            """
        ]
    }
    
}

extension WrapperMacro: ExtensionMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        let baseWrapperExtension = try ExtensionDeclSyntax("extension \(type.trimmed): BaseWrapper { }")
        
        return [baseWrapperExtension]
    }
    
}
