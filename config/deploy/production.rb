server '52.34.111.243',
  user: 'ec2-user',
  roles: %w{web db app},
  ssh_options: {
    user: 'ec2-user', # overrides user setting above
    keys: %w(/Users/derekso/.ssh/skejulerapp-dev.pem),
    forward_agent: false,
    auth_methods: %w(publickey password)
    # password: 'please use keys'
  }
