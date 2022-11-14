nextflow.enable.dsl=2

include { annotate_1_1 } from './modules/annotate_1_1/module.nf'
include { annotate_2_1 } from './modules/annotate_2_1/module.nf'

workflow {
input1 = Channel.fromPath(params.annotate_1_1.meta_input).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), row[1]) }
annotate_1_1(input1)
annotate_2_1(annotate_1_1.out.output1)
}
