import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest



fileprivate let testMacros: [String: Macro.Type] = [
    "URL": URLMacro.self
]

final class URLMacroTests: XCTestCase {
   
    func testURLMacro() throws {
        
        assertMacroExpansion(
            """
            #URL("https://www.apple.com/kr/")
            """,
            expandedSource:
            """
            URL(string: "https://www.apple.com/kr/")!
            """,
            macros: testMacros
        )
        
    }
    
    func testURLMacroError() throws {
        
        assertMacroExpansion(
            #"""
            #URL("https://\(domain)/api/path")
            """#,
            expandedSource:
            #"""
            #URL("https://\(domain)/api/path")
            """#,
            diagnostics: [
                DiagnosticSpec(
                    message: "올바른 문자열 리터럴을 전달해야 합니다.",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
        
    }
    
}
