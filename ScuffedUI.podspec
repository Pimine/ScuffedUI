Pod::Spec.new do |s|

  s.name 		= 'ScuffedUI'
  s.version 		     = '0.11.0'
  s.summary          = 'Frequently used custom UI elements.'

  s.description      = 'This framework contains frequently used custom UI elements.'

  s.homepage         = 'https://github.com/Pimine/ScuffedUI.git'
  s.license 		     = { :type => 'MIT', :file => 'LICENSE' }
  s.authors 		     = { 'Den Andreychuk' => 'denis.andrei4uk@yandex.ua' }

  s.source 		       = { 
    :git => 'https://github.com/Pimine/ScuffedUI.git', 
    :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.swift_version   = ['5.1', '5.2']
  s.default_subspec = 'Core'

  # Core
  s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/**/*.swift'
    ss.dependency 'EasySwiftLayout'
  end

end
