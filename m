From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 5/6] ASoC: samsung: Extend Snow driver to support max98089
Date: Thu, 19 Feb 2015 13:33:18 +0100
Message-ID: <54E5D80E.3020603@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de> <1424283959-16289-6-git-send-email-afaerber@suse.de> <20150219094425.GB3198@finisterre.sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="lKOTFdijtkiooW8AcOLRrPhUJNvokiIlE"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42178 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753182AbbBSMdf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Feb 2015 07:33:35 -0500
In-Reply-To: <20150219094425.GB3198@finisterre.sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lKOTFdijtkiooW8AcOLRrPhUJNvokiIlE
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 19.02.2015 um 10:44 schrieb Mark Brown:
> On Wed, Feb 18, 2015 at 07:25:58PM +0100, Andreas F=E4rber wrote:
>=20
>>  static const struct of_device_id snow_of_match[] =3D {
>> +	{ .compatible =3D "google,snow-audio-max98089", },
>>  	{ .compatible =3D "google,snow-audio-max98090", },
>>  	{ .compatible =3D "google,snow-audio-max98091", },
>>  	{ .compatible =3D "google,snow-audio-max98095", },
>=20
> Since we completely ignore the CODEC in the property might it not be
> better to just add a plain old snow-audio compatible and bind to that,
> that way we don't need these driver updates?  Just the "snow" bit shoul=
d
> be enough to know it's one of this class of machines.

Personally I don't mind either way, but I'd rather leave that decision
to Google/Samsung people.

With all those Tegra and Rockchip based Chromebooks popping up, are
there any further Exynos based Chromebooks planned using this driver, or
is it the last of its kind?

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Jennifer Guild, Dilip Upmanyu,
Graham Norton; HRB 21284 (AG N=FCrnberg)


--lKOTFdijtkiooW8AcOLRrPhUJNvokiIlE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU5dgSAAoJEPou0S0+fgE/9b0P/2Ne2RoN7dPo3pfXTeipNvC+
4d6TCO6bTVY461z/47+OaaTkWWcY70Olj9TnB26ls+IKf+q0Uq+rghQlpjeSCEyL
71rbSaCIwwXCc55NEHjhulCvjxbffqj2MZbWNbyyIdm1YRdv9aVeXerH7GJAqpAU
BpwIiuMpqfiI4ahiArQXByser1oTy+3/GF2JiqdgfZ4qMWaRO7kYsPGu2odK3Rx/
03cOeWATHGxXq8YRrBk024+z8pmyKpLDUf8m1sVgDlAWlY4wCkYtLT1iGsW/Fq44
hYhrXxyv2MOBFefF1IjEU73nb5GjkyuSj2OvBKAatMyNizM9rZGf8edJ9tMICi8r
U6tYpP1I9bc1+k32tZ+ooZWyVOucmIv8MKD/OJAOr181+IDFCGxBpvH5bCo90o0q
SaXKxikYRxPLd20sbJtXjnyaKxrvY8pAyXRw17UtGvTI/nw6am+h1eJkWwnIOuaC
Qt6XtoM7KE2pVctOv34Mo0I2+2Psi6skgI+RMIhQF/aX7m0K6SryXhyglupqNIVm
SgxQPg+zbLuqrhLZWcY4XD5VLtxEdXq4DqUuZBNYUykBJKMqySP4EC8wbXyXta07
zrGVpksWH0sJWf5tzco4tVIzSgct5mIDp8yhFJ5UQj4OhARzvatmOg53qOoT/YGm
38JMRMcNlZkGuddFX+Dp
=AHH6
-----END PGP SIGNATURE-----

--lKOTFdijtkiooW8AcOLRrPhUJNvokiIlE--
