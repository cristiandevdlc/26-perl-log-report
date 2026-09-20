use strict;
use warnings;
my $file = shift or die "Uso: perl report.pl app.log\n";
open my $fh, '<', $file or die "No se pudo abrir $file: $!\n";
my %counts;
while (<$fh>) { $counts{$1}++ if /\b(INFO|WARN|ERROR|DEBUG)\b/; }
close $fh; print "Reporte de log\n"; print "$_: " . ($counts{$_} // 0) . "\n" for qw(INFO WARN ERROR DEBUG);
