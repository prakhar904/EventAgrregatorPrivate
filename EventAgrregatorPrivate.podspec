#
# Be sure to run `pod lib lint EventAgrregatorPrivate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EventAgrregatorPrivate'
  s.version          = '0.1.0'
  s.summary          = 'A library for Aggregated Outputs over different events.'

  s.description      = 'A library for Aggregated Outputs over different events. We exposed swift methods whoch are internally using c functions'

  s.homepage         = 'https://github.com/prakhar904/EventAgrregatorPrivate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'prakhar904' => 'gargprakhar93@gmail.com' }
  s.source           = { :git => 'https://github.com/prakhar904/EventAgrregatorPrivate.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.source_files = 'EventAggregators/Classes/*'
  s.resources = 'EventAggregators/Assets/*'
  s.public_header_files = 'EventAggregators/Classes/*.h'
  s.swift_versions = '5.0'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'EventAggregators/Tests/*.{swift}'
    test_spec.frameworks = 'XCTest'
  end
  s.libraries = 'stdc++'
end
