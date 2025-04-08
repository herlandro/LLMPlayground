//
//  PromptView.swift
//  LLMPlayground
//
//  Created by Herlandro Hermogenes on 08/04/2025.
//

import SwiftUI

enum Engine: CustomStringConvertible {
    case openAI
    case claude
    case local
    
    var description: String {
        switch self {
        case .openAI:
            return "OpenAI"
        case .claude:
            return "Claude"
        case .local:
            return "Local"
        }
        
    }
}

struct PromptView: View {
    @State private var prompt: String = ""
    @State private var response: String = ""
    @State private var selectedEngine: String = Engine.openAI.description
    
    var selectedService: LLMService {
        switch selectedEngine {
        case Engine.claude.description: return MockClaudeService()
        case Engine.local.description: return LocalFallbackService()
        default: return OpenAIService()
        }
    }
    
    var body: some View {
        VStack {
            
            TextField("Enter your prompt...", text: $prompt)
                .textFieldStyle(.roundedBorder)
            
            Button("Send") {
                Task {
                    do {
                        response = try await selectedService.generateResponse(for: prompt)
                        
                    } catch {
                        response = "Error: \(error.localizedDescription)"
                    }
                }
            }
            
            Text(response)
                .padding()
            
            Picker("Engine", selection: $selectedEngine) {
                Text(Engine.openAI.description).tag(Engine.openAI.description)
                Text(Engine.claude.description).tag(Engine.claude.description)
                Text(Engine.local.description).tag(Engine.local.description)
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}
