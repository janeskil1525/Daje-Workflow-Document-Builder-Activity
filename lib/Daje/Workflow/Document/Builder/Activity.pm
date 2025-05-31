package Daje::Workflow::Document::Builder::Activity;
use v5.40;
use experimental 'given';

# NAME
# ====
#
#      Daje::Document::Builder - It's the document builder
#
#
# REQUIRES
# ========
#
# use Mojo::Base;
# use Template;
#
# DESCRIPTION
# ===========
#
# Daje::Document::Builder Builds documents
#
# LICENSE
# =======
#
# Copyright (C) janeskil1525.
#
# This library is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# AUTHOR
# ======
#
# janeskil1525 E<lt>janeskil1525@gmail.comE<gt>
#
#

our $VERSION = "0.01";

has 'type' => 'html';
has 'config';
has 'data';
has 'template_name';
has 'template';

sub process($self) {


}





1;
__END__

=encoding utf-8

=head1 NAME

Daje::Workflow::Document::Builder::Activity - It's new $module

=head1 SYNOPSIS

    use Daje::Workflow::Document::Builder::Activity;

=head1 DESCRIPTION

Daje::Workflow::Document::Builder::Activity is ...

=head1 LICENSE

Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

janeskil1525 E<lt>janeskil1525@gmail.comE<gt>

=cut

