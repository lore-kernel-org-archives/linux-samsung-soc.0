From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: fix CDCLK handling
Date: Thu, 2 Oct 2014 18:54:09 +0100
Message-ID: <20141002175409.GX4273@sirena.org.uk>
References: <1412095211-4012-1-git-send-email-drake@endlessm.com>
 <542D7A6B.7010000@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t54s24TTWYm6oOX+"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58972 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971AbaJBRyh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Oct 2014 13:54:37 -0400
Content-Disposition: inline
In-Reply-To: <542D7A6B.7010000@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Daniel Drake <drake@endlessm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org


--t54s24TTWYm6oOX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 02, 2014 at 06:16:43PM +0200, Sylwester Nawrocki wrote:
> [dropping unrelated addresses from Cc]

You've dropped Liam who's the other ASoC maintainer.

> Sorry for getting back late to this. Indeed we have a mess here.
> I mostly tested interaction between two CPU DAIs - the main and the
> overlay one (which is not supported in mainline yet).

The dual DAIs were supported in mainline when the code was merged...

> > Simplify the situation and solve the bug with the following approach:
> >  - as before, samsung_i2s_dai_probe() gates CDCLK by default
> >    (no need for smartq_wm8987 to do this as well)
> >  - platform drivers can gate/ungate CDCLK as necessary
> >    (currently only odroidx2 needs to do this)
> >  - i2s code has no other interaction with CDCLK

> I'm not an ASoC expert, but I'd say it would be better to modify
> the I2S module so there is no additional callbacks needed in
> the machine driver. This way all machine drivers using the CDCLK
> output could be simplified, not mentioning using simple-card.
> I'm not sure how to do it yet, I'm going to take a look at this
> over the weekend.

Yes, keeping this in the SoC side drivers seems all round better.
Perhaps the I2S driver should be exposing CDCLK as a clock via the clock
API?  Dunno if that'd help or not.  Or refcount.

--t54s24TTWYm6oOX+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJULZFAAAoJECTWi3JdVIfQ/oQH/1d8rZ2JpwIRQz0Mdf8DCoDP
mlrDo4diy4zxtjqkHieJV0xuZqP/ns2gIfr5ksir/CWuAzq3rR6cjFeZx/sr1XB8
uUHD6Yo6SZYLA53mVmg2SW/pBFoYBschVpv+qJvg6NyQVSftBrA93e8qOjhkoWnA
lov/1NE4XjY0dkHCmCtxsxQxHCjAEkfXVuPimUCa8YV85ROZ5CLytnt2X0SYmkX2
w4gz5aqxrwhQHOsIKuqy4FaK1lWNMF04cXTYEW/vy2WJP94FHaglhC8iB9PBv2/1
Zaj/eNMMOG4+wVJQ0WQgsm9Wug6hEdvFhVNjggM3OomxFg9sdsWYttXQvBdPkwo=
=IOn6
-----END PGP SIGNATURE-----

--t54s24TTWYm6oOX+--
