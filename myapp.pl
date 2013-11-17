#!/usr/bin/env perl
use Mojolicious::Lite;

my @routing_guide = (
  [ index   => 'Home'          ],
  [ past    => 'Past Meetings' ],
  [ contact => 'Contact'       ],
  [ qr      => 'QR'            ],
);

app->defaults( { routes => [ @routing_guide ] } );

# Actions.
sub index   { my $self = shift; $self->render; }
sub past    { my $self = shift; $self->render; }
sub contact { my $self = shift; $self->render; }
sub qr      { my $self = shift; $self->render; }

# Routes: ie, get '/index' => \&index...., past, contact, qr.
get '/'       => \&index => 'index';

foreach my $route_info ( @routing_guide ) {
  no strict 'refs';
  my $route = $route_info->[0];
  get $route => \&{$route};
}

app->start;

__DATA__

@@index.html.ep

  % layout 'default';
  % title 'Salt Lake &middot; Perl Mongers';

      <div class="jumbotron">
        <h1>Salt Lake Perl Mongers</h1>
        <p class="lead">
          The Salt Lake City Perl Mongers meet monthly to discuss Perl and
          Perl-related topics. Meetings are usually informal and there's always
          a social element.  If you enjoy the
          <a href="http://perl.org">Perl Programming Language</a>, or would
          like to learn more, join us.
        </p>
        <a class="btn btn-large btn-success"
           href="http://mail.pm.org/mailman/listinfo/saltlake-pm">
          Join our email list
        </a>
      </div>

      <hr>
      
      <!-- Damian Conway Announcement --
      <p>
        <b>Special Announcement:</b> The Salt Lake Perl Mongers welcome
        <a href="http://damian.conway.org/">Damian Conway</a> Thursday August
        1st, 2013 at 7:15pm, at UVU. Don't miss this rare opportunity to learn,
        to be confused, and to test the very bounds of sanity.
        <a href="http://www.youtube.com/watch?v=2zr7qKhG0vA">[Damian's Blurb, recorded at OSCON (video).]</a>
      <p>
      <hr>
      -- End of Damian Conway Announcement -->
      
      <div class="row-fluid marketing">
        <div class="span6">

          <h4>Meeting Schedule</h4>
          <p>2nd Tuesday, monthly.</p>
          <ul>
      <li><b>No December meeting.</b> Happy Holidays!</li>
            <li><b>Tuesday, January 14th, 2014 at 7:00pm.</b></li>
            <li>Tuesday, February 11th, 2014 at 7:00pm.</li>
          </ul>

          <h4>Location</h4>
            <p>
              <a href="http://www.bluehost.com/"><b>Bluehost</b></a><br />
              <a href="https://maps.google.com/maps?q=12159+South+Bus+Park+Drive,+Draper,+UT+84020&hl=en&sll=39.499761,-111.547028&sspn=6.052288,11.096191&t=h&hnear=12159+Bus+Park+Dr,+Draper,+Salt+Lake,+Utah+84020&z=16">
                12159 South Bus Park Drive, Suite 160<br />
                Draper, UT 84020
              </a>
            </p>
            <p>
              <b>Directions</b><br />
              From I-15 exit 12300 South and head west.<br />
              Take the first right.<br />
              Take the 2nd right (Bus Park Drive)<br />
              Bluehost is at the northeast corner.
            </p>

          <h4>Presentations</h4>
            <p>
              <b>TBA -- by YOU!</b>
              <br />
              Details will be made available as they emerge.
            </p>
<!--
            <p>
              <b>In Depth: TBA</b>
              <br />
              -- TBA  
            </p>
-->
        </div>

        <div class="span6">
          <h4>Past and Future Presentations</h4>
          <p>
            <b>The Future</b><br />
            <em>You</em> have something interesting to talk about!  Step
            forward and mention it on the email list.
          </p>
          <p>
            <b><a href="past.html">The Past</a></b><br />
            Look over our past presentations.  Whenever available, we also
            include links to slides and video.
          </p>

          <h4>Mailing List</h4>
          <p>
            Keep informed of upcoming events, and join in the low-traffic
            discussion.
          </p>
          <ul>
            <li>
              <a href="http://mail.pm.org/mailman/listinfo/saltlake-pm">
                Subscription Management
              </a>
            </li>
            <li>
              <a href="http://mail.pm.org/pipermail/saltlake-pm/">
                List Archives
              </a>
            </li>
            <li>
              List members may post to
                <a href="mailto:saltlake-pm@pm.org">
                  saltlake-pm<!-- Yes, this is a comment -->@pm.org
              </a>
            </li>
          </ul>

          <h4>Our Facebook Page</h4>
          <p>
            Our Facebook group is an alternate means of hearing about upcoming
            events.
          </p>
          <p>
            <a href="https://www.facebook.com/groups/515481075169254/">
              Salt Lake City Perl Mongers (Facebook)
            </a>
          </p>
        </div>


@@ past.html.ep

  % layout 'default';
  % title 'Salt Lake &middot; Perl Mongers';

      <div class="jumbotron">
        <h1>Salt Lake Perl Mongers</h1>
        <p class="lead">
          Meetings are the second Tuesday every month, at 7:00pm.  Here is what
          we have discussed in our past meetings.
        </p>
      </div>
      <hr>

      <div class="row-fluid marketing">
        <div class="span6">
          <h4>November 12th, 2013</h4>
          <p>
            <b>
                Introduction to Perl XS modules and Inline::C
            </b>
            [<a href="http://www.slideshare.net/daoswald/getting-started-with-perl-xs-and-inlinec">slides</a>]
            [<a href="http://www.youtube.com/watch?v=l0wvw3XAB2c">video</a>]
            <br />
            David Oswald
          </p>
          <p>
            <em>
              Special Thanks to <a href="mailto:rodney@listmarketer.com">
              Rodney Palmer</a> from <a href="http://listmarketer.com">
              ListMarketer</a> for providing pizza and soda.
            </em>
          </p>
          <h4>October 8th, 2013</h4>
          <p>
            <b>
              Exploring Perl Objects -- Blessed Refs, Inside Out, Moose.
            </b>
            [<a href="http://www.youtube.com/watch?v=wKHwk3ZC2Zc">video</a>]
            <br />
            Doran Barton
          </p>

          <h4>September 10th, 2013</h4>
          <p>
            <b>
              Workshop: Socket Programming with Perl
            </b>
            <br />
            Ryan Dietrich
          </p>
          <h4>August 1, 2013 <small>[Special Engagement]</small></h4>
          <p>
            <b>
              Temporally Quaquaversal Virtual Nanomachine Programming In
              Multiple Topologically Connected Quantum-Relativistic
              Parallel Spacetimes...Made Easy!
            </b>
            [<a href="http://youtu.be/2zr7qKhG0vA">trailer</a>] 
            [<a href="http://youtu.be/ZpInOI4o2LY">video</a>]<br />
            <a href="http://en.wikipedia.org/wiki/Damian_Conway">Damian Conway</a>
          </p>

        </div>

        <div class="span6">

          <h4>July 9, 2013</h4>
          <p>
            <b>
              Features of Perl that Separate it from Other Scripting Languages
            </b>
            [<a href="http://youtu.be/lY8f_Xausd4">video</a>]
            <br />
            Ryan Dietrich
          </p>
          <p>
            <b>Test Driven Development Workshop</b>
            <br />
            Dave Oswald
          </p>

          <h4>June 11, 2013</h4>
          <p>
            <b>Basics: Perl's Functional Functions</b>
            [<a href="http://www.slideshare.net/daoswald/perls-functional-functions">slides</a>]
            [<a href="http://youtu.be/Rjy2Q4qRdz4">video</a>]
            <br />
            Dave Oswald
          </p>
          <p>
            <b>An Introduction to <a href="https://metacpan.org/module/DBIx::Class">DBIx::Class</a></b>
            [<a href="http://www.slideshare.net/fozzmoo/introduction-to-dbixclass">slides</a>]
            [<a href="http://youtu.be/dE4bYcoNWk0">video</a>]
            <br />
            Doran Barton
          </p>

          <h4>May 14, 2013</h4>
          <p>
            <b>An Introduction to <a href="https://metacpan.org/module/Dancer">Dancer</a></b><br />
            Gordon Child
          </p>

          <h4>April 9, 2013</h4>
          <p>
            <b>30 minutes to CPAN</b>
            [<a href="http://www.slideshare.net/daoswald/30-minutes-to-cpan">slides</a>]
            <br />
            Dave Oswald
          </p>

        </div>

@@ qr.html.ep

  % layout 'default';
  % title 'Salt Lake &middot; Perl Mongers';

      <div class="jumbotron">
        <h1>Salt Lake Perl Mongers</h1>
        <p class="lead">
          Just another group of Perl hackers,
        </p>
      </div>

      <hr>

      <div class="jumbotron">
        <a href="http://saltlake.pm.org">
          <h1>
            <img src="./img/slpm_qr.png" alt="Salt Lake Perl Mongers QR Code">
          </h1>
        <p class="lead">
          <a href="http://saltlake.pm.org">Come Visit Us!</a>
        </p>


@@ contact.html.ep

  % layout 'default';
  % title 'Salt Lake &middot; Perl Mongers';

      <div class="jumbotron">
        <h1>Contact Salt Lake Perl Mongers</h1>
        <p class="lead">
          Have something to say?  Here are a few ways to get in touch with us.
        </p>
        <a class="btn btn-large btn-success"
           href="http://mail.pm.org/mailman/listinfo/saltlake-pm">
          Join our email list
        </a>
      </div>
      <hr>

      <div class="row-fluid marketing">
        <div class="span6">

          <h4>Mailing List</h4>
            <p>
              Join the mailing list and send us a message.
            </p>
            <ul>
              <li>
                <a href="http://mail.pm.org/mailman/listinfo/saltlake-pm">
                  Subcription Management
                </a>
              </li>
              <li>
                <a href="http://mail.pm.org/pipermail/saltlake-pm/">
                  List Archives
                </a>
              </li>
              <li>
                List members post to <a href="mailto:saltlake-pm@pm.org">
                  saltlake-pm<!-- Yes, this is a comment -->@pm.org
                </a>
              </li>
            </ul>
        </div>

        <div class="span6">
          <h4>Facebook Page</h4>
            <p>
              Visit <a href="https://www.facebook.com/groups/515481075169254/">
              our Facebook page</a>  and write on our wall.
            </p>

          <h4>The Salt Lake Perl Mongers Organizer</h4>
            <p>
              Send a message to
              <a href="http://www.perlmonks.org/?node_id=281137">davido</a>
              by way of <a href="http://www.perlmonks.org">PerlMonks</a>.
            </p>
            <p>Send email to David Oswald: 
              <a href="mailto:davido@cpan.org?Subject=[Salt%20Lake%20Perl%20Mongers%]">
                davido(at)cpan(dot)org</a>.
            </p>

        </div>


@@ layouts/default.html.ep

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><%== title %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Salt Lake City Perl Mongers">
    <meta name="author" content="David Oswald">

    <!-- Le styles -->
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>
    <link href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="./img/ico/favicon.ico">
  </head>
  <body>
   <div class="container-narrow">
    %= include 'masthead'
    <hr>
    <%= content %>
      </div>
      <hr>
      <div class="footer">
        <p>
          Hosting provided by
          <a href="http://www.perlfoundation.org/">The Perl Foundation</a>
          | This website's <a href="https://github.com/daoswald/saltlakepm">
              Github repository</a>
        </p>
        <small>
          <p>
            The Perl camel image is a trademark of
            <a href="http://www.oreilly.com/">O'Reilly Media, Inc.</a> Used
            with permission.
          </p>
        </small>
      </div>
    </div> <!-- /container -->

    <!-- Le javascript ================================================== -->
    <!-- Placed at the end of the document so the pages load faster       -->
    <script src="./bootstrap/js/jquery.js"></script>
    <script src="./bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>


@@ masthead.html.ep

      <div class="masthead">
        <ul class="nav nav-pills pull-right">
          % foreach my $route ( @$routes ) {
            % if( current_route eq $route->[0] ) {
              <li class="active"><a href="#"><%= $route->[1] %></a></li>
            % } else {
              <li><a href="<%= $route->[0] %>"><%= $route->[1] %></a></li>
            % }
          % }
        </ul>
        <a href="http://pm.org">
          <h3 class="muted">
            <img src="./img/perl_mongers-camel.png" alt="Perl Mongers">
          </h3>
        </a>
      </div>
