//
//  ContentView.swift
//  instargram clone app
//
//  Created by jsy on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    
    let circleTitle: [String] = ["cntmdwn2","ye.hyun__", "kimkijoong7777", "sunset.breeze", "daily_memoirs", "mocha.dreams", "echo_night", "wander.lusts","pixel.daisy", "hidden.pages", "cloudy.moon", "velvet.hour", "blooming.note","monday.journal", "milk_and_mind", "paper.crane", "violet.haze", "dusty.frame","quiet.bird", "midnight.vanilla", "soft.dreamr", "leafletter", "seafoam.feels","bliss.orbit", "inkdrop.notes", "soulpattern", "mint._sky", "gloaming_days","solace_cafe", "lavender.path", "northern.fade", "whisper.folk", "mono.muse","foggy.morning", "tiny.gardenr", "kindlight", "studio.quiet", "dawn.collective","pastel.yarn", "muse._chapter", "stardust.flair", "grey.summer", "rivergrain","humble.mood", "twilight.coast", "tempo.clay", "peachy.lines", "noir.moment","paperwhites", "hollow_blossom", "dreamr.box", "calmchaos_", "sunday_harbor","iriswindow", "moonlight__.lane", "velvetchapter", "ocean.sketches", "cotton.lens","chapters.of.now", "snowy.ink", "serif.skies", "mellowpoet", "coffeebean.art","evening._field", "clouded_lily", "skylore_", "gathered_.light", "horizon.tale","poise_and_plain", "timber_paint", "silence.voice", "lilacrow", "stillness.grid","canvas.sighs", "mapleandco", "poetic.studio", "drift.wish", "honeyed._script","murmur_slate", "evergray_folk", "sienna_frame", "echoverse", "daisygraph","softly.drawn", "gentle.spell", "fielddream", "winter_.flora", "mintcloud.cove","ink_and_after", "silkenwhim", "brass_letter", "noonfog", "echoing.paint","lofiglory", "moon_drifted", "plume.pages", "blossom_.clay", "softcore_.story","rainberry.chime", "tenderlines", "fragile_.sun", "sleepy.arc", "quietwave_","elm_and_dream", "harvest._muse", "morning_loops", "note_.petal", "whim.co","leafshade_", "earlymist", "pebble_.verse", "murky.velvet", "sunprint_.co","tinywonder_", "honeyedgrain", "lilith.sketch", "neutral.dusk", "gossamer_.ink","gardenblur", "threadjournal", "offwhite._lake", "myst_.letter", "terra_note","ivoryspell", "sepia_path", "daily_still", "mono.shades", "canvas.craft","meadowline", "slate_.harbor", "dawnverse", "nocturne_daisy", "moondrawn","sketchhaze", "floralgrain", "early_dreamer", "quietspell_", "fogframe","museleaf_", "cottonword", "seren.line", "whitenoise_dream", "orbit.note","kind_.garden", "breezy.mood", "sunripple_", "leafmuse", "rustic.slate","pale_.focus", "honeycanvas_", "whisperfield", "inkedpoem", "calmflora","tinywander_", "skyletters", "stillframe.dust", "velvetroot"]
        
        let UserName: [String] = ["ye.hyun__","cntmdwn2",  "kimkijoong7777", "sunset.breeze", "daily_memoirs", "mocha.dreams", "echo_night", "wander.lusts","pixel.daisy", "hidden.pages", "cloudy.moon", "velvet.hour", "blooming.note","monday.journal", "milk_and_mind", "paper.crane", "violet.haze", "dusty.frame","quiet.bird", "midnight.vanilla", "soft.dreamr", "leafletter", "seafoam.feels","bliss.orbit", "inkdrop.notes", "soulpattern", "mint._sky", "gloaming_days","solace_cafe", "lavender.path", "northern.fade", "whisper.folk", "mono.muse","foggy.morning", "tiny.gardenr", "kindlight", "studio.quiet", "dawn.collective","pastel.yarn", "muse._chapter", "stardust.flair", "grey.summer", "rivergrain","humble.mood", "twilight.coast", "tempo.clay", "peachy.lines", "noir.moment","paperwhites", "hollow_blossom", "dreamr.box", "calmchaos_", "sunday_harbor","iriswindow", "moonlight__.lane", "velvetchapter", "ocean.sketches", "cotton.lens","chapters.of.now", "snowy.ink", "serif.skies", "mellowpoet", "coffeebean.art","evening._field", "clouded_lily", "skylore_", "gathered_.light", "horizon.tale","poise_and_plain", "timber_paint", "silence.voice", "lilacrow", "stillness.grid","canvas.sighs", "mapleandco", "poetic.studio", "drift.wish", "honeyed._script","murmur_slate", "evergray_folk", "sienna_frame", "echoverse", "daisygraph","softly.drawn", "gentle.spell", "fielddream", "winter_.flora", "mintcloud.cove","ink_and_after", "silkenwhim", "brass_letter", "noonfog", "echoing.paint","lofiglory", "moon_drifted", "plume.pages", "blossom_.clay", "softcore_.story","rainberry.chime", "tenderlines", "fragile_.sun", "sleepy.arc", "quietwave_","elm_and_dream", "harvest._muse", "morning_loops", "note_.petal", "whim.co","leafshade_", "earlymist", "pebble_.verse", "murky.velvet", "sunprint_.co","tinywonder_", "honeyedgrain", "lilith.sketch", "neutral.dusk", "gossamer_.ink","gardenblur", "threadjournal", "offwhite._lake", "myst_.letter", "terra_note","ivoryspell", "sepia_path", "daily_still", "mono.shades", "canvas.craft","meadowline", "slate_.harbor", "dawnverse", "nocturne_daisy", "moondrawn","sketchhaze", "floralgrain", "early_dreamer", "quietspell_", "fogframe","museleaf_", "cottonword", "seren.line", "whitenoise_dream", "orbit.note","kind_.garden", "breezy.mood", "sunripple_", "leafmuse", "rustic.slate","pale_.focus", "honeycanvas_", "whisperfield", "inkedpoem", "calmflora","tinywander_", "skyletters", "stillframe.dust", "velvetroot"]
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(texts: circleTitle, username: UserName)
                    .tabItem{
                        Image(systemName: "house")
                    }
                RealsView()
                    .tabItem{
                        Image(systemName: "movieclapper.fill")
                    }
                UpLoadView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                ProfileView()
                    .tabItem{
                        Image(systemName: "person.circle")
                    }
            }
            .navigationTitle(Text("Instagram"))
        }
    }
}

#Preview {
    ContentView()
        .presentationDragIndicator(.visible)
        .presentationDetents([.medium])
}
