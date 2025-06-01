requires 'perl', '5.040000';
requires 'Mojo::Base', '0';
requires 'Daje::Workflow::Common::Activity::Base', '0';
requires 'Template', '3.102';
requires 'Daje::Workflow::Templates','0';


on 'test' => sub {
    requires 'Test::More', '0.98';
};

