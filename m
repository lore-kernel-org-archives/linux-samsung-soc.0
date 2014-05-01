From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 13/15] ASoC: SND_S3C_DMA_LEGACY needs S3C24XX_DMA
Date: Thu, 1 May 2014 12:11:25 -0700
Message-ID: <20140501191125.GB3245@sirena.org.uk>
References: <1398770316-19715-1-git-send-email-kaixu.xia@linaro.org>
 <1398770316-19715-14-git-send-email-kaixu.xia@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DakDFP6XNsQXR34C"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54445 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751865AbaEATLv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 15:11:51 -0400
Content-Disposition: inline
In-Reply-To: <1398770316-19715-14-git-send-email-kaixu.xia@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Xia Kaixu <kaixu.xia@linaro.org>
Cc: linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, arnd@arndb.de, Liam Girdwood <lgirdwood@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org


--DakDFP6XNsQXR34C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2014 at 07:18:34PM +0800, Xia Kaixu wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> SND_S3C_DMA_LEGACY can only be set on S3C24xx, which does not
> (yet) support the dmaengine framework, so samsung_dma_get_ops()
> fails to link if S3C24XX_DMA is disabled:

Why is the fix for this not to ensure that s3c24xx always enables the
DMA controller - how likely is it that it would be sane to build a
kernel without DMA after all?

--DakDFP6XNsQXR34C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTYpxZAAoJELSic+t+oim9upYQAIxwgpNQ9yiiLt/39B0RQESO
76zs63flcoNeFOJ8b/OLl/CMb02QasSFCNV6NL8LxfmzO9yoDwnaJliZgcKw/JXA
bu0D4P1kMUomwszaYbwXcxpeqL5pP8p6moAlNKgORi0uZDu3umK9UmQnKi2eWfoK
lWSg85rir4X95tfCKlieBGUKJSAJ+N66+0QsCKLZb1RLhiV2SUCt4BzabJI2GEcv
yu3i9hRvmUHez+XE4lBKLQkWpXYHwE0cGp1rHMl9/sVY/QaXjJU1Q9qtBkKiMaki
VgigaUwtcZtWyYzEKBHhbCnXB+LKASUC8M3CEgRTda9Hbt2b1qh6555ak5l8P4D3
Ydf0uIskm1CyZJd+up2ExPCw6mke3OEm5ehetuUNd2YUMwuOfBknTuv/b4axKpx1
DRpa38Lw9w1aTJ2cGUdCAJhjZUSp+6nqk+FAcmLHqR6kzGQLrl+NHZ0cd8RaM3BD
X4sDtGoAH+U4ER5o3ZhJNsxebecOmjpmcznp505IW21M68qN3m5PkocWW+FT2jRd
z3N8csWg4k2FPsrdCJZ3yQVIkXOfgaN08skM5S92V+gm/+vjxiu/99mgyRRWbzCA
nq68zsz3qdD+U7pbPSXJjM/h7dKn5jAoiFZoVWMbo5wfakXcvSj/wpSkq97SdxNh
UmFx0P6B/E8kg5J5NScr
=tBkC
-----END PGP SIGNATURE-----

--DakDFP6XNsQXR34C--
