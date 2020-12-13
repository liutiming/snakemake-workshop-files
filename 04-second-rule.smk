SAMPLES=["A", "B", "C"]

rule all:
    input: 
        expand("sorted_reads/{sample}.bam",sample = SAMPLES)


rule bwa_map:
    input:
        fa="data/genome.fa",
        fq="data/samples/{sample}.fastq"
    output:
        "mapped_reads/{sample}.bam"
    shell:
        "bwa mem {input.fa} {input.fq} | samtools view -Sb - > {output}"

rule samtools_sort:
    input:
        "mapped_reads/{sample}.bam"
    output:
        "sorted_reads/{sample}.bam"
    shell:
        "samtools sort -T sorted_reads/{wildcards.sample} "
        "-O bam {input} > {output}"