# jekyll-theme-mastodon
<img src="https://github.com/EthanMcBloxxer/EthanMcBloxxer/raw/main/.github/readme/elephant.svg" align="right" width="30%" />

> A way to host Mastodon v3.3.0 serverlessly via Jekyll + GitHub

A Jekyll theme built off of Mastodon, the open-source social media platform. With this theme you can easily make a Mastodon v3.3.0 instance via Ruby & Jekyll or "serverless" via GitHub Pages.

## Installing
Installation is very easy and simple. All you need to do is go into the `remote` branch and

1. download the directory (or [fork it](https://github.com/EthanMcBloxxer/jekyll-theme-mastodon/fork))
2. put the files in a new repository

Be sure to name your repo "`<username>.github.io`". If you don't, your Mastodon instance will be available at `<username>.github.io/<repository-name>`. If you already have a default GitHub Pages profile page, then I encourage naming the repository "social" or "mastodon" so that the repo will be available at `<username>.github.io/social` or `<username>.github.io/mastodon`. The theme is configured to use relative urls, meaning you can specify `/` and it will convert it to a url relative to the page (`/`, `social`, `mastodon`, etc.)

![Settings >> Options >> Name](https://bloxxing.is-ne.at/TY7lBd.png)

Also in settings, you need to scroll down to GitHub Pages and allow GitHub Pages to build from `main` (if you downloaded the directory) or `remote` (if you forked the repository)  
**Important!!** Ignore the bit about choosing a theme under this section. This theme is not part of the ones you can choose from GitHub!

![Settings >> Options >> GitHub Pages](https://bloxxing.is-ne.at/SJtHIe.png)

Or, for power users,

Add this to your `_config.yml`:

```yml
remote_theme: EthanMcBloxxer/jekyll-theme-mastodon@main
plugins:
  - jekyll-remote-theme
```

## Configuring
This theme uses page front matter to source variables instead of `_config.yml`. This is so that you can create multiple profile pages. If you only want a single profile, the good thing here is that you can specify default values for each page's front matter via the `defaults` key.  
**Important!!** When inputting URLs, NEVER prefix them with the baseurl / project prefix unless it won't work otherwise.

### Project Sites
If you decided that you wouldn't name your repository `<username>.github.io` and instead `social` or `mastodon`, for example, please add these two values to your `_config.yml` file:

```yml
url: "<username.github.io/<YOUR REPO NAME>"
baseurl: "/<YOUR REPO NAME>" # `social` or `mastodon`, for example
```

For both values, ensure there isn't a slash at the end of the variable. These two values are needed because of certain pages, such as `sitemap.xml`, requiring a full `url`. For user sites, it's not a good idea to use `{{ url }}{{ baseurl }}`. And I didn't make `sitemap.xml`, it was open source on the Jekyll Codex.

### One-Profile
If this isn't a enterprise-owned website or you only want a single Mastodon profile, then set `index.md`'s front matter (page-specific config values) like this:

```yml
---
layout: profile

bio:
  "My bio  \n
  This is a new line"
fields: # a table of info above the bio, like for other links
  -
    name: "Homepage"
    content: "[this content will not wrap, see](https://ethanmcbloxxer.github.io/)"
  -
    name: "this"
    content: "supports markdown"
banner: "/assets/banner.png" # background banner

admin: true # is profile an admin?
moderator: false # is profile a moderator?
role: Custom Role # this is a custom role to show beside admin/moderator

truncate: false # do you want to truncate the words below?
---

All of the content below the three hyphens (front matter) will show up inside of a "pinned" toot.
This doesn't have a `post` page, as it always shows up at the top of this profile.
```

The variables specifed in the front matter of `index.md` here don't need to be known site-wide. For example, no other page uses the `bio` key, so it can be specified just for the profile. There are variables, however, that need to be set in the `defaults` key of `_config.yml`:

```yml
defaults:
  # If there is content here then place the below at right after it
  -
    scope:
      path: "" # for each file
    values:
      author:
        name: Some Author # your name
        handle: "admin" # handle to be shown aside name, ends in @website.name
        url: "/"
      avatar:
        path: "/assets/avatar.png" # primary avatar
        circle: false # is the avatar a circle?
```

Be sure to replace all of the values with the ones you want. Please make sure you also don't replace any content already inside of the `_config.yml` file.

### Multi-Profile
If you want multiple profiles, then you can make a file for every profile. Like, for example, in a `ethan.md` file, you can place the following front matter:

```yml
---
layout: profile

bio:
  "My bio  \n
  This is a new line"
fields: # a table of info above the bio, like for other links
  -
    name: "Homepage"
    content: "[this content will not wrap, see](https://ethanmcbloxxer.github.io/)"
  -
    name: "this"
    content: "supports markdown"
banner: "/assets/ethan/banner.png" # background banner

admin: true # is profile an admin?
moderator: false # is profile a moderator?
role: Custom Role # this is a custom role to show beside admin/moderator
---
```

The markdown files could also be placed in `/accounts/`.  
Remember, a `permalink` key exists in all files' front matter, so if you specifiy `permalink: /@ethan`, then the page will be served at `/@ethan`. 

## Posting
You have your accounts and config set up, now you need to make toots (semantically posts).  
**Important!!** Make sure that the post has the proper author handle. This is how Mastodon will check if the post is made by the author on the `profile` page. So, if I'm on `admin`'s profile page, and the post's front matter looks like this:

```yml
---
author:
  handle: madmin
---
```

the post will not show up on `admin`'s account, but it will show up on `madmin`'s account.

Additionally, there's a `media` front matter key that lets you put scaled media at the end of a post, like this:

![Media at bottom of post](https://bloxxing.is-ne.at/OTMMSs.png)

Front matter required:

```yml
---
media: "/assets/media/ethans-logo.png"
---
```

Alternatively, you can also use a full url in place of starting with a slash/root `/`.

There is also a "tags" front matter key which allows you to specifiy hashtags at the bottom of posts. This will also make the toot show up in any page with `layout: tags` specified, see Files >> Tags. Just know this is how it works:

```yml
---
tags: [helloworld, othertag, "yet another tag"]
---
```

If not already noted, all content below the bottom three hyphens (`---`) is rendered with [md/kramdown](https://kramdown.gettalong.org/quickref.html).

To create post files, just go into `_posts` and make a file with this name format: `YEAR-MONTH-DAY-TITLE.md` (example: `2020-1-1-happy-new-year.md`, posted on January 1st, 2020 with slug (url) `/toot/happy-new-year/`)

## Files
You might've noticed that there are a few extra files in the `remote` directory. These may include:

```
/
├── 404.html
├── about.md
├── tags.html
├── feed.xml
└── sitemap.xml
```

These all have custom layout values, so if you want

* an RSS feed (highly recommended because there's a button to subscribe to `/feed.xml` on each profile page)
* a sitemap (highly recommended because there's a navbar link to `/sitemap.xml`)
* an about/stats/contact page (highly recommended because there's a navbar link to `/about/`)
* a (hash)tag index page (each tag at post bottom links to `/tags/`)
* a 404 page (recommended because GitHub's 404 stinks and tells users straight-up your site is on GitHub Pages)

then see the below headings for how to use them, where to put them, and how to customize them.

### About
This serves as a perfect about page for everything, stats, admin, contact, but most of all, **about**. When using its front matter, you can specify the following:

```yml
---
title: h1 element at top
users: 1 # how many users the site has (leave blank to discard

author:
  name: Some Person # admin name
  handle: "admin" # admin handle
  url: "/" # admin profile url
  email: name@hosting.email # buisness or real admin email
  
permalink: "/about/"
---

There is a h1 element above this titled "h1 element at top".
This content will be rendered under the stats. Take some time to explain the site.
```

### Tags
A tag index is available. Each tag is found at `#tag` in the url. Additionally, at the end of every post, each tag is rendered at the bottom linking to that tag. Front matter:

```yml
layout: tags
permalink: /tags/
```

### 404
Jekyll & GitHub Pages changes `404.html` at the site root to the 404 page automatically. Hosting locally as a Jekyll server without a GitHub Pages gem won't, but if you're using GitHub Pages, then simply add this to the front matter of a `/404.html` file:

```yml
---
layout: error
code: 404
caption: The page you are looking for isn't here.
img: /assets/404.gif # if you have a 404 image then put it here
---
```

### RSS
This doesn't work too well with multiple profiles, as it lists every post in the site. Thankfully, the RSS `<author>` attribute is included for posts that tells users who posted the post, via Mastodon handle url. It's not actually an email, but if `admin` posted and your site was `admin-is-cool.github.io`, then the author would be `admin@admin-is-cool.github.io`. Front matter:

```yml
---
layout: rss
title: RSS Feed Name
---
```

### Sitemap
Mainly meant for search engine indexing, this file will list each page and post. Front matter:

```yml
---
layout: sitemap
---
```

## Analytics
[Amplitude](https://amplitude.com/get-started)'s analytics are supported, nothing else. Simply change `site.amplitude` to your **public** api key: 

```yml
amplitude: "c4414f71c116734c116c32af882d8260"
```
You can find your api key by going to Settings >> Projects >> your-project >> API Key in Amplitude. When you first create an Amplitude Organization, you're already in Settings. Just go to Projects >> your-project >> API Key.

I found out about Amplitude as a great service that allows you to value privacy while getting good insights. Much better and more private than Google Analytics, just a bit harder to set up. On Amplitude, you need to embed a script tag with `logEvent` code and make your own charts. Amplitude will not log the user's IP address, city, or DMA (even more precise location than city). By default, we log these events to your Amplitude account if `site.amplitude` contains your **public** key:

* "Analytics Loaded"; url
* "Profile View"; handle
* "Post Click"; title, tag (only the first tag)
* "Error"; code

To log your own events, just add the following code to the post you are editing:

```html
<script type="text/javascript">
	amplitude.getInstance().logEvent(
		"EVENT NAME", {
			parameter_1: "this will be logged under parameter_1",
			parameter2: "please edit these..."
		}
	);
</script>
```

## Variable Examples
If you don't have the time to go through every single variable and see what impact it has, then here are a few examples to help you understand (this part requires a modern browser and does not support internet explorer):

<details>
  <summary><code>bio</code></summary>
  
  <br>
  
  ```yml
  bio: "This is my newer bio"
  ```
  
  ![Bio](https://bloxxing.is-ne.at/PFfTwF.png)
  
</details>

<details>
  <summary><code>fields</code></summary>
  
  <br>
  
  ```yml
  fields:
    -
      name: "This is a feed item"
      content: "This can be anything"
    -
      name: "But,"
      content: "it can also be [links](https://example.com/)"
  ```
  
  ![Fields](https://bloxxing.is-ne.at/lnxvs5.png)
  
</details>

<details>
  <summary><code>author</code></summary>
  
  <br>
  
  (let's say your site is hosted on `ethan.github.io`.)
  
  ```yml
    author:
      name: All characters are supported!
      handle: lowercase # <- comment mark; and hypens, underscores, or pluses for spaces (-, _, +)
      url: '/' # where users go when they click your profile
      email: "MyRealEmail@gmail.com" # contact email address
  ```
  
  ![Author](https://bloxxing.is-ne.at/xmfYck.png)
  
</details>


<details>
  <summary><code>author: email</code></summary>
  
  <br>
  
  ```yml
    author:
      email: "MyRealEmail@gmail.com" # contact email address
  ```
  
  On an about page:  
  ![Author: Email](https://bloxxing.is-ne.at/iddn0P.png)
  
</details>

<details>
  <summary><code>avatar</code></summary>
  
  <br>
  
  ```yml
    avatar:
      path: "https://dummyimage.com/500x500/000/fff.png"
      circle: true
  ```
  
  ![Avatar](https://bloxxing.is-ne.at/ezHh7Y.png)
  
</details>

<details>
  <summary><code>banner</code></summary>
  
  <br>
  
  (let's say there's a file at `/assets/` called `banner.png` (`/assets/banner.png`), with [this content](https://files.mastodon.online/accounts/headers/000/192/909/original/1023e6bfb51bd6f1.png))
  
  ```yml
    banner: "/assets/banner.png"
  ```
  
  ![Banner](https://bloxxing.is-ne.at/skI7OI.png)
  
</details>


<details>
  <summary><code>role / admin / moderator</code></summary>
  
  <br>
  
  ```yml
    admin: true
    moderator: true
    role: Another Cool Role
  ```
  
  ![Role / Admin / Moderator](https://bloxxing.is-ne.at/fecRFp.png)
  
</details>

If anyone would take the time to convert some of this information to Wikis, that would be appriciated. Don't feel pressured to, though: it's not high on our to-do list.
