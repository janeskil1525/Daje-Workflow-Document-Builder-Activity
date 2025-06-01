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

    if(my $tt = $self->_load_template()) {
        if(my $templates = $self->_load_templates() and $self->error->has_error() == 0) {
            if($self->error->has_error() == 0) {
                my $report = "";
                if($tt->process(\$templates, $self->context->{context}->{data}, \$report) == 1) {
                    $self->context->{context}->{document} = $report;
                } else {
                    $self->error->add_error($tt->error());
                }
            }
        }
    }
}

sub _load_templates($self) {
    my $tpl = $self->context->{context}->{template}->{data_section};
    my $templates = Daje::Workflow::Templates->new(
        data_sections => $tpl,
        source        => $self->context->{context}->{template}->{source},
        error         => $self->error,
    )->load_templates();
    my $template = $templates->{data_sec}->{$tpl};

    $self->error->add_error("No template named '$tpl' found") unless length($template) > 0;
    return $template;
}

sub _load_template($self) {
    my $tt = Template->new(
        {
            INTERPOLATE  => 1
        }
    ) or $self->error->add_error("$Template::ERROR\n");

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

