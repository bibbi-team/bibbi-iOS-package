//
//  File.swift
//  
//
//  Created by 김건우 on 6/1/24.
//

import SwiftSyntax

public extension AttributeListSyntax {
    
    /// 특정 속성이 적용되었는지 확인합니다.
    ///
    /// - Parameters:
    ///     - attributeName: 속성 이름
    /// - Returns: 속성이 있으면 true, 없으면 false
    ///
    /// - Author: 김소월
    ///
    func isAttributeApplied(_ attributeName: String) -> Bool {
        guard
            let _ = self.first(where: { attribute in
                attribute
                    .as(AttributeSyntax.self)?
                    .attributeName
                    .as(IdentifierTypeSyntax.self)?
                    .name.text == attributeName
            })
        else { return false }
        return true
    }
    
}
