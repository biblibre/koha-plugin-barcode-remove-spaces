package Koha::Plugin::Com::BibLibre::BarcodeRemoveSpaces;

use Modern::Perl;

use base qw(Koha::Plugins::Base);

use C4::Context;

our $VERSION = '1.0';

our $metadata = {
    name            => 'Items barcode remove spaces',
    author          => 'BibLibre',
    description     => 'Remove any space character in item barcode',
    date_authored   => '2023-09-04',
    date_updated    => '2023-09-04',
    minimum_version => '21.11',
    maximum_version => undef,
    version         => $VERSION,
};

sub new {
    my ( $class, $args ) = @_;

    $args->{'metadata'} = $metadata;
    $args->{'metadata'}->{'class'} = $class;

    my $self = $class->SUPER::new($args);

    return $self;
}

# Mandatory even if does nothing
sub install {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub upgrade {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub uninstall {
    my ( $self, $args ) = @_;

    return 1;
}

# See sample t/lib/plugins/Koha/Plugin/TestItemBarcodeTransform.pm
sub item_barcode_transform {
    my ( $self, $barcode_ref ) = @_;

    my $barcode_val = $$barcode_ref;
    if ($barcode_val) {
        $barcode_val =~ s/\s//g;
        $$barcode_ref = $barcode_val;
    }

}

1;
