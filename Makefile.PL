use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Module::Depends::Tree',
    AUTHOR              => 'Andy Lester <andy@petdance.com>',
    VERSION_FROM        => 'Tree.pm',
    ABSTRACT_FROM       => 'Tree.pm',
    PM                  => { 'Tree.pm' => '$(INST_LIBDIR)/Tree.pm' },
    MAN3PODS            => {}, # Module::Depends::Tree's docs aren't useful
    EXE_FILES           => [ 'deptree' ],
    PL_FILES            => {},
    PREREQ_PM => {
        'Exporter' => 0,
        'Test::More' => 0,
        'Module::Depends' => 0,
        'Module::CoreList' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Module-Depends-Tree-*' },
);

sub MY::postamble {
    return <<'MAKE_FRAG';
.PHONY: tags
critic:
	perlcritic -1 .

MAKE_FRAG
}
