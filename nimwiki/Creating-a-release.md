- github actions and azure pipelines are green (Usually the case these days) for the release branch 0-19, 0-20, etc
- Update the version in system.nim
- Update the changelog (put the release date, copy it to e.g. `changelog_0_20_0.md`)

- Nightlies now build the binaries for us: https://github.com/nim-lang/nightlies/releases 
- Ensure nightly builds exist

- DO NOT Update csources anymore, it's frozen forever.


- Check out the $VERSION_HASH part of the URL from https://github.com/nim-lang/nightlies/releases
- `ssh username@servername`
- run `nimrelease/nimrelease all $NIM_VER $VERSION_HASH`, for example, `nimrelease/nimrelease all 1.0.4 2019-11-27-version-1-0-c8998c4`

(The nimrelease program can be found here: https://github.com/Araq/nimrelease )

## Git Tag

- Tag the release, e.g. ```git tag -am "Version 0.15.0" v0.15.0```
- Push the tag: ```git push origin [tagname]```

## Website

### Updating the blog/downloads page

- Create a new blog post in `_drafts` titled: `version-<ver>-released.md` where `<ver>` is the version without any dots, e.g. `0180` for `0.18.0`.
- When ready to release:
  - move the blog post into `_posts`, making sure to append the current date to its filename: `2017-09-31-title.md`.
  - modify config.yml's `version` key to the new version
  - `git commit`
    - **TIP:** Here is a real-life example of a commit that signifies a release: https://github.com/nim-lang/website/commit/6f95916dee1212dcf5465d74dcff14e01f714503. The draft blog post was created in earlier commits, but hopefully it's pretty easy to figure out how it was made.
    - **TIP2:** You can see what a draft post looks like by running `jekyll serve --drafts` inside the website's `jekyll` directory.
  - `git push live master` (the `live` remote is a strict secret)

### Need to fix mistakes?

- **Notifying people about problems in release notes:** https://github.com/nim-lang/website/commit/9dcf1e2de155c197f7aa680e71d3c0ee6ae9b890