# Zip

Takes a folder and packages it as a ZIP file. Useful for ElasticBeanstalk
deployments. This should be part of the build pipeline, not the deploy pipeline.

## Notes

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL
NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and
"OPTIONAL" in this document are to be interpreted as described in
RFC 2119.

## Sample Usage

    build:
      box: ubuntu:latest
      steps:
        - bashaus/zip:
          cwd: $WERCKER_ROOT/build

&nbsp;

## Dependencies

This step will install the ZIP package via `apt-get` if it is not present;
however, you should try and make sure it is present in your application.

&nbsp;

## Step Properties

### store-symlinks

Whether symlinks should be stored as symlinks (true) or if the destination
should be copied (false).

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `true`
* `Validation` rules:
  * Must be either `true` or `false`

&nbsp;

### sources

The source files to be compressed into the zip.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `.`

&nbsp;

### target-file

The output ZIP file to be generated.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `$WERCKER_ROOT/$WERCKER_GIT_COMMIT.zip`

&nbsp;

### quiet

Whether or not to be quiet (true) or verbose (false) about the ZIP output.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `true`
* `Validation` rules:
  * Must be either `true` or `false`

&nbsp;

### opts

Any additional options that you want to pass to the ZIP executable.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`

&nbsp;
