# CFPB Qualtrics Template

[Qualtrics](https://www.qualtrics.com/)
is a web-based survey platform currently in use at the CFPB.
This repo contains the code used to customize a survey template in Qualtrics
to reflect CFPB brand and accessibility guidelines,
along with instructions for customizing the parts of a survey
that are not able to be modified with custom code.

![Example survey with multiple choice question and text entry question using the template found in this repo](https://raw.githubusercontent.com/cfpb/qualtrics-template/master/screenshots/example-survey.png)


## Usage

The code in the `src` directory is already in use in the CFPB Survey Template
in the Consumer Financial Protection Bureau group library.

A utility has been added to upload these files to an S3 bucket. Simply run `./s3.sh` with the following environment variables set:

```
export AWS_ID=<A relevant aws_access_key_id>
export AWS_SECRET=<A corresponding aws_secret_access_key>
export AWS_BUCKET=<Your AWS bucket> #Default: files.consumerfinance.gov
export AWS_PREFIX=<The prefix in said bucket>  #Default: /assets/qualtrics 
```

## Getting help

If you have questions, concerns, bug reports, etc., please
[file an issue](https://github.com/cfpb/qualtrics-template/issues/new)
in this repository's
[issue tracker](https://github.com/cfpb/qualtrics-template/issues/).


## Getting involved

See the [CONTRIBUTING](CONTRIBUTING.md) doc for information on
how to contribute to this project.


----

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)
