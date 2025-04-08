//
//  OpenAIResponse.swift
//  LLMPlayground
//
//  Created by Herlandro Hermogenes on 08/04/2025.
//

import Foundation

struct OpenAIResponse: Decodable {
    struct Choice: Decodable {
        let message: Message
    }

    struct Message: Decodable {
        let content: String
    }

    let choices: [Choice]
}
