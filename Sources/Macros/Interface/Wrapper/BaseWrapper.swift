//
//  File.swift
//  
//
//  Created by 김건우 on 6/26/24.
//

import ReactorKit

public protocol BaseWrapper {
    associatedtype R: Reactor
    associatedtype V: ReactorKit.View
    
    func makeReactor() -> R
}
