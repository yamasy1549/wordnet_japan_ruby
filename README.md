# WordnetJapan

Ruby wrapper for 日本語WordNet(http://compling.hss.ntu.edu.sg/wnja/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wordnet_japan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wordnet_japan

## Usage

### Basic

example:

```ruby
require "wordnet_japan"

client = WordNetJapan::Client.new("wnjpn.db")
words = client.related_words("学校", link: "上位語", step: 5)
```

output:

```ruby
=> {1=>
  [{:synset=>
     #<WordNetJapan::Synset:0x00007f81782e2128
      synset: "08276342-n",
      pos: "名詞",
      name: "educational_institution",
      src: "eng30">,
    :words=>
     [#<WordNetJapan::Word:0x00007f81782d3dd0
       wordid: 17620,
       lang: "eng",
       lemma: "educational_institution",
       pron: nil,
       pos: "名詞">,
      #<WordNetJapan::Word:0x00007f81782d3b78
       wordid: 235230,
       lang: "jpn",
       lemma: "教育機関",
       pron: nil,
       pos: "名詞">]},
       ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wordnet_japan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordnetJapan project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wordnet_japan/blob/master/CODE_OF_CONDUCT.md).
