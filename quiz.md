### A
      SAMPLES=["A", "B", "C"]

      rule all:
          input: 
              expand("mapped_reads/{sample}.bam",sample = SAMPLES)


      rule bwa_map:
          input:
              fa="data/genome.fa",
              fq=expand("data/samples/{sample}.fastq",sample = SAMPLES)
          output:
              expand("mapped_reads/{sample}.bam",sample = SAMPLES)
          shell:m"
              "bwa mem {input.fa} {input.fq} | samtools view -Sb - > {output}"
              
              
### B
      SAMPLES=["A", "B", "C"]

      rule all:
          input: 
              expand("mapped_reads/{sample}.bam",sample = SAMPLES)


      rule bwa_map:
          input:
              fa="data/genome.fa",
              fq="data/samples/{sample}.fastq"
          output:
              "mapped_reads/{sample}.bam"
          shell:
              "bwa mem {input.fa} {input.fq} | samtools view -Sb - > {output}"
              
### C
      SAMPLES=["A", "B", "C"]

      rule all:
          input: 
              expand("mapped_reads/{sample}.bam",sample = SAMPLES)


      rule bwa_map:
          input:
              fa="data/genome.fa",
              fq="data/samples/{sample}.fastq"
          output:
              expand("mapped_reads/{sample}.bam",sample = SAMPLES)
          shell:
              "bwa mem {input.fa} {input.fq} | samtools view -Sb - > {output}"            
