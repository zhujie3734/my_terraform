cat c:/Users/lenovo/.ssh/config <<EOF

Host ${hostname}
  HostName ${hostname}
  User ${user}
  IdentityFile ${identityfile}
EOF