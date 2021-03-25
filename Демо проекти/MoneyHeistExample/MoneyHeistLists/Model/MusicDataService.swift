//
//  MusicDataService.swift
//  NavigationExample
//
//  Created by Andriy Stefanchuk on 15.03.2021.
//

import Foundation

protocol MusicDataService {
    func getMusicTracks() -> [MusicTrack]
}

struct MusicFactory: MusicDataService {
    func getMusicTracks() -> [MusicTrack] {
        [
            MusicTrack(
                name: "My Life Is Going On",
                author: "Cecillia Krull"
            ),
            MusicTrack(
                name: "Bella Ciao",
                author: "Italy Folk"
            ),
            MusicTrack(
                name: "Lonely Boys",
                author: "Black Keys"
            ),
            MusicTrack(
                name: "The Entertainer",
                author: "Scott Joplin"
            ),
            MusicTrack(
                name: "Boom",
                author: "Ofi La Melodia"
            )
        ]
    }
}
