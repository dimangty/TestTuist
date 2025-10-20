import ProjectDescription

let workspace = Workspace(
    name: "TestingTask",
    projects: [
        "."
    ],
    schemes: [],
    fileHeaderTemplate: .none,
    additionalFiles: [
        "README.md",
        .folderReference(path: "Documentation")
    ]
)