# Breakathon Summary - Xebia4Ever team

_EDIT: OH MY GOD WE WON! This [Scaleway
Breakathon](https://www.scaleway.com/en/breakathon/) was awesome, thanks to all
the mentors, the k8s staff, the judges, and all the participants our shared our
passion until late in the night ♥_

Hello dear judges, dear fellow participants, dear colleagues, etc.

Let's talk about what we did during this awesome Breakathon organized by
Scaleway!

First, feel free to have a look at the README of this repository - you'll find
a lot of interesting stuff in it, including feedback on Scaleway products.

You'll also find a few images on <https://imgur.com/a/ORGiWEN>

## Let's say hello first

You'll find a nice "smoke test" app deployed on every cluster in order to make
sure they work, and to say hello to you in a nice, Scaleway-themed way 🙂

- <https://hello.ops.breakathon.dev/>
- <https://hello.ai.breakathon.dev/>
- <https://hello.software.breakathon.dev/>
- <https://hello.fun.breakathon.dev/>
- <https://hello.free.breakathon.dev/>

While we're teasing with links, have a look at
**<https://argocd.software.breakathon.dev>** (ask for credentials on our
Discord channel!) and **<https://2048.fun.breakathon.dev>** 🎉

![Hello Scaleway](https://i.imgur.com/OXIeleL.png)

## Using Scaleway services - not only Kapsule!

During this Breakathon, we used:

- **Kapsule** - for the 5 clusters, obviously
- **Scaleway DNS** - one zone for each cluster, `breakathon.dev` domain bought on
  Gandi and delegated
- **Scaleway Container Registry** - in order to store the images of apps we
  built
- **Scaleway Load Balancers** - to expose our apps through LoadBalancer
  Services or though Ingresss
- **Scaleway Object Storage** - to store our Terraform state

![Scaleway domains](https://i.imgur.com/BHAZz8w.png)

We also heavily used tooling provided by Scaleway here and there - the `scw`
CLI, the `scaleway` Terraform provider, the `scaleway` External DNS provider
(thanks @Sh4d1 for pointing us to the master branch!), etc.

## AI - Going farther than just models (users matter too!)

For the AI challenges, we decided to not focus on the models themselves but
instead of the way they are exposed and used.

We therefore have **<https://digit.ai.breakathon.dev/>** that exposes a
front-end written in **React** (and themed for Scaleway 😉), which talks to a
Python API (using **Flask**). This API takes an image in input, an answer with
the digit predicted by the onboarded ML model. This model has been trained with
**PyTorch**, and the one exposed has been trained on the famous MNIST dataset
(but don't worry, the submissions we did for the test dataset was trained on
Scaleway's dataset 😇).

![Digits app](https://i.imgur.com/Wr21Vdm.png)

In short, we have:

- A front-end in **JS + React** : <https://digit.ai.breakathon.dev/>
- An API in **Python + Flask**: <https://digit.ai.breakathon.dev/predict>
- A ML model trained with **PyTorch**
- All of this exposed through Ingress, with automatic DNS records creation, TLS
  connections, etc etc.

You can simply play with the webui and drag'n'drop your digits to see it the
model identifies them correctly 🙂


## Infrastructure - Not just clusters

Having Kubernetes clusters at hand so easily is pretty cool (thanks to the
awesome team from Scaleway, the product is trully cool). But that doesn't do
all the jobs!

- How to deploy easily and in a continuous way on the cluster?
- How to have easy DNS records created automatically when someone wants to
  deploy an app?
- How to have TLS certificates so end users can trust their connections to our
  apps?
- How to make sure the cluster are easy to re-deploy if something goes wrong
  (let's say... an entire AZ burning... like... in Strasbourg... thanksfully
  Scaleway has better Datacenters practices 😁)

In order to answer all these tricky questions:

- 🔧 All the cluster setup is done through **Terraform**
- 🔒 Each cluster has its own **Cert Manager** issuing certificates via Let's
  Encrypt in order to have all apps exposed through trusted TLS connections
- ✨ Each cluster has its own **External DNS** in order to have domain name
  automatically pointing to Services and Ingress so we can have nice
  `*.breakathon.dev` URLs everywhere
- ♻ We have an **ArgoCD** cluster deployed on the "Software challenge" cluster
  which is used to deploy on every cluster
- 🔐 We did not put any secret in the git repository, instead using **sops** to
  have GPG-encrypted secrets so we can still have all the infrastructure inside
  git while not leaking anything!


![ArgoCD overall view](https://i.imgur.com/BRkCQ8K.png)

## Deployment - Not a topic anymore

We're in 2021, we have Kubernets clusters, Kustomize, Helm, etc. Deploying
common apps should not be a hot topic anymore. For this very reason, we favored
taking components off the shelf (Mattermost, a 2048 game, etc) that, for some,
already were packaged for Kubernetes and were just a matter of tuning values.

Of course, this was easily possible thanks to all the work done previously on
the clusters!

![ArgoCD app](https://i.imgur.com/uwHUsCp.png)
