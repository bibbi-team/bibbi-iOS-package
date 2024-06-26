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
    "Wrapper": WrapperMacro.self
]

final class WrapperMacroTests: XCTest {
    
    func testWrapperMacro() throws {
        
        assertMacroExpansion(
            """
            @Wrapper<TestReactor, TestViewController>
            public class TestViewControllerWrapper {
                
                public func makeReactor() -> R {
                    return TestReactor()
                }
                
            }
            """,
            expandedSource:
            """
            public class TestViewControlllerWrapper {
                
                public func makeReactor() -> R {
                    return TestReactor()
                }
            
                public typealias R = TestReactor

                public typealias V = TestViewController

                public func makeViewController() -> V {
                    return TestViewController(reactor: makeReactor())
                }

                public var viewController: V {
                    return makeViewController()
                }

                public var reactor: R {
                    return makeReactor()
                }
            
            }
            """,
            macros: testMacros
        )
        
    }
    
}
