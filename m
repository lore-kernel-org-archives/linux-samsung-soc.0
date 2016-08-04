From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 7/8] ASoC: samsung: s3c24xx_uda134x: debug/error trace
 cleanup
Date: Thu, 4 Aug 2016 22:05:54 +0100
Message-ID: <20160804210554.GL10383@sirena.org.uk>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
 <1470317928-25365-8-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lZZ4ablUVnt2XgAh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51048 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759011AbcHDVGD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 17:06:03 -0400
Content-Disposition: inline
In-Reply-To: <1470317928-25365-8-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--lZZ4ablUVnt2XgAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2016 at 03:38:47PM +0200, Sylwester Nawrocki wrote:
> Switch from pr_* to dev_* macros and drop some debug traces.

This doesn't apply against current code and the previous patch had
unknown SHA1s suggesting that you've got some other patches in your
tree, please check and resend.

--lZZ4ablUVnt2XgAh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXo64xAAoJECTWi3JdVIfQKr4H+wThnrb2xyAK/QuPbvuz9d6L
CUCp03yihBnRO4v+lSdC2MfkpX5lybAyyj3EZyVoIsdr8J9l84zlwVx5rgtpUo6P
mh7QG54+qH/RdHeLciIFFifJdK1Ie7L0X5/ny4EhXw+uVxXcC4XF4V37K8UmPeHd
eaYmJwm9Uw558FlZB/jdrz/dLo/IOCu4HqJFl22fJn7uq9RjUUPTEoxwSvorMAKR
Aug1EbYuEXsF7D0DG/2eO9Z33LtFf0fLQtv/P4tL283U2hTE6sN4oyIgZP/tMZU/
40iyDoApIrimel4bm/KOdRk5Ln1LhxOcfwuu9PRZliRTHjP+Sx0DX3UKUp+5OUI=
=gzeW
-----END PGP SIGNATURE-----

--lZZ4ablUVnt2XgAh--
