//
//  MockClaudeService.swift
//  LLMPlayground
//
//  Created by Herlandro Hermogenes on 08/04/2025.
//

import Foundation

struct MockClaudeService: LLMService {
    func generateResponse(for prompt: String) async throws -> String {
        return "Claude (mock) responde: \(prompt.uppercased())"
    }
}
