#!/usr/bin/perl

# Add the model name to this array if enable MESH=y or use newer QSDK
my @mesh_model = ("MAP-AC1750");
my $mesh = 0;

sub append_gpl_excludes
{
	my $fexclude;
	my $uc_model;
	my $uc_modeldir;

	$uc_model=uc($_[0]);
	$uc_modeldir=$_[1];

	system("touch ./.gpl_excludes.sysdeps");
	open($fexclude, ">./.gpl_excludes.sysdeps");

	for my $i (@mesh_model) {
		if ($uc_model eq $i) {
			$mesh = 1;
		}
	}

	if ($mesh == 1) {
		print $fexclude "${uc_modeldir}/linux/linux-3.3.x\n";
		print $fexclude "tools/openwrt-gcc463.mips.tar.bz2\n";
	}
	else {
		print $fexclude "${uc_modeldir}/qca95xx.mesh\n";
		print $fexclude "${uc_modeldir}/linux/linux-3.3.x.mesh\n";
		print $fexclude "tools/openwrt-gcc463.mips.mesh.tar.bz2\n";
	}

	close($fexclude);
}
	
if ( @ARGV >= 2 ) {
	append_gpl_excludes($ARGV[0], $ARGV[1]);
}
else {
	print "usage: .gpl_excludes.pl [model] [modeldir]\n";
}

