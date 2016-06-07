### Developer Documentation

This is a documentation project for [Nakadi]. It's based on [Gitbook] and publishes content to [Github] Pages.

Gitbook/Github pages want to use README.md as part of the book, so the howto is here.

### Setup

You'll need to install npm to get going. Once you've got that and have the project cloned, `cd` to the project's home directory and run

```
npm install gitbook-cli --save-dev
```

This will set up gitbook locally in the project.

### Running a Local Gitbook

This will start a server on [http://localhost:4000](http://localhost:4000) that watches changes:

```
npm run docs:watch
```

If you just want to rebuild you can run: 

```
npm run docs:build
```


### Publishing the docs

This will change to be done as part of a merge to master, but for now:

```sh
npm run docs:publish
```

will take what's in master, update the `gh-pages` branch with the content and push the change.

