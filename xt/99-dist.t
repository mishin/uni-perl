#!/usr/bin/env perl

use lib::abs '../lib';
use Test::More;
use Test::Dist;
chdir lib::abs::path('..');
-d ".git" or plan skip_all => "Only author";

Test::Dist::dist_ok(
	run => 1,
	'+' => 1,
	skip => [qw(prereq)],
	kwalitee => {
		req => [qw( has_separate_license_file has_example
		metayml_has_provides metayml_declares_perl_version
		uses_test_nowarnings has_version_in_each_file
		)],
	},
	prereq => [
		undef,undef, [qw( Test::Pod Test::Pod::Coverage )],
	],
);
exit 0;
require Test::NoWarnings;
