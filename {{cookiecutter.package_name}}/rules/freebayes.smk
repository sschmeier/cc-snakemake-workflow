rule freebayes:
    input:
        samples = join(DIR_RES, "02_sorted/{sample}.sorted.bam"),
        bai     = join(DIR_RES, "02_sorted/{sample}.sorted.bam.bai")
    output:
        join(DIR_RES, "03_varcalls/{sample}.vcf")
    log:
        join(DIR_LOGS, "freebayes/{sample}.log")
    benchmark:
        join(DIR_BENCHMARKS, "freebayes/{sample}.txt")
    conda:
        join(DIR_ENVS, "freebayes.yaml")
    params:
        index = GENOME,
        extra = config["extra"]["freebayes"]  ## optional parameters
    #wrapper:
    #    join(DIR_WRAPPER, "freebayes/wrapper.py")
    shell:
        "freebayes {params.extra} -f {params.index} {input.samples} > {output} 2> {log}"
