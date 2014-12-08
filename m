From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: i2s: Add missing assignment of
 variant_regs
Date: Mon, 8 Dec 2014 20:47:11 +0000
Message-ID: <20141208204711.GF11764@sirena.org.uk>
References: <1418060754-7064-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qfesBOB4TKwppX3D"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52341 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755105AbaLHUrT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 15:47:19 -0500
Content-Disposition: inline
In-Reply-To: <1418060754-7064-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org


--qfesBOB4TKwppX3D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 08, 2014 at 06:45:54PM +0100, Sylwester Nawrocki wrote:

> Add assignment of the variant_regs field which is missing in commit
> a5a56871f804edac93a53b5e871c0e9818fb9033 ("ASoC: samsung: add support
> for exynos7 I2S controller"). Without this attempting to probe the
> secondary DAI fails with an error like:

Applied, thanks.  Broader testing of changes before sending them
upstream would be good...

--qfesBOB4TKwppX3D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUhg5PAAoJECTWi3JdVIfQp1cH/i+e68G/6FoThfqJq8mmyj4k
mH/141HzVk8s6/KxZ7hL3DhTsbHkiEbrMp18oj6SF3C+FTuoLqd4ofwWeeeIxoNW
fRJGGvmISDaj+B6GoXhwJn5ds8r8Ebn/sIDlFyZgnHMhNQs+Fs4fteOa34Dd+TX/
50ma2q8l2OSX3cDzzhUyGpg3DH92Bl8LBVF8FPAXwPT4rRLp54fViZeZPoMMs66U
L7rmfkNWkKbwrgWS6umj1bLIT498U1mRqqWO/wPeQMcDojvsPFu2q8tK/Fq4Rmbe
axTP9bxRHbbwsbRT6Chyq6g5lfsT9wbTQC6adv8UNdact3kgPXgMK8AwGTK7zVM=
=lq01
-----END PGP SIGNATURE-----

--qfesBOB4TKwppX3D--
