#!/picb/bigdata/program/bin/perl
#$ -S /picb/bigdata/program/bin/perl
#$ -V
#$ -N fasta2phy
#$ -wd /picb/bigdata/project/guoxin/n3anc/
#$ -o /picb/bigdata/project/guoxin/n3anc/fasta2phy.out
#$ -e /picb/bigdata/project/guoxin/n3anc/fasta2phy.err
use strict;
use warnings;
use Bio::AlignIO;

my $aln_dir = "/picb/bigdata/project/guoxin/n0yn00/sequence/";
opendir(DIR, $aln_dir) || die "Error: cannot open directory $aln_dir\n";
my @files = readdir DIR;

foreach my $file (@files) {
	if ($file =~ /^(.+)\.fas$/) {
		my $id = $1;
		my $in = Bio::AlignIO->new(-file=>"$aln_dir/$id.fas", -format=>'fasta');
		my $aln = $in->next_aln;

		my $out = Bio::AlignIO->new(-file => ">$aln_dir/$id.phy", -format => 'phylip');
		$out->flag_SI(1);		# Phylip interleaved format shoule be marked #if phy2fasta plus #
		$out->idlength(30);		# ID length should be longer than default, or it will not complete #if phy2fasta plus #
		$out->write_aln($aln);
	}
}