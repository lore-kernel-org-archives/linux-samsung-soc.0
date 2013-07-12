From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on
 Exynos5420
Date: Fri, 12 Jul 2013 09:49:32 +0100
Message-ID: <20130712084932.GY24508@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
 <29860116.IF545KsGYb@thinkpad>
 <20130711112023.GM24508@sirena.org.uk>
 <2214161.FSfscAvpna@thinkpad>
 <20130711130139.GQ24508@sirena.org.uk>
 <CAAgF-BdM4jw0o4+ELVo_N029tbgMJBBqJxU91e=TgBNiiREyaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0786ZyFfTSxuegBe"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:33878 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757211Ab3GLJNZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jul 2013 05:13:25 -0400
Content-Disposition: inline
In-Reply-To: <CAAgF-BdM4jw0o4+ELVo_N029tbgMJBBqJxU91e=TgBNiiREyaA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org


--0786ZyFfTSxuegBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2013 at 10:07:22AM +0530, Padma Venkat wrote:

> A new version number is added when a there was some change in the IP
> like adding a internal mux to the IP, adding multi channel support,
> adding reset control bit. This was done in the older code with
> platform device.
> Same thing is followed here. So as previously done, adding a new
> compatible name like "samsung,i2s-v6" with new quirk
> "samsung,supports-tdm" is okey?

Yes, this is good but the quirk should just be found by software based
on the compatible string rather than in the DT.

--0786ZyFfTSxuegBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR38MTAAoJELSic+t+oim9CUIP/2eBnv3SeQASWChUKiKz/a1t
7XmEwmzlLDg2O1+VG29JSHI4qhHXL6GsMJ7iSmv1f7cjgmkHL3rIhp1bDt9K5hUr
r48/uLB7A1CNa0p1CS0xDKSaZxCIOBSUmqMpVqQ+9nqzKE36EMMtfnQpwc7j38dk
Uh3N+IwwYo0qZijzedmOKXVU/V0NBYP5JIMRLL5THjv7cZuEeIwVpWEbe7Fs2FU6
CDT/KfVia+0PoroLGV1iT9oaV7h9OrEWdb25F56ZX//HdqnPWIARu33gep8FoOO7
wZPopkpRO+aFccNJwnakawSObBvnbvvxgJ9QVq5AwG61HQ4Li+yl2yVCsGBftMVX
boQy474bnwoW8FlOTwayXegBxG2jksU4ple32vCJv7nBPCgcA4LI7vXCUnH8pUOh
OPrBAlpoStr43jIzmKqDAZuAoz0T41qB5l2TNkdxcL02WDaKVFvQ+cfFgciy3Fbs
xKmTHtQyiUbcMJreW3Kvch9coLyoa4DJQJtpJ1dOf/7hwc2Rmw02qAaTZSGNM07m
fd4eml107S6Cny6HISIPAMingRpyIcu89rq5gth/IHa5NsGVLomC7IHBtQc0pv2k
YjkXLu6XDJfOhhQJXgmFCDXAQTuad5a/hiGc6hlbtlaVHzcH+rOWDh6aveOBlPBw
8DEKv05l958sQ8UEYvas
=UftO
-----END PGP SIGNATURE-----

--0786ZyFfTSxuegBe--
