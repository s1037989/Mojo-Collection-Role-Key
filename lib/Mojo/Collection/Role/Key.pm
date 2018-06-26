package Mojo::Collection::Role::Key;
 
use Role::Tiny;
 
our $VERSION = '0.001';
 
requires 'grep';
requires 'map';
requires 'sort';

sub addkey   { my ($self, $key, $value) = @_; $self->map(sub{$_->{$key} = $value}) }
sub sortkey  { my ($self, $key) = @_; $self->sort(sub{$a->{$key} cmp $b->{$key}}) }
sub nsortkey { my ($self, $key) = @_; $self->sort(sub{$a->{$key} <=> $b->{$key}}) }
sub grepkey  { my ($self, $key, $qr) = @_; return $self->new(@$self) unless $qr; $qr = qr(^$qr$); $self->grep(sub{$_->{$key} =~ $qr}) }

1;

=head1 NAME

Mojo::Collection::Role::Key - Minimal base class for Mojo projects

=cut
