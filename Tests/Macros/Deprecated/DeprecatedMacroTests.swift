//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest

fileprivate let testMacros: [String: Macro.Type] = [
    "MemberDeprecated": DeprecatedMacro.self
]

final class MemberDeprecatedMacroTests: XCTestCase {
    
    func testMemberDeprecatedMacro() {
        
        assertMacroExpansion(
            """
            @MemberDeprecated
            class Pet {
                var name: String
                init(name: String) { self.name = name }
            }
            """,
            expandedSource:
            """
            class Pet {
                @available(*, deprecated)
                var name: String
                @available(*, deprecated)
                init(name: String) { self.name = name }
            }
            """,
            macros: testMacros
        )
        
    }
    
}
