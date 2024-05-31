//
//  ExpressionMacrosInterface.swift
//
//
//  Created by 김건우 on 5/24/24.
//

import Foundation

// MARK: - URL Expression

/// 유효한 URL을 반환합니다.
///
/// 해당 매크로는 인자로 주어진 문자열 리터럴을 [URL](https://developer.apple.com/documentation/foundation/url) 타입으로 변환한 코드를 확장합니다.
/// 인자로 주어진 문자열 리터럴이 유효하지 않다면 Error를 방출합니다.
///
/// 아래는 확장되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// let apple = #URL("https://www.apple.com/kr")
///
/// // Begin expansion of "#URL"
/// let apple = URL(string: "https://www.apple.com/kr")
/// // End expansion of "#URL"
/// ```
///
/// - Note: 코드가 확장되기 전에 확장 단계에서 인자로 주어진 문자열 리터럴이 유효한지 확인하기에 런타임 도중 Error를 방출하지 않습니다.
/// - Author: 김소월
///
@freestanding(expression)
public macro URL(_ s: String) -> URL = #externalMacro(
    module: "MacrosImplementation",
    type: "URLMacro"
)
