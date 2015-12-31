=== NEED TO

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
* Make it runable when installed as a gem.
* Refactor in to better code layout.
* Add rspec tests.
* Run tests on Travis:
  - Linux
  - BSD
  - Mac OS
  - Windows, if possible

=== WANT TO
* Replace Trollop with GetoptLong to minimize external dependencies. Trollop is easier to work with, but GetoptLong is built-in to ruby.
* Find a way to test the installation process on various OSes.
* Include `ssh_ec2` shortcut script.
* Option to create and execute complete ssh command in order to deal with multiple name matches.