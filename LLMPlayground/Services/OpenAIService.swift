//
//  OpenAIService.swift
//  LLMPlayground
//
//  Created by Herlandro Hermogenes on 08/04/2025.
//

import Foundation

final class OpenAIService: LLMService {
    private let apiKey = "API_KEY"
    
    func generateResponse(for prompt: String) async throws -> String {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [["role": "user", "content": prompt]]
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(OpenAIResponse.self, from: data)
        return response.choices.first?.message.content ?? "No response"
    }
}
