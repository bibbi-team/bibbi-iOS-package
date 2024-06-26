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
    "WrapperView": WrapperViewMacro.self
]

final class WrapperViewMacroTests: XCTestCase {
    
    func testWrapperViewMacro() {
        
        assertMacroExpansion(
            """
            @WrapperView<TestReactor, TestView>
            class TestViewWrapper {
                
                func makeReactor() -> R {
                    return TestReactor()
                }
            
            }
            """,
            expandedSource:
            """
            class TestViewWrapper {
                
                func makeReactor() -> R {
                    return TestReactor()
                }
            
                internal typealias R = TestReactor

                internal typealias V = TestView

                internal func makeView() -> V {
                    return TestView(reactor: makeReactor())
                }

                internal var view: V {
                    return makeView()
                }

                internal var reactor: R {
                    return makeReactor()
                }
            
            }
            
            extension TestViewWrapper: BaseWrapper {
            }
            """,
            macros: testMacros
        )
        
    }
    
}
