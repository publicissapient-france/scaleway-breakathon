# 🔥  Scaleway Breakthon

This is the repository for the work done on the [_Scaleway
Breakathon_](https://www.scaleway.com/en/breakathon/) by the `Xebia4Ever` team.

![Scaleway
Breakathon](https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F127211973%2F378717428845%2F1%2Foriginal.20210225-133419?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C2160%2C1080&s=4a04cb591fb3f3f8e07592891dd9f536)

## Status

You'll find all the things we have done and the things that remain to be done
on [this GitHub repository project (board) called "Scaleway Breakathon
2021"](https://github.com/xebia-france/scaleway-breakathon/projects/1) 🙂

## Administrative stuff

### Team

We are the **`Xebia4Ever`** team, comprised of:

- Alexis "Horgix" Chotard (GitHub: [Horgix](https://github.com/Horgix) /
  Twitter: [@Horgix](https://twitter.com/Horgix))
- Ludovic "Krast" Logiou (GitHub: [Krast76](https://github.com/krast76) /
  Twitter: [@LudovicLogiou](https://twitter.com/LudovicLogiou))
- Thomas "Keabard" Simonnet (GitHub: [Keabard](https://github.com/keabard) /
  Twitter: [@SimonnetTom](https://twitter.com/SimonnetTom))
- Franck Cussac (GitHub: [Franck-Cussac](https://github.com/franck-cussac))

You'll easily find how to ping us on the Breakathon Discord server with the
above informations! For admins, we are in the `#xebia4ever` channel.

## Scaleway account

We use the Scaleway organization called **`Xebia4Ever Breakathon`** (ID
`15e7d66d-2197-49fa-8ef1-c94f7cfd4124`), created on the 24th March.

It is tied to the `xebia4ever-breakathon (at) protonmail.com` email since we
expected from the breakathon rules that we may have to share credentials, and
didn't want to share our personal Scaleway accounts credentials with other team
members 😉

We are working in the `Xebia4Ever-Breakathon-2021` project/namespace (ID
`80700332-ae36-4276-bbfe-a24b85d2aa19`).

## Stack

As every cloud users should, we aim at having everything automated.

Therefore, all of the infrastructure deployment for this breakathon is done
"as-code" in order to be reviewable, versionable, shareable, repeatable, etc.

For the main infrastructure-as-code part, we are using **Terraform**.

### Terraform

#### Version

We are using Terraform **v0.14.8**.

#### Terraform state

The Terraform state needs to be shared among the team. In order to do so, we
are using the `s3` backend since we wanted to avoid relying on external
services such as Terraform Cloud as much as possible for this Breakathon.

That being said, we obviously have the usual chicken-egg problem: the Scaleway
Object Storage bucket cannot be created with Terraform while having the
Terraform state stored inside it.

Therefore, the Terraform state is stored in a manually created private bucket
called `xebia4ever-breakathon-tfstate` with the following endpoint:
<https://xebia4ever-breakathon-tfstate.s3.fr-par.scw.cloud>

This is the only non-automated thing we'll allow ourselve to do during this
Breakathon!

#### How to

See the [Terraform `scaleway` provider
documentation](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs).

Only one surprise: in order to have the `s3` backend work with Scaleway Object
Storage... you still need to have AWS-like environment variables exported (we
definitely don't want to write Scaleway API keys in this git repo!).

This means that you need to have 4 environment variables in order to be able to
init/plan/apply/whatever the Terraform code in this repo:

```
export SCW_ACCESS_KEY=<your Scaleway API access key>
export SCW_SECRET_KEY=<your Scaleway API secret key>
export AWS_ACCESS_KEY_ID=$SCW_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$SCW_SECRET_KEY
```

### DNS

It's currently not possible to register domain names through Scaleway 🙁

So we went and registered the domain name `breakathon.dev` on Gandi!

We then manually delegated it to Scaleway through the console.

## Scaleway services and tools feedback

If you're an organizer of the Breakathon, glad you are reading this 🙂

Here is a little feedback on things that we stumbled upon and could, in our
opinion, be improved on your services (which definitely rock btw!):

- Having no managed key/value store that can be used to store Terraform locks
  is a pain, and force teams to use something external such as Terraform Cloud
  or (sorry) an AWS S3 bucket. From the [Terraform `scaleway` provider
  documentation](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs#store-terraform-state-on-scaleway-s3-compatible-object-storage):
  `Be careful as no locking mechanism are yet supported. Using scaleway object
  storage as terraform backend is not suitable if you work in a team with a
  risk of simultaneous access to the same plan.`
- We used the Terraform `scaleway` provider on personal projects in the past
  (version `2.0.0-rc2`). We were surprise to see that 2 days before the
  Breakathon, the `2.0.0` stable version was release... with a lof of dropped
  features 🙁 Mainly, the ability to configure the Ingress controller through
  Terraform, [dropped in a PR 3 days before the
  Breakathon](https://github.com/scaleway/terraform-provider-scaleway/pull/798).
  We therefore do it "manually" with `scw k8s cluster update <cluster ID>
  ingress=nginx` instead, which feels a bit awkward (but at least, it's done
  through the Scaleway CLI and not some wonky curl or manually in the console!)
- The OpenID Connect configuration in the Terraform provider looks really
  promising, but we didn't find any documentation about it so we ended up not
  configuring it due to the time constraint. We would have loved plugging
  Kubernetes auth on Auth0 directly!
- It's not possible to tag a Container Registry, while other Scaleway resources
  mostly support tags everywhere
