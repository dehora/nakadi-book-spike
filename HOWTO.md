### Developer Documentation

This is a documentation project for [Nakadi](https://github.com/zalando/nakadi). It's based on [Gitbook](https://www.gitbook.com) and publishes content to Github Pages.

Gitbook/Github pages want to use README.md as part of the book, so the howto is here.

### Setup

You'll need to install npm to get going. Once you've got that and have the project cloned, `cd` to the project's home directory and run

```
npm run docs:prepare
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

### The API Reference section

This section is generated from a copy of the Open API definition, that has been tidied up and optimised for people reading the content rather than machine generation. It uses the 
[swagger2markup](http://swagger2markup.github.io/swagger2markup/1.0.1-SNAPSHOT/#_configuration) project to convert the yaml to markdown and place the output into the `api-spec-generated` directory. The swagger2markup configuration is in the `./bin` directory and the additional reference text is in the `api-spec-extensions` directory. The swagger2markup jar files are checked 
in source to make it easy to run a build.



