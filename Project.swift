import ProjectDescription

let project = Project(
    name: "TestingTask",
    targets: [
        // MARK: - Core Module
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.my.TestingTask.Core",
            deploymentTargets: .iOS("15.0"),
            sources: ["Modules/Core/Sources/**"],
            dependencies: []
        ),
        
        // MARK: - Auth Module
        .target(
            name: "Auth",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.my.TestingTask.Auth",
            deploymentTargets: .iOS("15.0"),
            sources: ["Modules/Auth/Sources/**"],
            resources: ["Modules/Auth/Sources/**/*.xib"],
            dependencies: [
                .target(name: "Core")
            ]
        ),
        
        // MARK: - Home Module
        .target(
            name: "Home",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.my.TestingTask.Home",
            deploymentTargets: .iOS("15.0"),
            sources: ["Modules/Home/Sources/**"],
            resources: ["Modules/Home/Sources/**/*.xib"],
            dependencies: [
                .target(name: "Core"),
                .target(name: "Auth"),
                .target(name: "Profile")
            ]
        ),
        
        // MARK: - Profile Module
        .target(
            name: "Profile",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.my.TestingTask.Profile",
            deploymentTargets: .iOS("15.0"),
            sources: ["Modules/Profile/Sources/**"],
            resources: ["Modules/Profile/Sources/**/*.xib"],
            dependencies: [
                .target(name: "Core")
            ]
        ),
        
        // MARK: - Main App Target
        .target(
            name: "TestingTask",
            destinations: .iOS,
            product: .app,
            bundleId: "com.my.TestingTask",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen",
                    "UIMainStoryboardFile": "Main",
                    "UISupportedInterfaceOrientations": [
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight"
                    ],
                    "UISupportedInterfaceOrientations~ipad": [
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationPortraitUpsideDown",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight"
                    ]
                ]
            ),
            sources: [
                "TestingTask/AppDelegate.swift",
                "TestingTask/SceneDelegate.swift",
                "TestingTask/ViewController.swift"
            ],
            resources: [
                "TestingTask/**/*.storyboard", 
                "TestingTask/Assets.xcassets"
            ],
            dependencies: [
                .target(name: "Core"),
                .target(name: "Auth"),
                .target(name: "Home"),
                .target(name: "Profile")
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "TestingTask",
            shared: true,
            buildAction: .buildAction(targets: ["TestingTask"]),
            runAction: .runAction(configuration: .debug, executable: "TestingTask"),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release, executable: "TestingTask"),
            analyzeAction: .analyzeAction(configuration: .debug)
        )
    ]
)