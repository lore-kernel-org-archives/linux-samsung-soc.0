From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Sun, 7 Sep 2014 16:01:22 +0100
Message-ID: <20140907150122.GK2601@sirena.org.uk>
References: <20140905115704.GO13515@arm.com>
 <20140905122232.GP13515@arm.com>
 <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
 <540C202E.2060009@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x1F0m3RQhDZyj8sd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55302 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752329AbaIGPCf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Sep 2014 11:02:35 -0400
Content-Disposition: inline
In-Reply-To: <540C202E.2060009@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


--x1F0m3RQhDZyj8sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 07, 2014 at 11:06:54AM +0200, Javier Martinez Canillas wrote:

> But maybe we could add a boot argument similar to "clk_ignore_unused" but for
> regulators? Something like "regulator_ignore_unused" that would prevent the
> regulator core to disable unused regulators? If Mark agrees with that idea
> I'll be glad to propose a patch.

I'm not all that sympathetic to the idea; we already have quite enough
quality problems with the way people hook up regulators without
providing yet another way for them to hack around things, I'm concerned
it'll just make things more fragile as people require magic command line
arguments to get things working.

--x1F0m3RQhDZyj8sd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUDHM+AAoJECTWi3JdVIfQ1ukH/1lBL84lKJcG4rqJA2fqkh2R
vR+3Avx6ipEQgNIzzis5pnpvN7ZCb4/Nwet4hhjlBUacbvj7aHCukRVHxY3VPgvp
XlNSH6SKcoRPgOZHXLX264Hl/1b5Gi6BRqDOCxu60/H59ujR/txsOD913443DQ9o
mVUSu8UAhG2a+k4CjOeRRdvNGSX9moEygxXNmLJr6DCm+699/oAF9TNmQhlQtWBI
651GZauQsuj7cbtsxJlrVB9cjZEhDO2CMLQwya5jNPMMqFXkjA8vOH7tutxRf9YX
hA4ro27CS4+onZDLA8TFLFZfFraH+CVnR2+DmQuKJwCJpAjtnnkN3Eh+EJCn6rg=
=UIyP
-----END PGP SIGNATURE-----

--x1F0m3RQhDZyj8sd--
