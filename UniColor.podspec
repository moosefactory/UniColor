#
# Be sure to run `pod lib lint UniColor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = "UniColor"
	s.version          = "1.0.0"
	s.summary          = "UniColor is a swift Color Utilities Library."
	s.description      = <<-DESC
    UniColor is a cross-platofrm (iOS/MacOS) Utility Library.
					   DESC
	s.homepage         = "https://github.com/moosefactory/UniColor.git"
	s.license          = 'MIT'
	s.author           = { "Tristan Leblanc" => "tristan@moosefactory.eu" }
	s.source           = { :git => "https://github.com/moosefactory/UniColor.git", :tag => s.version.to_s }
	s.social_media_url = 'https://twitter.com/moosefactory_eu'

	s.ios.deployment_target = '13.3'
    s.osx.deployment_target = '11.0'
    s.tvos.deployment_target = '14.0'
    s.watchos.deployment_target = '7.0'
                                                        
	s.requires_arc = true

	s.source_files = 'Sources/Unicolor/**/*.swift'
 end
