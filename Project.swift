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
            resources: ["Modules/Core/Sources/Resources/**"],
            scripts: [
                .pre(
                    script: """
                    cd "$SRCROOT/Modules/Core"
                    if which swiftgen >/dev/null; then
                      swiftgen config run
                    else
                      echo "warning: SwiftGen not installed, download it from https://github.com/SwiftGen/SwiftGen"
                    fi
                    """,
                    name: "SwiftGen"
                )
            ],
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
        
        // MARK: - Dev App Target
        .target(
            name: "TestingTaskDev",
            destinations: .iOS,
            product: .app,
            bundleId: "com.my.TestingTask.dev",
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
            ],
            settings: .settings(
                base: [
                    "CODE_SIGN_STYLE": "Automatic",
                    "DEVELOPMENT_TEAM": "HFPP3AWX8N"
                ]
            )
        ),

        // MARK: - Sand App Target
        .target(
            name: "TestingTaskSand",
            destinations: .iOS,
            product: .app,
            bundleId: "com.my.TestingTask.sand",
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
            ],
            settings: .settings(
                base: [
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "SAND",
                    "CODE_SIGN_STYLE": "Automatic",
                    "DEVELOPMENT_TEAM": "HFPP3AWX8N"
                ]
            )
        )
    ],
    schemes: [
        .scheme(
            name: "TestingTaskDev",
            shared: true,
            buildAction: .buildAction(targets: ["TestingTaskDev"]),
            runAction: .runAction(configuration: .debug, executable: "TestingTaskDev"),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release, executable: "TestingTaskDev"),
            analyzeAction: .analyzeAction(configuration: .debug)
        ),
        .scheme(
            name: "TestingTaskSand",
            shared: true,
            buildAction: .buildAction(targets: ["TestingTaskSand"]),
            runAction: .runAction(configuration: .debug, executable: "TestingTaskSand"),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release, executable: "TestingTaskSand"),
            analyzeAction: .analyzeAction(configuration: .debug)
        )
    ]
)