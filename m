From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH V3 15/15] ARM: dts: Fix I2S1, I2S2 compatible for
 exynos4 SoCs
Date: Thu, 5 Feb 2015 19:41:05 +0000
Message-ID: <20150205194105.GM21293@sirena.org.uk>
References: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
 <1422972382-18520-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="04k0J7wEch5uF2Pi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52190 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752187AbbBETlP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 14:41:15 -0500
Content-Disposition: inline
In-Reply-To: <1422972382-18520-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org


--04k0J7wEch5uF2Pi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2015 at 03:06:22PM +0100, Sylwester Nawrocki wrote:
> I2S1, I2S2 on Exynos4 SoC series have limited functionality compared
> to I2S0, "samsung,s3c6410-i2s" compatible should be used for them.

I've applied this even though I really shouldn't in order to get it in.
Since it's a bug fix for stable it should've been near the head of any
series it's part of not the very last patch in the series, and since
it's not really related to the rest of the series except in that it
relates to the same driver it should probably have been sent by itself
rather than mixed in with everything else.

--04k0J7wEch5uF2Pi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU08dQAAoJECTWi3JdVIfQfMoH/R3L/JJXYLb4GnUi2BBCSu3L
b6l7+WqH/FIvRgmhhI6QUgCnC/8R9tQyLtbw+qaTx6WkAbTug8pO1PAZGnni+pey
Wmzl5IlRtX1iXN6DQcINaZNATKmyAXQkSX9pBjihIu7FFWYR0iMrTT/Ka6AWMjuL
f/oJF+ohZdQ55w8UyGlb2lCo3Ogc2UVF5dtWZgRpOnE46fOCUiHV2MtJB+zUSmWm
rykrbfMRvk2RQ8xJOkWSHkWMvmDrikS/BbzrRYWQQdXBibPCb3xKUcUpwHpF2Rqg
aZhSuS8sj8U7BImkG1qLJQDPWtMU/LvvYiinOg59lG7GmbcFZ9L6e3HUeWjBKi4=
=E7Ma
-----END PGP SIGNATURE-----

--04k0J7wEch5uF2Pi--
