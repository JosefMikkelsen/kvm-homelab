# KVM-based homelab automation

This Ansible codebase performs the function of standing up and tearing down an
inventory of Debian KVM virtual machines. The inventory is defined in a YAML
list at the following location:

```
group_vars/all/vars.yaml
```

To stand up the machines:

```bash
make up
```

To tear them down:

```bash
make destroy
```

A few things are set up automatically, including:

1. Hardening the guest sshd a bit
2. Creating a user account with passless sudo named josef
3. Creating ssh keypairs - unique for each guest
4. Adding the public key to the guest
5. Dropping the private key in the host ~/.ssh/ location
6. Creating a ssh config fragment with entries for each guest in ~/.ssh/
7. Including this fragment in the ~/.ssh/config file
8. Setting up local DNS aliases in /etc/hosts for each guest

The teardown should wipe all of that again.

# Caveats

This is Debian only, and changing it is probably more than changing the vars
pointing at base images and providing their integrity hashes.

This is only tested on a Debian 13 host.

`make destroy` is not idempotent. The culprit is the Ansible community module.

I _think_ `make destroy` is comprehensive, but I'm not sure.

Do not run this code yourself, it works for me and who knows what it could do to
your environment. I suggest at most you can use it to see how someone else
accomplished this task, and then to develop and run your own code. As the
license says, I am not responsible for what this code does anywhere other than
on my environments.

# License

This code is licensed under the
[GPLv3](https://www.gnu.org/licenses/gpl-3.0.html#license-text).

Separate from the license, I disapprove of using this code for training "AI"
models, and I explicitly withhold consent for anyone to do so, to the extent
this is feasible without compromise to the GPLv3 licensing terms.
