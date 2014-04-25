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

1. `sprout-keycastr` &mdash; The default recipe includes all of the following unless otherwise specified
1. `sprout-keycastr::install` &mdash; Installs the app
1. `sprout-keycastr::enable_accessibility` &mdash; bypasses the need to add the app to the Security&Privacy->Privacy->Accessibility section
1. `sprout-keycastr::start_on_startup` &mdash; Self explanitory
1. `sprout-keycastr::suppressed_first_time_launch_dialog` &mdash; Sets a flag in the app to bypass a dialog that shows up on first launch
1. `sprout-keycastr::only_cast_command_keys` &mdash; Only cast key combinations that include meta keys
1. `sprout-keycastr::suppressed_preferences_on_launch`; Don't show preferences whenever the app is launched
1. `sprout-keycastr::adjusted_font_size` &mdash; Adjusts the size of the font and chrome displaying casted keys
1. `sprout-keycastr::autocheck_updates` &mdash; Turns this on by default so that the user is not prompted on first launch
1. `sprout-keycastr::only_in_menubar` &mdash; Disables showing in the Doc and the application switcher (Cmd+Tab) _note: this recipe is **not** part of the default as it is a bit flakey at the moment._
1. `sprout-keycastr::adjusted_window_placement` &mdash; Sets which corner of the display to show the keys, see the `window_placement` attribute for options. _note: this recipe is **not** part of the default as it is a bit flakey at the moment._

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
