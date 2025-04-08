//
//  LLMService.swift
//  LLMPlayground
//
//  Created by Herlandro Hermogenes on 08/04/2025.
//

protocol LLMService {
    func generateResponse(for prompt: String) async throws -> String
}
