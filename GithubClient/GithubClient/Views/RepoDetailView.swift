//
//  RepoDetailView.swift
//  GithubClient
//
//  Created by 大村勇人 on 2024/01/16.
//

import SwiftUI

struct RepoDetailView: View {
    let repo: Repo

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("GithubMark")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text(repo.owner.name)
                        .font(.caption)
                }

                Text(repo.name)
                    .font(.body)
                    .fontWeight(.bold)

                // Optional Binding を使って、descriptionがnilじゃない場合のみUIを表示する

                if let description = repo.description {
                    Text(description)
                        .padding(.top, 4)
                    // .top などの方向と余白の長さを指定することができます
                }

                HStack {
                    Image(systemName: "star")
                    Text("\(repo.stargazersCount) stars")
                }
                    .padding(.top, 8)
                Spacer()
            }
            Spacer()
        }
            .padding(8)
    }
}

#Preview {
    RepoDetailView(repo: .mock1)
}
