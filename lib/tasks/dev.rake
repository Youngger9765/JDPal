namespace :dev do
  task :init_languages => :environment do

    languages = Language.create([ { name: 'Mandarin', chinese_name: '中文'}, 
                              { name: 'English', chinese_name: '英文'},
                              { name: 'Japanese', chinese_name: '日文'},
                              { name: 'Cantonese', chinese_name: '廣東話'},
                              { name: 'Taiwanese', chinese_name: '台語'},
                              { name: 'Korean', chinese_name: '韓語'},
                              { name: 'Spanish', chinese_name: '西班牙文'},
                              { name: 'French', chinese_name: '法文'},
                              { name: 'German', chinese_name: '德文'},
                              { name: 'others', chinese_name: '其他'},
                              ])
  end

  task :init_language_level => :environment do

    languages = LanguageLevel.create([ { name: 'Poor', chinese_name: '不懂'}, 
                              { name: 'Little', chinese_name: '略懂'},
                              { name: 'Intermediate', chinese_name: '中等'},
                              { name: 'Fluent', chinese_name: '精通'},
                              ])
  end
end