#! /usr/bin/env perl
##
## vi:ts=4
##
##---------------------------------------------------------------------------##
##

use Compress::Bzip2;

my $SourceString;
my $TargetString;
my $TargetOutString;
my $InputFile;
my $OutputFile;

if ($ARGV[0] ne '') { $InputFile=$ARGV[0]; }
else { $InputFile='test.t'; }

$OutputFile=">".$InputFile.".dek";

if (-e $InputFile) {
    open(INPUT, $InputFile);
    while(<INPUT>) {
	$SourceString.=$_;
    }
    print "\n\nDie Datei wurde eingelesen.\n";
    print "Die OrginalDatei hat die Groesse: ".length($SourceString)."\n\n";

    $TargetString=Compress::Bzip2::compress($SourceString);

    print "Bzip-Com: ".length($TargetString)."\n";

    $TargetOutString=Compress::Bzip2::decompress($TargetString);


    print "Bzip-Dec: ".length($TargetOutString)."\n";

    open(OUTPUT, $OutputFile);
    print OUTPUT $TargetOutString;

}
else {
    print "Datei ".$InputFile." konnte nicht geoeffnet werden.";
}
#Ende