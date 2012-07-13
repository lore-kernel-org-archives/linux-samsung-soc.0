From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Fri, 13 Jul 2012 10:44:43 +0100
Message-ID: <20120713094442.GA4215@opensource.wolfsonmicro.com>
References: <1340888138-32710-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20120709135229.GL1296@pengutronix.de>
 <20120709135809.GG3934@opensource.wolfsonmicro.com>
 <20120713083712.GH32184@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59481 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754891Ab2GMJoq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 05:44:46 -0400
Content-Disposition: inline
In-Reply-To: <20120713083712.GH32184@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 13, 2012 at 10:37:12AM +0200, Wolfram Sang wrote:
> On Mon, Jul 09, 2012 at 02:58:10PM +0100, Mark Brown wrote:

> > The devm_ versions of the API aren't exported there yet and there's a
> > bug fix pending too but Russell and Mike have ignored the patches thus
> > far.

> I'd rather wait for this to be fixed and have all devm applied in one
> go?

clkdev is vanishingly unlikely to be fixed this release, the patches
have been languishing in the patch tracker for essentially the entire
release cycle, rmk is on vacation now and Mike doesn't like taking
clkdev stuff.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP/+3wAAoJEBus8iNuMP3dNxYP/2aA2bG5+QLjoLBA4o5HUOkO
6MA/gg76OoOaTFKlRw9mRqLrJ/u8WHq/SP7NDWBJg6HfxBoPh6mFfCDDuz940t18
RNLf3/xbk3yyBxZLTM4JyNZMOgSVnnp6eA/1YLAt9Rrk6DM1G/a7LCEKLqgq9d/W
FoDlJD8PVuosWjNS0bNytqU7RUvK+Ym3dTdJ99WxpasDcpEso3rBsVRzcDgVNr65
QQmKbhPvpAoW/SKv/3GN6QeWgojntTtO6e6HJjUaXwtsabw6M3c7rYTPJUfU6pkr
K5kNZi3lMk6NYp8BYgCWP2oWeR2G2ZeMLhdJalrnZ+O/Y7OiUbwpVfRtyhwY298a
8OMgsiI2Wa6GYP/r5jVAWKIf02HsAPnrSzIBJdkvCBxfEMqY8j2+RcFd8A38PTeb
cv9SVi6rh7qgr0auzwYfMYswsbzpIzd7ddGdHbwm2gBuN3HJg6InejaamC6ub3K3
m/WCUUfwfMgFI5q6Um1eR+XJjqvB0VvArbfdtPP88BPCCS9vKvxXzGfB+3zZD3Dc
EnrGi4Jb2yialym2eN5WRdvVk3/5vogukjpDbpgVD3BQGkc+u9rKJKkz5Tv317R8
1G8TiPJGoUZwCgqYdkcq9gn8kdRT1IqgSWgTT31/7D+emrbmLiRXNdtWIY49CCEo
PyaGJ/gCw+7envfYlGSD
=bDH3
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
