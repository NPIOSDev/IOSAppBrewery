//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let stories: [Story] = [
        Story(title: "You see a fork in the road.", choices: ["Take a left": 1, "Take a right": 2]),
        Story(title: "You see a tiger.", choices: ["Shout for help": nil, "Play dead": nil]),
        Story(title: "You find a treasure chest.", choices: ["Open it": nil, "Check for traps": nil]),
    ]
    
    var storyIndex = 0
    var currentStory: Story {
        return stories[storyIndex]
    }
    
    mutating func nextStory(_ choice:String) {
        let story = stories[storyIndex]
        let nextIndex = story.choices[choice]
        
        if (nextIndex! != nil) {
            storyIndex = nextIndex!!
        } else {
            storyIndex = 0
        }
    }
}

