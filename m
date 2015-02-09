From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: samsung: clean up references to outdated
 Kconfig symbols
Date: Mon, 9 Feb 2015 14:07:04 +0800
Message-ID: <20150209060704.GB19229@finisterre.sirena.org.uk>
References: <1421664067.9655.51.camel@x220>
 <20150206235044.GO31311@finisterre.sirena.org.uk>
 <1423298284.2246.5.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57028 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751817AbbBIGIA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 01:08:00 -0500
Content-Disposition: inline
In-Reply-To: <1423298284.2246.5.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Valentin Rothberg <valentinrothberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 07, 2015 at 09:38:04AM +0100, Paul Bolle wrote:

> Patches 2/4, 3/4, and 4/4 didn't apply. Locally I carry them in a tree
> that constantly rebases on top of linux-next. So locally I carry these
> patches on top of next-20150204.

What's posted doesn't apply against -next.

> What tree would you like me to rebase this onto?

As ever submit against the tree listed in MAINTAINERS

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU2E6CAAoJECTWi3JdVIfQDSwH/1TV2o2g0ru71uapdnpRfNPl
BGiLXhivRf5QoYWM80NTJZIVEH0dPAxX5YiAcM5afhAsj32sEE0CbH4psXpBs9oD
LV4Y/ykv21CsZzAU8k6Ih1VeGPNMBy6fe009bW+8j46gFetUWk2Uh4rVGyAa093D
jLIH1GtP8ouRKdqac5LA0D0rqD+K47hEVKFTIyrodsE50TDDtmSEvofMWMaWcqrl
msAolphfu38xjyc86CFuz+pBd4PQBWe+Kt465BQrdOGsQ9CbPTrKFw3Iq50u/3zp
60MVOuHcR1837ho1pD+QqmTQkbAdZEp/zvw+QTa+4O06YHwVMK1nu7pe1uvH2sc=
=BAe9
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
