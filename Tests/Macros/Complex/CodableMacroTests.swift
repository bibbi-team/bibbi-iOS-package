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
    "Codable": CodableMacro.self,
    "CodableKey": CodableKeyMacro.self
]

final class CodableMacroTests: XCTestCase {
    
    func testCodableMacro() throws {
        
        assertMacroExpansion(
            """
            @Codable
            struct Member {
                var name: String
            }
            """,
            expandedSource:
            """
            struct Member {
                var name: String
            
                private enum CodingKeys: String, CodingKey {
                    case name
                }
            }
            
            extension Member: Codable {
            }
            """,
            macros: testMacros
        )
        
    }
    
}
