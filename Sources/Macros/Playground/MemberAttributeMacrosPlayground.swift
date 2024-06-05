//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

import MacrosInterface

@Deprecated
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func runMemberAttributeMacrosPlayground() {
    
    // MARK: - MemberDeprecated MemberAttribute
    
    let person = Person(name: "김소월", age: 27)
    print(person.name)
    print(person.age)
    
}
