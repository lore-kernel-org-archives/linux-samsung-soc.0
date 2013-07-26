From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 2/8] ASoC: Samsung: I2S: Add quirks as driver data in
 I2S
Date: Fri, 26 Jul 2013 16:25:51 +0100
Message-ID: <20130726152551.GM9858@sirena.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
 <1374845812-7803-3-git-send-email-padma.v@samsung.com>
 <20130726145319.GI9858@sirena.org.uk>
 <1417636.4d7IlsSAyI@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFPc/E1qo/d29t+k"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38450 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757574Ab3GZP0P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 11:26:15 -0400
Content-Disposition: inline
In-Reply-To: <1417636.4d7IlsSAyI@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com


--oFPc/E1qo/d29t+k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2013 at 05:02:46PM +0200, Tomasz Figa wrote:

> IMHO this SoC-based identification looks much better, especially consider=
ing=20
> the fact that IP version isn't something easily determinable, as even the=
=20
> documentation can sometimes be not really clear about that.

Yeah, it's not terribly clever either way.  We've been using the version
numbers in audio for a long time partly because it is documented
sometimes and partly because most of the SoCs tend to have one fully
featured controller and a bunch of secondary controllers on older IP
revisions.

> However the s3c6410-i2sv4 string looks a bit unfortunate. AFAIK there wer=
e=20
> two types of I2S IPs on S3C6410 - normal I2S and I2S multichannel. What=
=20
> about having a compatible like s3c6410-i2s-multi?

It was explicitly identified as I2Sv4 in the S3C6410 datasheet so no
real issue there.

--oFPc/E1qo/d29t+k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR8pT8AAoJELSic+t+oim9YysP/ij8xU0g4F62uouFxbfckuN5
FlWJImrMBRtnc0V8vp6Xa6Yxz7OIc7Sw6q9WRKrGHwqRCJb5PR0w0dfUT2LeLEGb
OwynZPSlwLsVTguXuunXyG0inhhB10sniVM1Hh5i7JfFZ2D0lP1pXzfUUiNJ/WKp
dicVbCd10ITIXSMOmR6AWKppvvoQMPEKKY7EV818GtrVKGmWcSoX2/xNchjjitdj
9kCBxA/cCKaPxUHbiocbT08L1N8WegEerMu1g10IhbN35W8Xwo7f5m+iC82GNCjl
Q2v156+to4PvKwWmru5HTqzQXrgbLW94eOGJIUFffk6ujJqucYLc1CxbAWbqxzPe
cTIsfyJXqdHPixnAbZyLd7HwVHPr1ydfJyqXs7bdT+lPd7SZGDLR0jXGEcbDLgZj
T2lXdIbu5aYBtq5oZqTpqi9TER4lYPaxlpn+lm7Q7LpGcsxi2LhbyYzXSkvh0YKI
l9NxOlnVR/WCDiuL5ys1sEhTr3ZUX0Cb1tZq+ZmJYpbRlfBAxAsYMU/G6BwrBeUi
KtJSMm/iXHrlVslWpfZDT6fMebFVEwG0B+gLcG/7C26Us753WZZEhUW9SwYCecqy
NuDjxfw4/+d1sfNw5Vkk555iMlpdY47Y8/vzl3PuKP1Y9lnnIE9Ha5+OMR0VzaUh
2cjw+YbnlY1w15ZGUXci
=gMHw
-----END PGP SIGNATURE-----

--oFPc/E1qo/d29t+k--
