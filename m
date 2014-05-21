From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s:
 port to use generic dmaengine API
Date: Wed, 21 May 2014 17:20:01 +0100
Message-ID: <20140521162001.GT12304@sirena.org.uk>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com>
 <45188858.i0tHnasRTk@phil>
 <CA+E=qVfXb2BeEsPcwnvKSiYRtP=HL6J_OLv+yrpg16kg74zJzQ@mail.gmail.com>
 <27469899.QpTIQjlnqG@phil>
 <CA+E=qVdnNPyR8NL2gxrt_rptjxB3RROYjSRe3rkHH-JLq==oFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O7YY5D6MORtE8D4Z"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35487 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023AbaEUQUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 12:20:22 -0400
Content-Disposition: inline
In-Reply-To: <CA+E=qVdnNPyR8NL2gxrt_rptjxB3RROYjSRe3rkHH-JLq==oFg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


--O7YY5D6MORtE8D4Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 07:09:19PM +0300, Vasily Khoruzhick wrote:
> On Wed, May 21, 2014 at 6:56 PM, Heiko St=FCbner <heiko@sntech.de> wrote:

> > Openmoko Freerunner (S3C2440) where there may be sound reachable somewa=
y and a
> > "Oyo" ebook-reader (S3C2416) whose i2s is I think compatible with the s=
3c64xx
> > instead of the s3c24xx ones and with a completely unsupported codec.

> Freerunner is s3c2442, and actually I can test s3c2442 on my iPAQ rx1950.
> s3c2416 may be supported by s3c2412-i2s, I have no spec at the hand,
> so I can't check.

The OpenMoko should work in mainline with an appropraite audio route set
up - there's an earpiece and (2.5mm sadly) headphone jack.

--O7YY5D6MORtE8D4Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfNIuAAoJELSic+t+oim9iFEP/idnvjoxsDkHYiLm9hwfi1Dw
yEsJQImjSHP1X2eRBTK2ICpzXcw4iqbHfJkic2CZQkKBl44y2XZZNENYVbatu91D
MEYZNfqNrhj2rMHmuJj3lMq++rMKuPxkU1ENmEwBwsILLxVV0121IkQ6jEbeyyRg
iCtjBN08rtjJTIg4e8AWjBSZxtMY+BG+i52eDLeE200rYfyYchoIy04dm0KAmTeW
wnokMup5wjHpsCfOv+E5IWUCAkrkARvNTuMN0yK7HDRX/2wAzF1CSlm5iHLYFBZY
Oluk9sYbkQCKlmLRyyiLPC+UzOmPFgDQWKZiQepijQYbGmxx94HfI26tSVjEgAvl
xiJ/0QVR7pMeaklqSoJdewOMQebw81chzgAx1hrMwiMcoIrnUCdB7DnetGte2Ppw
ZSvVWFpu03XFEYGUDJ3VIN7pejTFo3/yeIVJ5Jhd3kODfWk3Y4mYHJitpgslsUR3
rYwXzB9ya0Oo86oSgVNzmKggGxfVYSAcx8TJOt/gCZAtwMakkWa65/Wxw//NWn1Q
+aXefa2RU29H12K9dO3fYlslA3uAVPWS3J1Zy2gWdyUR8GdAtSg3JXBo+VY+yAwO
Ke86AMYLRmFca9ConJUrjv3O3dGlKMlvpCepJjUMzUHFVg5GGRmOmPg/ROekk8Dt
wlK09zd+Kv91Z4NrQhfG
=YQnP
-----END PGP SIGNATURE-----

--O7YY5D6MORtE8D4Z--
