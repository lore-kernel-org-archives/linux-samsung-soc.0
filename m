From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 7/8] ARM: dts: wm8994: Add wm8994 support on smdk5420
Date: Sun, 4 Aug 2013 18:22:05 +0100
Message-ID: <20130804172205.GT9858@sirena.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
 <1374845812-7803-8-git-send-email-padma.v@samsung.com>
 <20130726151902.GL9858@sirena.org.uk>
 <CAAgF-Be8SNxTZv1yFCwH6yJ-O_3R4reh=3y+pSCLJYW7S9TkUg@mail.gmail.com>
 <CAAgF-Bexp_fGT8KV+TQ0_kZLJBtq7UK=TG4eYRA6qpTSL+scxg@mail.gmail.com>
 <20130729134311.GX9858@sirena.org.uk>
 <CAAgF-BeDYm1jNJpkyfTeS5HjpEuaHiumFq+D_PNs=QYG6-Px+w@mail.gmail.com>
 <CAAgF-BcPT24LcQe5SUyOP3qHThXqZ1mVts=_cnww3EAUYEYikw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b0cBboSxZFnoy/DE"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45497 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751649Ab3HDRWb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Aug 2013 13:22:31 -0400
Content-Disposition: inline
In-Reply-To: <CAAgF-BcPT24LcQe5SUyOP3qHThXqZ1mVts=_cnww3EAUYEYikw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org, Tomasz Figa <tomasz.figa@gmail.com>


--b0cBboSxZFnoy/DE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 02, 2013 at 04:15:28PM +0530, Padma Venkat wrote:

> Sorry for giving some what wrong info here. I verified the schemata.
> There is a switch on the board which can be used to select the input
> clock of codec MCLK1. We can either select oscillator clock which is
> 16.9MHz which is on the board or XCLKOUT which is from PMU or
> i2scdclk(codec slave mode). Right now we are using oscillator clock as
> input clock to MCLK1.

I agree that going with whatever the board ships with as default seems
sensible.  Might be worth putting in a comment with the XCLKOUT option
saying how it maps into the control on the board.

--b0cBboSxZFnoy/DE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR/o26AAoJELSic+t+oim9BUwP/2su3IKsZ2CtanNIMmfN0C5N
y1ZtRbpJ9Asecsnvugtb3geZXTjPVLz5FHVc8/p2SbU+qxGObPbyH0GNi3pHJjgG
fIxFhmIO2qPUBetKdgpJjD+LInI+yRK5oOrTnE6ObfCzaHedM1xehAeTM5APwHLf
TuHkUnNxie/LnTaNP/uQwLQ8yOH43IA6oAu5QdppbvLLMipTN1aILc8DpEfEhGq7
f/IlJWY+aBE1i8lhsizHQvl8XeRadMqXpjuvAzJ2RNjjy38EJ28LzEHhAQrRtMPt
TyjSaB77qfxlW7Ry10UDHf6g4wQwl66doZ1z30du9oAOL00jmDc2wg1175TAlbFr
0aOT4beEMamjZ4PmeoHhlh7Ow1Ml8r6Ya9IFy/bX7OCHjR1Ru6dIcs88PNIrdH+U
+JeRqI9T72Alw68m1wS9BOfJUZh5kF2PVpEFN1XQAL4ea0WpZKGcSdHj9rlozMag
TtYotc84440h+x6WSa7KzkgPztxYWdiF+k7WKOJTYdUrOd3Q4GK9+p12Cdz09rRf
1pRt/j41pr7SupnxnE1itSLcAiIq06ndPysRFIjLEhUHX10/QQelCCxDdnaRIJ+W
omOBBC6KpZ31awaYYXrEFyWmPd7Zq/+41umAX9Ypibh0cz3p2ZN7AwSo4Rpkcrhm
u2UjfpAVDsmLzrpXWvIw
=UCbp
-----END PGP SIGNATURE-----

--b0cBboSxZFnoy/DE--
