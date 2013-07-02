From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add WM1811A audio CODEC to Arndale bindings
Date: Tue, 2 Jul 2013 10:25:07 +0100
Message-ID: <20130702092507.GV27646@sirena.org.uk>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org>
 <1372714599-17588-3-git-send-email-broonie@kernel.org>
 <51D26360.2080708@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xFQBzfy8IMmn3THN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37283 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932269Ab3GBJZg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jul 2013 05:25:36 -0400
Content-Disposition: inline
In-Reply-To: <51D26360.2080708@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--xFQBzfy8IMmn3THN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2013 at 10:51:36AM +0530, Tushar Behera wrote:

> Arndale board also comes with two other audio codec boards - ALC5631Q
> and AK4678. Different audio codec boards came with different shipments.

This is the default though and since they didn't bother providing any
way of identifying the modules we just have to put them all in the
device tree and hope that the individual CODEC drivers can do runtime
identification (the WM1811A can but I don't know about the other two,
nobody supported them upstream).

--xFQBzfy8IMmn3THN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR0pxwAAoJELSic+t+oim9UroP/iIa1M8RAcZy9biZPLS5F/Dk
pyT5vlXN4PsEoTIQu/ETS3FjhPRBnJDNhqTk6coeqgCUzhzJhW1f6HGvdFyAFbUS
P6gyEALFvJb9CtiMLXjbCUGiOOexZFy0yOreWE3RfcZX/6n7fi3XdX6FXU1GNrUW
KTwV/PN4OFsXohh3GuOb8LdEPx/fg2EJFhXXYB4QeGREdAWRv3BUD7WKp0YqYFuP
9I+CH/9JPDw6+V1mVPN8al4iO12QXxS2KUmjiCvUpNejBP8L8gmdHsYhiHbrrDi2
Q7teFoc35413gfApzvo8IlB38GDMw5rEgeXsDkmLEBvHTUamTpSxPsWLpjJzz9zq
8AKdvdb7BNxrYtyTC22OI+tnn7M42A4Y4cvsQzdMg+2id62v2GWkK6JW06LuvWuc
xmaCI+nNuLCmuGxeN8U0Ms+HAMvCgRIMDKFs3Jgays9nuVxDiVjrOYI2ljj/uQD8
fJrQy5/1MzyFd/3dQkPd7WG9rVVJLxTPIAvvtR+TujQI9L6hImFutpHJIgyfjzQL
AM74xJbbO6D7bqLsY96YkXqhM0xRFr93CWfworWVJqrAOAr3m08hxJ6IvAjxJmSG
T+XHMELgn4OI7oSaqqOVA8KrRAO/LeCQTCTZLFfjLncyeHSHh3UVo+XOi2N7e4NX
BIoOAAf1vw289lVOnlgp
=A8Al
-----END PGP SIGNATURE-----

--xFQBzfy8IMmn3THN--
