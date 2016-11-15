(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/usr/local/lib/python2.7/site-packages/certifi/cacert.pem")))
 '(package-selected-packages
   (quote
    (magit-find-file gist counsel-projectile counsel dash-at-point company-emoji string-edit plantuml-mode discover-my-major company-flx highlight-tail atomic-chrome multiple-cursors osx-trash flycheck-package modern-cpp-font-lock jenkins browse-at-remote rainbow-delimiters pdf-tools ws-butler form-feed jinja2-mode ranger smart-mode-line swiper volatile-highlights omnisharp flycheck company-quickhelp expand-region evil-iedit-state evil-iedit cmake-mode company-restclient focus ensime android-mode company-irony irony magithub restclient rest-client disable-mouse ansible-doc yaml-mode company-ansible pandoc-mode markdown-mode wgrep-ag ag fill-column-indicator clang-format projectile darkroom editorconfig ace-jump-mode fancy-narrow diff-hl git-messenger git-timemachine evil-magit idomenu smex ido-vertical-mode flx-ido ido-ubiquitous paradox yasnippet company org-projectile org-agenda-property orgit org-plus-contrib indent-guide which-key evil-quickscope evil-surround evil-commentary evil use-package)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((projectile-project-test-cmd . "./gradlew compileFatDebugUnitTestSources feedsdk:check")
     (projectile-project-compilation-cmd . "./gradlew compileFatDebugUnitTestSources feedsdk:check")
     (projectile-project-test-cmd . "gradlew compileFatDebugUnitTestSources feedsdk:check")
     (projectile-project-compilation-cmd . "gradlew compileFatDebugUnitTestSources feedsdk:check")
     (projectile-project-compilation-dir . "android/FeedSDK")
     (projectile-project-compilation-dir . "android/")
     (projectile-project-test-cmd . "FeedSDK/gradlew -b FeedSDK/build.gradle compileFatDebugUnitTestSources feedsdk:check")
     (projectile-project-compilation-cmd . "FeedSDK/gradlew -b FeedSDK/build.gradle compileFatDebugUnitTestSources feedsdk:check")
     (projectile-project-test-cmd . "xcodebuild -derivedDataPath build -workspace objc/SampleApp.xcworkspace -scheme FeedSDK -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' test | xcpretty")
     (projectile-project-compilation-cmd . "xcodebuild -derivedDataPath build -workspace objc/SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' build | xcpretty")
     (projectile-project-test-cmd . "xcodebuild -derivedDataPath .emacs-build -workspace objc/SampleApp.xcworkspace -scheme FeedSDK -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' test | xcpretty")
     (projectile-project-compilation-cmd . "xcodebuild -derivedDataPath .emacs-build -workspace objc/SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' build | xcpretty")
     (projectile-project-compilation-cmd . "xcodebuild -workspace objc/SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' build | xcpretty")
     (projectile-project-test-cmd . "xcodebuild -workspace objc/SampleApp.xcworkspace -scheme FeedSDK -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' test | xcpretty")
     (projectile-project-compilation-cmd . "xcodebuild -workspace SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' build | xcpretty")
     (projectile-project-test-cmd . "xcodebuild -workspace objc/SampleApp.xcworkspace -scheme FeedSDK -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' test | xcpretty --no-color")
     (projectile-project-test-cmd . "xcodebuild -workspace SampleApp.xcworkspace -scheme FeedSDK -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' test | xcpretty --no-color")
     (projectile-project-compilation-cmd . "xcodebuild -workspace SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination 'OS=9.3,platform=iOS Simulator,name=iPhone 6s' build | xcpretty --no-color")
     (projectile-project-compilation-cmd . "xcodebuild -workspace SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination \"OS=9.3,platform=iOS Simulator,name=iPhone 6s\" build | xcpretty --no-color")
     (projectile-project-compilation-cmd . "xcodebuild -workspace SampleApp.xcworkspace -scheme FeedSDKSampleApp -configuration Debug -destination \"OS=9.3,platform=iOS Simulator,name=iPhone 6s\" build | xcpretty")
     (projectile-project-compilation-dir . "objc")
     (projectile-project-compilation-cmd . "xcodebuild -workspace SampleApp.xcworkspace -scheme FeedSDKSampleApp build")
     (projectile-project-compilation-cmd . "xcodebuild -workspace objc/SampleApp.xcworkspace -scheme FeedSDKSampleApp build")
     (bug-reference-bug-regex . "W-\\(?2:[[:digit:]]+\\)")
     (projectile-globally-unignored-directories "./generated-src")
     (projectile-enable-caching . t)
     (projectile-globally-ignored-directories quote
                                              ("android/SalesforceMobileSDK-Android"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-guide-face ((t (:foreground "#545454" :slant normal)))))
