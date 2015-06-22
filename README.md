# test-kitchen-examples [![Build Status](https://secure.travis-ci.org/zl4bv/test-kitchen-examples.svg?branch=master)](http://travis-ci.org/zl4bv/test-kitchen-examples)
Example configurations for Test Kitchen

# Usage

Each directory under `examples/` is a complete working example of a Test-Kitchen
configuration. Each example demonstrates a particular aspect of Test-Kitchen.

You are welcome to copy and adopt these examples for your own use, however be
aware that these examples will not fit all use cases and therefore some
modification may be required. The author(s) of this repo are not responsible
for the misuse of these examples.

# Configuring for CI

The following must be installed:
* git (if you are cloning this repository)
* ruby 2.0+
* bundler

For the kitchen-ec2 examples, these environment variables need to be configured:
* AWS\_REGION
* AWS\_ACCESS\_KEY\_ID
* AWS\_SECRET\_ACCESS\_KEY
* AWS\_SECURITY\_GROUP\_ID
* AWS\_SUBNET\_ID
* SSH\_KEY - this should be the base64-encoded key on one line without the
  BEGIN and END blocks.

Then to run all the examples at once:

```bash
bundle install
bundle exec rake
```

## License

[MIT License](/LICENSE)

