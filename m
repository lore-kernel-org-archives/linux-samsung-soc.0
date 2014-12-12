From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH/RFC 04/14] ASoC: samsung: i2s: Request memory region in
 driver probe()
Date: Fri, 12 Dec 2014 18:49:27 +0000
Message-ID: <20141212184927.GR11764@sirena.org.uk>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <1418319952-10163-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="08WHHcMLi9slgnFE"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57063 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754087AbaLLStq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 13:49:46 -0500
Content-Disposition: inline
In-Reply-To: <1418319952-10163-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com


--08WHHcMLi9slgnFE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 11, 2014 at 06:45:42PM +0100, Sylwester Nawrocki wrote:
> The memory mapped registers region is common for both DAIs so request
> it in the I2S platform device driver's probe for the platform device
> corresponding to the primary DAI, rather than in the ASoC DAI's probe
> callback. While at it switch to devm_ioremap_resource(). This also
> drops the hard coded (0x100) register region size in the driver.

This doesn't apply against current code, please check and resend.

--08WHHcMLi9slgnFE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUizi2AAoJECTWi3JdVIfQ2vAH/AtX6xhF18g8pdbLi9faj4TW
fItWlAwOFv2mSUeK8RJ3T5dSbJOiBquvrbhftDMZReVSQ75r9JdQS9klVMxE2yHO
ppm10Ks1KzNGPFyZt03lZRSLhEmSe2wrqdc/8E7FYVGzpy8a6EuKk7V18/JxINRC
+ZgmEReSuiNSNtE7ysUZR/dx4lIWihkJeteA3TEG5HbLxwq1bQDRlPEY/OjOeS4i
PctrjGmvUpevsNq40lz90Qg1hFQqEXEcvZM1atz8s/+pJlTmeRjgqf1rQ/prscRZ
/3o55KCLp597SBeQkf5hsPRJYThw7idWwPHuoTq+F2RC/3H87PkBZCdwUWF/G/g=
=taZ0
-----END PGP SIGNATURE-----

--08WHHcMLi9slgnFE--
