From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH V3 13/15] ARM: dts: Exynos4 and Odroid X2/U3 sound
 device nodes update
Date: Mon, 9 Feb 2015 14:18:41 +0800
Message-ID: <20150209061841.GA23228@finisterre.sirena.org.uk>
References: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57049 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752801AbbBIGTT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 01:19:19 -0500
Content-Disposition: inline
In-Reply-To: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2015 at 03:06:20PM +0100, Sylwester Nawrocki wrote:
> Clock related properties are added to the Exynos4 I2S device nodes
> so they can be referred to as clock providers. Missing i2s_opclk1
> clock is added to the I2S0 node and clock properties are added
> to the MAX98090 codec node to allow it to control/read frequency
> of the MCLK clock directly.

Applied, thanks.

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU2FFBAAoJECTWi3JdVIfQYpIH/RP2VIBMsyb+wDnjS7FGMZv0
3CFOYQsOg8u5FPujHittzxhltw75+HAVKF4x0jHmOkBl3zk99/+57/LBznYbFGQz
Eb+hkY7h0mth+lXzNNhnzNpkA8vNsh4tBWD74D2dTX8jmfAHEllKtLMoaeDSxwM5
bTu1SOJfcVS/7+cUPgsqJZgOPE7Kk2e+DLAheiDc0Xv8Xkwol9Js8n/FYY7h/Eoi
9TBprEDx50IJ2GhkPl8n+4RT391xH5hgiPpuoPX+p5R6B4q7gnCuoO0fFFSZ4Plm
MTWDu4tiBnEsCz4OuDvmOo6+NMaRsVwMfD8bWHSSjleIrgRLZC7A4Lkkd1VD9iw=
=/kcQ
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
