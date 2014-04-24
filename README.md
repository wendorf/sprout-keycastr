# sprout-keycastr cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-keycastr.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-keycastr)

Installs and configures [KeyCastr](https://github.com/sdeken/keycast)

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io/)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Attributes

*NOTE:* All preferences are namespaced under `sprout => keycastr` they include:

* `source` &mdash; The path to the dmg to download from the web; default is `http://cheffiles.pivotallabs.com/keycastr_0.8.0.dmg`
* `checksum` &mdash; The checksum for the dmg; checksum for the default dmg is located in attributes/install.rb
* `domain` &mdash; the key which KeyCastr registeres itself with apple. to reference the plist as well as the entry in
the accessibility databse ; default is `net.stephendeken.KeyCastr`
* `font_size` &mdash; the font size to use; default is `36`
* `window_placement` &mdash; where to place the KeyCastr window `:top_left|:top_right|:bottom_left|:bottom_right` ; default is `:top_right`


### Recipes

1. `sprout-keycastr`
1. `sprout-keycastr::install`
1. `sprout-keycastr::enable_accessibility`
1. `sprout-keycastr::start_on_startup`
1. `sprout-keycastr::suppressed_first_time_launch_dialog`
1. `sprout-keycastr::only_cast_command_keys`
1. `sprout-keycastr::suppressed_preferences_on_launch`
1. `sprout-keycastr::adjusted_font_size`
1. `sprout-keycastr::adjusted_window_placement`
1. `sprout-keycastr::only_in_menubar`

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

Unit specs use [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after 
install.

*Note:* It has a precondition that keycastr is _not_ already installed on the system.

```
bundle
bundle exec rake spec:integration
```
