=== NEED TO
* Use wildcards instead of manual searching:
  - ec2_region.describe_instances(filters: [ { name: "tag-key", values: ["Name"] }, { name: "tag-value", values: ['*'+requested_instance_name+'*'] } ]).map(&:reservations).flatten.map(&:instances).flatten.select{|i| i.state.name == 'running'}
* Add support for setting the ssh identify file name when using --ssh.
* Include example of `ssh_ec2` bash alias, both using RVM and without.
* Write README.
  - Examples:
    - Public/private IPs and hostnames.
    - "First instance" matching.
    - "First region" matching.
    - Partial name matching.
    - SSH usage.
      - `ssh $(ec2_address -s <name>)`
      - Key Pair auto-detection.
      - --ssh-user
        - "UserName" tag.
      - --disable-ssh-known-hosts
      - --ssh-directory
    - AWS config:
      - --aws-region and AWS_REGION
      - --aws-access-key-id and AWS_SECRET_ACCESS_KEY
      - --aws-secret-access-key and AWS_ACCESS_KEY_ID
* Refactor in to better code layout.
* Add rspec tests.
* Run tests on Travis:
  - Ruby 1.9.3, 2.0.x, 2.1.x, 2.2.x, ruby-head
  - Linux
  - BSD
  - Mac OS
  - Windows, if possible
* Support a .ec2_address config file for setting per-seat defaults.
  - Add CLI flag to specify the config file to use.
  - Add CLI flag to specify that the default config file should be ignored if found.

=== WANT TO
* search on instance ids (/^i\-[a-z0-9]+) as well as names.
* Replace Trollop with GetoptLong to minimize external dependencies. Trollop is easier to work with, but GetoptLong is built-in to ruby.
* Find a way to test the installation process on various OSes.
* Option to create and execute complete ssh command in order to deal with multiple name matches.
* Add man page.
* Test Jruby, Rubinius, Maglev, Macruby on Travis.
