//
//  File.swift
//  
//
//  Created by 김건우 on 6/26/24.
//

/// 타입이 BaseWrapper 프로토콜을 준수하게 합니다.
///
/// 이 매크로를 적용한 타입에 BaseWrapper 프로토콜을 준수하게 하고 make() 메서드 및 viewController, reactor 계산 프로퍼티를 추가합니다.
///
/// 첫 번째 Generic 타입은 Reactor 프로토콜을 준수하는 타입이어야 하고, 두 번째 Generic 타입은 ReactorKit.View 프로토콜을 준수하는 타입이어야 합니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// @Wrapper<HomeReactor, HomeViewController>
/// public class HomeViewControllerWrapper {
///     public func makeReactor() -> R {
///         return HomeReactor()
///     }
///
///     // Begin expansion of "@Wrapper"
///     public typealias R = HomeReactor
///     public typealias V = ViewController
///
///     public func makeViewController() -> V {
///          return HomeViewController(reactor: makeReactor())
///     }
///
///     public var viewController: V {
///         return makeViewController()
///     }
///
///     public var reactor: R {
///         return makeReactor()
///     }
///     // End expansion of "@Wrapper"
/// }
/// // Begin expansion of "@Wrapper"
/// extension HomeViewControllerWrapper: BaseWrapper { }
/// // End expansion of "@Wrapper"
/// ```
///
/// - 참고:  BaseWrapper 프로토콜은 아래와 같이 선언되어 있습니다.
/// ```swift
/// public protocol BaseWrapper {
///     associatedtype R: Reactor
///     associatedtype V: ReactorKit.View
///
///     func makeReactor() -> R
/// }
/// ```
/// 이 매크로는 첨부된 선언의 접근 제어자에 따라 전개되는 멤버의 접근 제어자가 바뀝니다. 예를 들어, 첨부 Class가 public 접근 제어자를 가진다면 전개되는 멤버도 public 접근 제어자를 가집니다.
///
/// - Warning: 이 매크로는 Class에만 적용할 수 있습니다.
///
/// - Author: 김소월
///
@attached(member, names: arbitrary)
@attached(extension, conformances: BaseWrapper)
public macro Wrapper<R, V>() = #externalMacro(
    module: "MacrosImplementation",
    type: "WrapperMacro"
)

