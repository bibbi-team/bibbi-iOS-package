//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import Dependencies
import MacrosInterface

// MARK: - DependencyValue Accessor

protocol RepositoryProtocol {
    func request() -> String
}
class Repository: RepositoryProtocol {
    func request() -> String {
        return "Hello, World!"
    }
}

struct RepositoryKey: DependencyKey {
    static let liveValue: RepositoryProtocol = Repository()
}
extension DependencyValues {
    @DependencyValue(for: RepositoryKey.self)
    var repository: RepositoryProtocol
}

class UseCase {
    @Dependency(\.repository) private var repository: RepositoryProtocol
    
    func execute() -> String {
        repository.request()
    }
}





func runAccessorMacrosPlayground() {
    
    let usecase = UseCase()
    print("DepdencyValue Test: \(usecase.execute())")
    
}
