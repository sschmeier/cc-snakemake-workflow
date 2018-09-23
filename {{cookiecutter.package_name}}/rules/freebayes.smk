rule freebayes:
    input:
        samples = join(SORTDIR, "{sample}.sorted.bam"),
        bai     = join(SORTDIR, "{sample}.sorted.bam.bai")
    output:
        join(VARDIR, "{sample}.vcf")
    log:
        join(LOGDIR, "freebayes/{sample}.log")
    benchmark:
        join(BENCHMARKDIR, "freebayes/{sample}.txt")
    conda:
        join(ENVS, "freebayes.yaml")
    params:
        index = GENOME,
        extra = r''  ## optional parameters
    #wrapper:
    #    join(WRAPPER, "freebayes/wrapper.py")
    shell:
        "freebayes {params.extra} -f {params.index} {input.samples} > {output} 2> {log}"
