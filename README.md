# Zip

Recursively compress files or directories into a ZIP archive, excludes GIT
files by default.

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
          quiet: false

&nbsp;

## Dependencies

This step will install the ZIP package via `apt-get` if it is not present;
however, you should try and make sure it is present in your application.

&nbsp;

## Step Properties

### exclude

Define an expression for any files you want to exclude

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`

&nbsp;

### exclude-git

Whether or not you would like to exclude GIT files (e.g.: `.git`, `.gitignore`).

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `true`
* `Validation` rules:
  * Must be either `true`, `false`, `1` or `0`

&nbsp;

### input-files

A space-separated list of files to compress.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `.`

&nbsp;

### opts

Any additional options that you want to pass to the ZIP executable.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`

&nbsp;

### output-file

The output ZIP file to be generated.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `$WERCKER_ROOT/$WERCKER_GIT_COMMIT.zip`

&nbsp;

### symlinks

Whether symlinks should be stored as symlinks (true) or if the destination
should be copied (false).

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `true`
* `Validation` rules:
  * Must be either `true`, `false`, `1` or `0`

&nbsp;

### quiet

Whether or not to be quiet (`true`) or verbose (`false`) about the ZIP output.

* Since: `0.0.1`
* Property is `Optional`
* Recommended location: `Inline`
* Default value is: `true`
* `Validation` rules:
  * Must be either `true`, `false`, `1` or `0`

&nbsp;
