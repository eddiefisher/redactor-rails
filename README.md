# Rails 3.2 Integration for Redactor (Devise Edition) and for ActiveAdmin!

# Only for AciveAdmin

The redactor-rails gem integrates the [Redactor](http://redactorjs.com/) editor with the Rails 3.2 asset pipeline.

This gem bundles Redactor version 8.2.2 which is the most recent version as of January 20, 2013. Check [Redactor's changelog](http://imperavi.com/redactor/log/) for further updates.

## Installation

Add this line to your application's Gemfile:

    gem 'redactor-rails', :git => 'git://github.com/eddiefisher/redactor-rails.git'

And then execute:

    $ bundle install

### Now generate models for store uploading files

#### ActiveRecord + carrierwave

    gem "carrierwave"
    gem "mini_magick"

    $ rails generate redactor:install

    or

    $ rails generate redactor:install --devise

    # --devise option generate user_id attribute for asset(Picture, Document) models. For more details show Devise gem.
    # Now, Pictures and Documents uploading available only for signed in users
    # All uploaded files will stored with current user_id
    # User will choose only own uploaded Pictures and Documents

    $ rake db:migrate

#### Mongoid + carrierwave
    gem "carrierwave"
    gem "carrierwave-mongoid", :require => "carrierwave/mongoid"
    gem "mini_magick"

    $ rails generate redactor:install

### Include the Redactor assets

Add to your `application.js`:

      //= require redactor-rails

Add to your `application.css`:

      *= require redactor-rails

### Initialize Redactor

For each textarea that you want to use with Redactor, add the "redactor" class and ensure it has a unique ID:

    <%= text_area_tag :editor, "", :class => "redactor", :rows => 40, :cols => 120 %>

### Custom Your redactor

If you need change some config in redactor, you can

    $ rails generate redactor:config

Then generate `app\assets\redactor-rails\config.js`.

See the [Redactor Documentation](http://redactorjs.com/docs/settings/) for a full list of configuration options.


If You Want To setup a new language in Redactor you should do two things:

In you file `app\assets\redactor-rails\config.js` set option

    "lang":'zh_tw'

and

Add to your layout

    <%= redactor_lang('zh_tw') %>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Special Thanks

[wildjcrt (Jerry Lee)](https://github.com/wildjcrt/)
## Statement

`redactor-rails` part of reference [galetahub/ckeditor](https://github.com/galetahub/ckeditor) project.

`redactor-rails` uses MIT-LICENSE. Rock!!!!!

## License

the `redactor-rails` project is MIT-LICENSE.

You may use `Redactor` for non-commercial websites for free, however, we do not guarantee any technical support.

Redactor has [3 different licenses](http://redactorjs.com/download/) for commercial use.
For details please see [License Agreement](http://redactorjs.com/download/).
