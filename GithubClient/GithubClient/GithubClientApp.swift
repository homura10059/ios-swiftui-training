//
//  GithubClientApp.swift
//  GithubClient
//
//  Created by 大村勇人 on 2024/01/15.
//

import SwiftUI

@main
struct GithubClientApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RepoListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
