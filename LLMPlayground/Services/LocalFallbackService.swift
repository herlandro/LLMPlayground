//
//  LocalFallbackService.swift
//  LLMPlayground
//
//  Created by Herlandro Hermogenes on 08/04/2025.
//

import Foundation

struct LocalFallbackService: LLMService {
    func generateResponse(for prompt: String) async throws -> String {
        return "Local response (no real AI): Remember to think for yourself!"
    }
}
