From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 00/12] ARM: samsung-time: Prepare for multiplatform
 support
Date: Thu, 28 Mar 2013 13:02:42 +0000
Message-ID: <20130328130242.GZ18316@opensource.wolfsonmicro.com>
References: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b93tKFax9ARJHhqA"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54265 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754669Ab3C1NCp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Mar 2013 09:02:45 -0400
Content-Disposition: inline
In-Reply-To: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Rob Herring <robherring2@gmail.com>, Arnd Bergmann <arnd@arndb.de>


--b93tKFax9ARJHhqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 09:23:09PM +0100, Tomasz Figa wrote:
> This series is an attempt to make the samsung-time clocksource driver rea=
dy
> for multiplatform kernels. It moves the driver to drivers/clocksource, cl=
eans
> it up from uses of static platform-specific definitions, simplifies timer
> interrupt handling and adds Device Tree support.
>=20
> Tested on a Tiny6410 board (Mini6410-compatible) both with and without De=
vicee
> Tree (with my DT patches for S3C64xx). Compile tested for other related S=
oCs.

With current -next this seems to break my s3c64xx based system in a
non-DT configuration - this may be due to other work on the clocksources
in -next, I've not really made much effort to investigate.

--b93tKFax9ARJHhqA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRVD9PAAoJELSic+t+oim94TIP/ib5Klqg8Raub+QgysMOoxjk
4ZE3Rl9EJTkl1S6bEVlB0FplQzYA7HGZE0XXa6zk8PNGkGokTQFEJ5/gg8hqNgsA
gbJDuG1IIygmJNOLnDdXV+R3zAR0lW8lA924bEP/DNG3hjevm4IRn70iNNAIR+s9
jcIquMROqpbvKAvDibpCk4TONHXGgnTVO+2uhCjgSdrZWiAZrJRWXB7eAhzDr89H
IV9zwZzfPIPawMmeb6SKQjM7bOR/Gzxpi1BmFKnCtp8QLo4W+rzHliC97bAorkLV
en7Qv9x95mm/agIA5ms1wMECc1IRRVnMrQIoDuoTMUjG3oodFsm8dAqgsWE3gWPW
wQN/c/h3CfANT+cZ8yA9RO6HB3tznJ5LF2bGd42hnLb2mto/gYvPv6y4owQGZjVV
CbMTvdnZqKD2iayiisFhjd/N01ZqxgYjqZ1+kAzLfw2mU4nwCtdQb7z8HT+nIrZd
F4xTgeUT2cY6tD9PdyibvkeRqtrwrtVfbRugQOAKXUvqrdtbVOSvXlie2ryVttrM
FVy/Td6/3DI2tUOSGlT8QhyKfYwe7RUFm9dBjh75+OjoWUsmDR9NMM9gTbRrfrva
bS7T07LSz0nTZclVKQgf4qhS+wzZZmN8dOU7CVavSDV/mIXZc0r9c0FL/LVSwdRG
wSKvvDUbIEB7oM5pCWl5
=P+7y
-----END PGP SIGNATURE-----

--b93tKFax9ARJHhqA--
