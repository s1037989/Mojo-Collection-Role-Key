package Mojo::Collection::Role::Key;
 
use Role::Tiny;
 
our $VERSION = '0.001';
 
requires 'grep';
requires 'sort';

sub sortkey { my ($self, $key) = @_; $self->sort(sub{$a->{$key} cmp $b->{$key}}) }
sub grepkey { my ($self, $key, $qr) = @_; return $self->new(@$self) unless $qr; $qr = qr(^$qr$); $self->grep(sub{$_->{$key} =~ $qr}) }

1;
