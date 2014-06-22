From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v5] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Sun, 22 Jun 2014 11:35:02 +0100
Message-ID: <20140622103502.GJ24291@sirena.org.uk>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
 <CAD=FV=Ua+P0CBAfNj4SWWMWRKcEFdmh=akwy1-ZWoGOt2P9=cQ@mail.gmail.com>
 <20140621095149.GY5099@sirena.org.uk>
 <CAHfPSqCvHRMxPAVgRDrP-BSwuwJRP5O8Z+xy5Xot8t8mASNyAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53340 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699AbaFVKfq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 06:35:46 -0400
Content-Disposition: inline
In-Reply-To: <CAHfPSqCvHRMxPAVgRDrP-BSwuwJRP5O8Z+xy5Xot8t8mASNyAA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>


--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 21, 2014 at 10:53:14PM +0530, Naveen Krishna Ch wrote:

> The revisions were pretty quick

Yes, this is part of what I'm concerned about - it often means that
there are problems, either the review wasn't very detailed or the code
is being written too hastily.  In this case this is coupled with the
fact that it's an area of the code that has had problems in general is
setting off alarm bells.

> v4 to v5 : Added Acked-by and Revewied-by from Javier and Rob Herring

Don't resend for tags - you should include tags if you do resend but
they're not a good reason to do so.

> Kindly review and let us know your comments.

I will review it when I get to it, this isn't the only thing I've got
sitting for review.

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTprFSAAoJELSic+t+oim9Yf8P/0xhZ+89RfO1xc0sn8pzQQC7
KfSQDozEL7a6h69K7t/SjdPIELPM4WXud9aVAKxZFiikxk9FJr7aLP5RfTrEfXJs
PbFhXF4WXotJ0fLeo6ZsX4QcUdMb2zYgWyJdsN10y4nVTzFSLPLt8dkdwTLRP43I
RRFIA5+fzjlaoFsCt/SlWLH3LUYUc1zWPjNEvheFsVPogFuRvps6WYXRnbfbwi01
1Q7T6ULH6YVY6ghcVsX7roygh9bz80mztA0vZSlWXbjrh1rYpPIARTWniS91CzEe
31G1LbWD67xwiJIZNnCzLppLjByfm6MuA1rfKUDppSddUh366D3+ArsdPQjlZIkH
VO1Uh3lsxuDB5hexm3JQE4rpLdGNOvQkXqSAw4ufmgZXRuH0tqVHOlXeyQPM8fP4
v6DJUOQZ2ojfZ0bzQYz5Mpmhnh80ixdCzcv5J119zEaiVQlE0YWnGUoOUSI5uQNY
fVoZ8PkhOOOGb4S1KbSwG4E5NjmbaAv4hOpcIlQzEsiT6+gjIh4SSIc5wb6cWwmU
Q2L20DEUiuIbpiWYcVvLiqkz9+H1md1WeHqFAaS0K/+QxDCvPzwBFltDv7LdGucf
VvWGMnc8DpBD7NpHk6DcJqkLdJxY3EyPxcW6gUqz8bdghg4xBkVoS9Mh1pBo5Nxd
Hweu9dPRe/dgHVPyYhsf
=vHRT
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--
