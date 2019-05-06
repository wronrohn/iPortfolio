# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '9.3'
target 'iPortfolio' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iPortfolio

  pod 'Firebase/Core', '~> 4.13.0'
  pod 'Firebase/Auth'


  source 'https://github.com/CocoaPods/Specs.git'
  pod 'Eureka'
end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Eureka'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end
