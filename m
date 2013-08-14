From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 0/4] Add i2s support on smdk5420
Date: Wed, 14 Aug 2013 11:03:14 +0100
Message-ID: <20130814100314.GN6427@sirena.org.uk>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
 <20130813124440.GX6427@sirena.org.uk>
 <6538092.D4LPomiMyc@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="86KltPKNp6kAaMsY"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57589 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752411Ab3HNKDS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 06:03:18 -0400
Content-Disposition: inline
In-Reply-To: <6538092.D4LPomiMyc@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, abrestic@chromium.org


--86KltPKNp6kAaMsY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 10:25:27AM +0200, Tomasz Figa wrote:

> Hmm, this series looks good to me too, except one thing. What about the=
=20
> bisection breakage introduced by the hole between patches 1/4 and 4/4=20
> (after the list of supported compatible changes in the driver and before=
=20
> respective dts files are updated)?

It's annoying but relatively localised and obvious rather than the cross
tree stuff that happens so frequently with these platforms.

--86KltPKNp6kAaMsY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC1XfAAoJELSic+t+oim9HigP/3U0AAYx96EfIyyY2RZMP54U
rb68TaV2TTOxrLn+odRbmsRbUGJC2D8W4LheOxenJ6biqG7dMD5TEwR/5ddyDmZI
rFCgBvGRy8ylZabbRScMZP3TQkPoMmXW4EAwOJJ5nynqjgeeUpHkft6mzyLo6bXK
6oKw3FDO7v9Ty3HPsWDAQ81WZ8p8ULjHZ+6cKdt2EKL+IhhIRqejmrDPQ0zZeL9c
ltM9Jufg4/XgWXdkRlLev5hrNQUggMY6sygw272Jgav0PA20z8ppgzHL6vysHJfj
3fSuakT4HO9hh9nbV+CuWEqk8ZjXWDRKO0BS1qSnSlXTOta6bo9vAIPn4eD5kr0O
GSW5HFhyIZoDXBUmqXlBbqA/OiiGx0iD7D8xJWEytIra82ZXA/5H4ScyoeUSLqZs
8uzQegDRcmkl0vWDih/iXr/TdvYWToveX/VNMDu6JmCDqNOLxuW0nQDriykxW8CQ
QHMlwudzvOqieTKv0JE5M75aMNZx02HuAmkxagUVVTQi7EUtzHi0oC2AACPJ1kAr
UnLNXVO66ZcuS3NC9Di8IL7t5duP41dsX3qXEOre/165BKwizM3C8fM5rK5PktA4
Pf7eVNCAWYWu3OETbCAnAAK/ZBj2uxqF4JSWVog3MPPAE7DrkUKUGgEpm52R9U2w
NJshjqfA6FqExHFWn/bv
=cd85
-----END PGP SIGNATURE-----

--86KltPKNp6kAaMsY--
