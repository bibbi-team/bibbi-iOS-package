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
/// 이 매크로는 매개변수로 넘겨진 문자열 리터럴을 [URL](https://developer.apple.com/documentation/foundation/url) 타입으로 변환한 코드를 전개합니다.
/// 인자로 주어진 문자열 리터럴이 유효하지 않다면 Error를 방출합니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// let apple = #URL("https://www.apple.com/kr")
///
/// // Begin expansion of "#URL"
/// let apple = URL(string: "https://www.apple.com/kr")
/// // End expansion of "#URL"
/// ```
///
/// - Note: 매크로가 전개되기 전에 전개 단계에서 매개변수로 넘겨진 문자열 리터럴이 유효한지 확인하기에 런타임 경고가 발생할 여지를 차단합니다.
/// - Author: 김소월
///
@freestanding(expression)
public macro URL(_ s: String) -> URL = #externalMacro(
    module: "MacrosImplementation",
    type: "URLMacro"
)
