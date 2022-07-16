//
//  ResultTypeExample.swift
//  HotProspectExample
//
//  Created by Manoel Leal on 16/07/22.
//

import SwiftUI

struct ResultTypeExample: View {
    
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings."
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download error: \(error.localizedDescription)"
        }
        
    }
}

struct ResultTypeExample_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeExample()
    }
}
