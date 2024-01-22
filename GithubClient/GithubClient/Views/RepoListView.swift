import SwiftUI
import CoreData

struct RepoListView: View {
    @StateObject private var viewModel = RepoListViewModel()

    var body: some View {

        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView("loading...")
                case let .loaded(repos):
                    List(repos) { repo in
                        NavigationLink(
                            destination: RepoDetailView(repo: repo).navigationTitle("Repository Detail")
                        ) {
                            RepoRow(repo: repo)

                        }
                    }
                case .failed:
                    VStack {
                        Text("Failed to load repositories")
                        Button(
                            action: {
                                Task {
                                    await viewModel.onRetryButtonTapped()
                                }
                            },
                            label: {
                                Text("Retry")
                            }
                        )
                            .padding()
                    }
                }
            }.navigationTitle("Repositories")

        }.task {
            await viewModel.onAppear()
        }
    }
}

#Preview {
    RepoListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
