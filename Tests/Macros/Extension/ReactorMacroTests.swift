//
//  File.swift
//  
//
//  Created by 김건우 on 6/5/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest
import SyntaxHelper

fileprivate let testMacros: [String: Macro.Type] = [
    "Reactor": ReactorMacro.self
]

final class ReactorMacroTests: XCTestCase {
    
    func testReactorMacro() throws {
        
        assertMacroExpansion(
            """
            @Reactor
            class testReactor { }
            """,
            expandedSource:
            """
            class testReactor { }

            extension testReactor: Reactor {
            }
            """,
            macros: testMacros
        )
        
    }
    
}
