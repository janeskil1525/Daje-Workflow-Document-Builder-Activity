package Daje::Workflow::Document::Builder::Activity;
use Mojo::Base 'Daje::Workflow::Common::Activity::Base', -base, -signatures;
use v5.40;

use Daje::Workflow::Templates;
use Template;

# NAME
# ====
#
#      Daje::Workflow::Document::Builder::Activity - It's the document builder
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
# Daje::Workflow::Document::Builder::Activity Builds documents
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


sub process($self) {

    my $test = 1;
    if(my $tt = $self->_load_template()) {
        if(my $templates = $self->_load_templates()) {
            my $report = "";
            my $result = $tt->process(\$templates, $self->context->{context}->{data},\$report);
            $self->context->{context}->{document} = $report if $result == 1;
        }
    }
}

sub _load_templates($self) {
    my $templates = Daje::Workflow::Templates->new(
        data_sections => $self->context->{context}->{template}->{data_section},
        source        => $self->context->{context}->{template}->{source},
        error         => $self->error,
    )->load_templates();
    my $template = $templates->{data_sec}->{$self->context->{context}->{template}->{data_section}};
    return $template;
}

sub _load_template($self) {
    my $tt = Template->new(
        {
            INTERPOLATE  => 1
        }
    ) or $self->error("$Template::ERROR\n");

    return $tt;
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

