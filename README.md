# snakemake-workshop-files
data and scripts used in snakemake workshop

## About environment_profile.yaml
These are the minimum packages required for snakemake to work with profiles. Use `mamba` to install the packages e.g. in an environment run `mamba env update --file environment_profile.yaml`

# Snakemake commands to run 
    snakemake –n -s 01-snakefile.smk (-p is not needed)

## Show wildcard – change A to bam
    snakemake -n mapped_reads/B.bam -s 02-snakefile-wildcard.smk

## Use sample to replace wildcard
> need to create an overall rule that does not contain "wildcard" but instead a "expand" function

    snakemake -s 03-snakefile-wildcard-substitute.smk

## Add a second rule 
    snakemake -s 04-second-rule.smk 

    snakemake --dag -s 04-second-rule.smk | dot -Tsvg > dag.svg

## profile 
activate an environment that contains all required packages for profile 

remove all result files to see effect

    snakemake -s 04-second-rule.smk --profile lsf