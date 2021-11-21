//
//  User.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

struct User {
    let login: String
    let password: String
}

extension User: Equatable {
    static func ==(lhs: User, rhs: User) -> Bool {
        lhs.login == rhs.login &&
        lhs.password == rhs.password
    }
}
