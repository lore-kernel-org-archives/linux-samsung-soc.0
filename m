From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] i2c: exynos5: Initialise Samsung High Speed I2C
 controller early
Date: Thu, 24 Apr 2014 17:25:58 +0100
Message-ID: <20140424162558.GB12304@sirena.org.uk>
References: <1398350916-885-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QeltdQgz4fvqE4Zk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398350916-885-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sjg@chromium.org, grundler@chromium.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--QeltdQgz4fvqE4Zk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 24, 2014 at 08:18:36PM +0530, Naveen Krishna Chatradhi wrote:
> This patch moves initialization code to subsys_initcall() to ensure
> that the i2c bus is available early so the regulators can be quickly
> probed and available for other devices on their probe() call.

> Such solution has been proposed by Mark Brown to fix the problem of
> the regulators not beeing available on the peripheral device probe():
> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-March/011971.html

What specifically is this needed for?  We *should* be able to use
deferred probe for most things, but I know that not all subsystems are
able to yet.

--QeltdQgz4fvqE4Zk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTWTsTAAoJELSic+t+oim9IEYP+gJK9puc8vR5pTCxJdPLCo4J
rnD+aSHJMTdoIaay5rqaH+ESsmTyskwLF5t8kLleaOa1lZSSaaxBJVJlx1wUnD7O
wy2quNT8Jxf1A1vvc6R4Pn4wxjlxgSmLhHQJ0wNi9TC7LsNUxglUsoIdE9htjkxy
vJrbNjbQtRYzCupDfbvV7IlBUg2LRwfZ9ZKGDRlQQBhAvAzYqsNRA3EGokpl16T/
slseb7kKzghCf0/UF4SPyzziCor9+vDSWSykEBuHzGapSgoK+MSa81BkrkZUnvog
FBeuGJvYh9RaYl0F0h2rK5NzNoVllPxGPAuHwKjcQV0At3G/Qf+zfZOVivpCDAig
oo+Xr8b2+IADofb8HNOrcfaHEm1ran1i38Kw6F6uy2I1XFJnWxBuv37fwgg31xiy
ZhqsUQyu5P0B3DGN1+PT9iSRzvXrg72klwwnOcPCMDKzV/vIM41nf+xCImZ004t1
o8UwiU54XMN01RiVGPVPhcaUxmgIfDkl8nzGFy+eJZCw5jKsQa0/NEmtQ+sZAhfl
5fG22Nfmz8oD9kU7aJhHL+sJdUZTSIlwJ85b3JNnMU+IOXiUrcAd/VBztEKiVomc
6u9UN5JeVGsdgsRtIzNpZ3r0M+SDFUO9brsguTqiL9lx6PBbHlTdDjNhr8OwpL8k
tpWZaCCPZP3o2S4ZasO8
=/VdO
-----END PGP SIGNATURE-----

--QeltdQgz4fvqE4Zk--
