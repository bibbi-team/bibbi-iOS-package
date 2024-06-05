//
//  File.swift
//  
//
//  Created by 김건우 on 6/2/24.
//

import SwiftSyntax

public extension DeclGroupSyntax {
    
    // 문서 작성
    
    func getAccessControl() -> DeclModifierSyntax {
        modifiers
            .first(where: { modifier in
                let tokenKind = modifier.name.tokenKind
                return tokenKind == .keyword(.open) ||
                tokenKind == .keyword(.public) ||
                tokenKind == .keyword(.internal) ||
                tokenKind == .keyword(.fileprivate) ||
                tokenKind == .keyword(.private) ||
                tokenKind == .keyword(.package)
            })
        // 접근 제어자를 찾을 수 없다면 internal 접근 제어자 반환
        ?? DeclModifierSyntax(
            name: .keyword(.internal),
            trailingTrivia: [.spaces(1)]
        )
    }
    
}
