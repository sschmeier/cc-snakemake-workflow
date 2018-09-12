from snakemake.shell import shell

log = snakemake.log_fmt_shell(stdout=False, stderr=True)

shell("freebayes {snakemake.params} -f {snakemake.params.index} "
      "{snakemake.input.samples} > {snakemake.output} {log}")
