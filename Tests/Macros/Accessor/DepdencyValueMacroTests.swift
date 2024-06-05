//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest

fileprivate let testMacros: [String: Macro.Type] = [
    "DependencyValue": DependencyValueMacro.self
]

final class DepdencyValueMacroTests: XCTestCase {
    
    func testDependecyValueMacro() throws {
        
        assertMacroExpansion(
            """
            extension DependencyValues {
                @DependencyValue(for: UseCaseKey.self)
                var usecas: UseCaseProtocol
            }
            """,
            expandedSource:
            """
            extension DependencyValues {
                var usecas: UseCaseProtocol {
                    get {
                        self [UseCaseKey.self]
                    }
                    set {
                        self [UseCaseKey.self] = newValue
                    }
                }
            }
            """,
            macros: testMacros
        )
        
    }
    
}
