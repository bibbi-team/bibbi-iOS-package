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
    
    func testCodableKeyMacro() throws {
        
        assertMacroExpansion(
            """
            @Codable
            struct Member {
                var name: String
                @CodableKey(name: "day_of_birth") var dayOfBirth: String
            }
            """,
            expandedSource:
            """
            struct Member {
                var name: String
                var dayOfBirth: String
            
                private enum CodingKeys: String, CodingKey {
                    case name
                    case dayOfBirth = "day_of_birth"
                }
            }
            
            extension Member: Codable {
            }
            """,
            macros: testMacros
        )
        
    }
    
}
