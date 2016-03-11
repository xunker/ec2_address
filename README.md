# ec2_address

`ec2_address` is a command line tool for quickly getting the IP address of an Amazon AWS EC2 instance by name.

It will search _all your available regions_ for instances that match a name, and can return public and private IPs or hostnames.

It can also automatically build an `ssh` command based in the instance name. If you have a `.pem` file that matches the instance `KeyName`, ssh will be told to use it automatically.

Examples:

```bash
# get the IP of an instance by name:
$ ec2_address some-ec2-instance
98.139.183.24

# get DNS name instead of the IP:
$ ec2_address --public-dns-name some-ec2-instance
ec2-98-139-183-24.us-west-2.compute.amazonaws.com

# if there are multiple instance with same name, you are given a list:
$ ec2_address some-other-ec2-instance
3 instances found with name 'some-other-ec2-instance'.
Please choose the instance you want:
  0 some-other-ec2-instance 98.139.183.24  ec2-98-139-183-24.us-west-2.compute.amazonaws.com
  1 some-other-ec2-instance 98.139.183.25  ec2-98-139-183-25.us-west-2.compute.amazonaws.com
  2 some-other-ec2-instance 98.139.183.26  ec2-98-139-183-26.us-west-2.compute.amazonaws.com
0-2, ENTER=0 > 0
98.139.183.24

# you can simply return the first match regardless of any others that match the name:
$ ec2_address --first-instance some-other-ec2-instance
98.139.183.24

# you can match on a partial string as well:
$ ec2_address --partial-match magic
2 instances found with name 'magic'.
Please choose the instance you want:
  0 magic-instance       98.139.183.24  ec2-98-139-183-24.us-west-2.compute.amazonaws.com
  1 more-magic-instance  98.139.183.25  ec2-98-139-183-25.us-west-2.compute.amazonaws.com
0-1, ENTER=0 > 0
98.139.183.24

# ssh to an instance by name:
$ ssh $(ec2_address --ssh --ssh-user ec2-user --disable-ssh-known-hosts some-ec2-instance)

```

## Installation

The application is written in Ruby and so having Ruby (1.9.3+) installed is a prerequisite.

```bash
# Linux, *nix and Mac OS X
$ sudo gem install ec2_address

# Windows install instructions TBA
```

## Usage

The main executable is `ec2_address`.

It will try to automatically detect your AWS credentials. If they cannot be read, or if you want to set them differently, you can manually pass them with `--aws-access-key-id` and `--aws-secret-access-key`.

NOTE: the `--aws-region` option is only used to set the region used for the initial connection to AWS whereupon the tool will get a list of all the regions you have access too. It does *not* restrict the search to that specific region.

### Options

```
Usage: ec2_address [options] <instance name>

Options:
  -i, --public-ip-address            use public IP address name of instance (default)
  -n, --public-dns-name              use public DNS name of instance
  -I, --private-ip-address           use private IP address name of instance
  -N, --private-dns-name             use private DNS name of instance
  -f, --first-instance               stop querying after first match
  -F, --first-region                 stop querying additional regions after first match
  -p, --partial-match                match partial name, case-insensitive
  -s, --ssh                          output options for ssh client ("-i <pem file> <addr>")
  -u, --ssh-user=<s>                 add a username to ssh output ("<username>@<host>")
  -X, --disable-ssh-known-hosts      tell ssh to ignore the `known_hosts` file.
  -S, --ssh-directory=<s>            ssh key directory (default: ~/.ssh)
  -a, --aws-region=<s>               default AWS region (default: us-west-2)
  -w, --aws-access-key-id=<s>        your AWS access key ID
  -e, --aws-secret-access-key=<s>    your AWS secret access key
  -v, --verbose                      verbose logging
  -V, --very-verbose                 very verbose logging (debugging)
  -r, --version                      Print version and exit
  -h, --help                         Show this message
```

## Examples

TBA

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xunker/ec2_address. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
