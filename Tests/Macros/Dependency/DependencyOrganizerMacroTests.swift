//
//  File.swift
//  
//
//  Created by 김건우 on 6/26/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest

fileprivate let testMacros: [String: Macro.Type] = [
    "DependencyOrganizer": DependencyOrganizerMacro.self
]

final class DependencyOrganizerMacroTests: XCTestCase {
    
    func testDependencyOrganizerMacro() {
        
        assertMacroExpansion(
            """
            @DependencyOrganizer
            extension DependencyValues {
                var usecase: UseCaseProtocol
            }
            """,
            expandedSource:
            """
            extension DependencyValues {
                @DependencyValue(for: UsecaseKey.self)
                var usecase: UseCaseProtocol
            }
            """,
            macros: testMacros
        )
        
    }
    
}
