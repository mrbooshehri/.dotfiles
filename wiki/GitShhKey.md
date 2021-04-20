# Setup shh key for git server (github, gitlab, ...)

1. Generate a key 
```bash
	shh-keygen -t rsa -b 4096 -C "YOUR_EMAIL_ADDRESS"
```

2. Check ssh agent
```bash
	eval $(ssh-agent -s)
```

3. Add ssh key
```bash
	shh-add ~/.ssh/id_rsa
```

5. Copy your public key from the following file
```bash
	~/.ssh/id_rsa.pub
```

6. Go to github/gitlab and add a key under SSH/GPG section

[Github](https://github.com/settings/keys)
[Gitlab](https://gitlab.com/-/profile/keys/)
