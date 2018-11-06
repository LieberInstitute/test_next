#!/usr/bin/env nextflow

version = "0.99.0"

// Check that Nextflow version is up to date enough
// try / throw / catch works for NF versions < 0.25 when this was implemented
nf_required_version = '0.27.0'
try {
	if( ! nextflow.version.matches(">= $nf_required_version") ){
		throw GroovyException('Nextflow version too old')
	}
} catch (all) {
	log.error "====================================================\n" +
			"  Nextflow version $nf_required_version required! You are running v$workflow.nextflow.version.\n" +
			"  Pipeline execution will continue, but things may break.\n" +
			"  Please run `nextflow self-update` to update Nextflow.\n" +
			"============================================================"
}

process RSession {
    
	script:
	"""
	Rscript -e "sessionInfo()"
	"""
}

//result.subscribe  { println "Process result: $it" }
