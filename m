From: Mark Brown <broonie@debian.org>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Mon, 23 May 2016 17:24:55 +0100
Message-ID: <20160523162455.GW8206@sirena.org.uk>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+1d8mk/W7pQzMfc7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59398 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021AbcEWQZF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 12:25:05 -0400
Content-Disposition: inline
In-Reply-To: <20160523144047.GA36908@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org


--+1d8mk/W7pQzMfc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2016 at 04:40:47PM +0200, Steinar H. Gunderson wrote:
> On Mon, May 23, 2016 at 03:47:37PM +0200, Steinar H. Gunderson wrote:

> > In this case, it's not just an annoyance, though; they're so many that they
> > keep the system from booting unless loglevel is turned down. Cc-ing Mark in
> > case he has any insights (I hope I have the right email address).

But nobody who works on probe deferral or made any of the suggestions I
mentioned in the message you linked to, nor anyone who works on the
driver you've identified a bug in...  :(

> > I don't understand entirely why it tries 2000+ times before it succeeds

> Now I do; the initramfs doesn't include i2c-exynos5, and before that is
> loaded, s2mps11 (the regulator) can't come up either.

> So fixing initramfs-tools to include the driver will seemingly fix (or maybe
> more work around) the huge amounts of spam, but this is still a larger issue
> that needs resolving.

Not really, the issue you're seeing is just a plain resource leak in the
driver that happens to blow up worse than normal in your particular
configuration.  This isn't even something related to probe deferral at
the regulator level, the core is complaining that your system
description is buggy as it has omitted some of the supplies for the
device (notice how it says "using dummy regulator"...).   This is
happening a lot as the DWC3 driver is leaking, it is happening at all
because when the Exynos DWC3 integration creates it PHYs it doesn't map
the supplies through to them (it should be registering a supply alias to
do this).

The patch you linked to was for a completely different error message
which is at least related to probe deferral, though fundamentally unless
we just stop printing diagnostics (which is getting more and more
tempting to be honest) I'm not sure anything is going to fully resolve
leaks like this, the best chance you've got is something that explicitly
looks at the dependencies like Raphael was proposing.

--+1d8mk/W7pQzMfc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXQy7WAAoJECTWi3JdVIfQW6YH/RpDqn3MsIM1SxbAUeZKwxtO
u6dpv3DQJYH+a74oUMxQOXvoaInXoBa3mNvH9JDcqQ+IK7RUywUBhaS0XsH3hWgP
0g1s0avSisVAyUuIntPGAYTiQ6fKg6LV/x8F4HwACRM0AaZKvJt5URbZVIyOaDMR
FcEourjsyyGFFWnDBKiLb6bvEijCXant1nXyEUK2/mavkg97hIQ+jSLVfqAMgs2Z
7Jf79juGBUn3tklFM7iCzjgAFyZ7L1BSLBkQRXHDMs/qY1A/z4LbOM2YzywFQe+v
rltwVHfKM3paPMELPMb4YAEHjSTTuWaf8ats+q7/I3yl9DBGRpuCrpqvYu+YBmc=
=ugep
-----END PGP SIGNATURE-----

--+1d8mk/W7pQzMfc7--
