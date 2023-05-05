//
//  Memo.swift
//  TCA_Simple_tutorial
//
//  Created by Joy on 2023/05/05.
//

import Foundation

// MARK: - WelcomeElement
struct Memo: Codable, Equatable, Identifiable {
    let createdAt, title, viewCount, id: String
}

typealias Memos = [Memo]
