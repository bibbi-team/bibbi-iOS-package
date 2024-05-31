//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import SwiftSyntax
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
        @Wrapper<SomeReactor, SomeViewController>
        public class SomeViewControlllerWrapper {
            
            public func makeReactor() -> R {
                return SomeReactor()
            }
            
        }
        """,
        expandedSource: 
        """
        public class SomeViewControlllerWrapper {
            
            public func makeReactor() -> R {
                return SomeReactor()
            }
        
            public typealias R = SomeReactor

            public typealias V = SomeViewController

            public func makeViewController() -> V {
                return SomeViewController(reactor: makeReactor())
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
