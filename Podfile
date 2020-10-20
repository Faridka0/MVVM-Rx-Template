# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MVVM+Rx Template' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # ignore all warnings from all pods
  inhibit_all_warnings!

post_install do |installer|
     installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
            end
         end
     end
  end


  # Pods for MVVM+Rx Template

	pod 'RxSwift'
	pod 'RxCocoa'
  	pod 'SnapKit'
	pod 'SDWebImage'

end
