Pod::Spec.new do |s|
  s.name 		= 'ScuffedUI'
  s.version 		= '0.10.0'
  s.license 		= 'MIT'
  s.summary 		= 'Utilities'
  s.homepage 		= 'https://github.com/denandreychuk/ScuffedUI'
  s.authors 		= { 'Den Andreychuk' => 'denis.andrei4uk@yandex.ua' }
  s.social_media_url 	= 'https://www.instagram.com/den.andreychuk'
  s.source 		= { :git => 'https://github.com/denandreychuk/ScuffedUI.git', :tag => s.version.to_s }

  s.source_files = 'Sources/*.swift'
  s.swift_version = '5.0'
  s.platform = :ios, "11.0"
end
