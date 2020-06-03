# foundryvtt-k8s

Docker image and k8s configs for hosting Foundry Virtual Tabletop.

## Installation

Requires Docker, Node, Yarn, and kubectl. You must log in to Docker and have your kubectl
configured to deploy to your cluster.

```bash
git clone https://github.com/Corvimae/foundryvtt-k8s.git
cd foundryvtt-k8s
yarn
```

Set the environment variables `FOUNDRY_USERNAME` and `FOUNDRY_PASSWORD` to the username and password
you use to sign in at https://foundryvtt.com. You must use your username, not your email.

Replace all instances of `corvimae` with your Docker username, and replace `mysite.com` in `foundryvtt-ingress.yaml`
with the domain you wish to use.

## Usage

```bash
./release.sh <version>
```

