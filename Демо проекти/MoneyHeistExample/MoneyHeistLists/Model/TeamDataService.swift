//
//  TeamDataService.swift
//  NavigationExample
//
//  Created by Andy Stef on 14.03.2021.
//

import Foundation

protocol TeamDataService {
    func getTeamMembers() -> [TeamMember]
}

struct TeamFactory: TeamDataService {
    func getTeamMembers() -> [TeamMember] {
        [
            TeamMember(
                name: "The Professor",
                gender: .male,
                image: "professor",
                isAlive: true,
                description: "A mysterious man with no known past, recruits a Heist Team to carry out the plan he has developed."
            ),
            TeamMember(
                name: "Berlin",
                gender: .male,
                image: "berlin",
                isAlive: false,
                description: "The Lancer, a veteran jewel robber who became a criminal to sustain his expensive lifestyle. A Soft-Spoken Sadist, he looks down on the rest of the group, but hides it behind his fine manners."
            ),
            TeamMember(
                name: "Tokyo",
                gender: .female,
                image: "tokyo",
                isAlive: true,
                description: "A young, tough, impulsive bank robber, she has been alternating legal work with several robberies, the latest of which went awry and ended with the death of two cops and her boyfriend - and she has been on the run ever since."
            ),
            TeamMember(
                name: "Nairobi",
                gender: .female,
                image: "nairobi",
                isAlive: true,
                description: "A happy-go-lucky woman that became a counterfeiter after her boyfriend left her pregnant and abandoned her: her aim is to use the money she gains so as to regain her son's custody and retire somewhere else."
            ),
            TeamMember(
                name: "Rio",
                gender: .male,
                image: "rio",
                isAlive: true,
                description: "A somewhat immature, but Nice Guy, Playful Hacker/Teen Genius, he became chief technician in a security company, but ended up on the Interpol watchlist when he started hacking and cracking security systems."
            ),
            TeamMember(
                name: "Moscow",
                gender: .male,
                image: "moscow",
                isAlive: false,
                description: "A former miner who became a locksmith after illness forced him to leave his job, he started to use his skills to rob bank vaults and jewelries to feed his family. He has been in and out of prison for this."
            ),
            TeamMember(
                name: "Denver",
                gender: .male,
                image: "denver",
                isAlive: true,
                description: "Moscow's son, he has spent most of his life as a thug and trying drugs, which have left him with a Hair-Trigger Temper and bad disposition that he only relaxes around his father."
            ),
            TeamMember(
                name: "Helsinki",
                gender: .male,
                image: "helsinki",
                isAlive: true,
                description: "One of The Brutes of the group. Little is known of this Serbian beyond the fact that he comes from a violent past, not helped by the fact that he speaks little, letting his weapons and partners do the talking."
            ),
            TeamMember(
                name: "Oslo",
                gender: .male,
                image: "oslo",
                isAlive: false,
                description: "One of The Brutes of the group. Little is known of this Serbian beyond the fact that he comes from a violent past, not helped by the fact that he speaks little, letting his weapons and partners do the talking."
            ),
        ]
    }
}
