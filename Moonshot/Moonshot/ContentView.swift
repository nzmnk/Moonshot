//
//  ContentView.swift
//  Moonshot
//
//  Created by Никита Зименко on 15.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: Text("Details")) {
                    
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
//                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                       Text(mission.displayName)
                       Text(mission.launchDate ?? "N/A") // If no data presented -- N/A
                   }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
