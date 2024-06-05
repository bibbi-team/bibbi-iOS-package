//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

import Foundation
import MacrosInterface

// MARK: - Codable Complex

@Codable
struct MemberDTO {
    var name: String
    @CodableKey(name: "day_of_birth") var dayOfBirth: String
    var age: Int
}


// MARK: - Wrapper Complex

#if canImport(UIKit)

import UIKit
import ReactorKit

class HomeReactor {
    typealias Action = NoAction
    
    struct State { }
    
    var initialState: State = State()
}

extension HomeReactor: Reactor { }

extension HomeReactor: Identifiable {
    public var id: UUID { UUID() }
}

extension HomeReactor: Equatable {
    static func == (
        lhs: HomeReactor,
        rhs: HomeReactor
    ) -> Bool {
        return lhs.id == rhs.id
    }
}

class HomeViewController: UIViewController, ReactorKit.View {
    typealias Reactor = HomeReactor
    var disposeBag = DisposeBag()
    
    convenience init(reactor: Reactor) {
        self.init()
        self.reactor = reactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bind(reactor: HomeReactor) { }
}

@Wrapper<HomeReactor, HomeViewController>
class HomeViewControllerWrapper {
    
    func makeReactor() -> R {
        return HomeReactor()
    }
    
}


func runWrapperMacro() {
    let vc = HomeViewControllerWrapper().viewController
    print("HomeViewController: \(vc)")
}

#endif




// MARK: - Wrapper View Complex

#if canImport(UIKit)

import UIKit

class HomeView: UIView, ReactorKit.View {
    typealias Reactor = HomeReactor
    var disposeBag = DisposeBag()
    
    convenience init(reactor: Reactor) {
        self.init()
        self.reactor = reactor
    }
    
    func bind(reactor: HomeReactor) { }
}

@WrapperView<HomeReactor, HomeView>
class HomeViewWrapper {
    
    func makeReactor() -> R {
        return HomeReactor()
    }
    
}

func runWrapperViewMacro() {
    let v = HomeViewWrapper().view
    print("HomeView: \(v)")
}



#endif


func runComplexMacorsPlayground() {
    
    let jsonString = """
    {
        \"name\":\"김소월\",
        \"day_of_birth\":\"1998-03-21\",
        \"age\": 27
    }
    """
    if let jsonData = jsonString.data(using: .utf8),
       let decodedMember = try? JSONDecoder().decode(MemberDTO.self, from: jsonData) {
        print("Decoded Member: \(decodedMember)")
    }
    
    
    #if canImport(UIKit)
    
    runWrapperMacro()
    runWrapperViewMacro()
    
    #endif
    
}


