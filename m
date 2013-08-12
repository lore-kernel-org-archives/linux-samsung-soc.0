From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 1/4] ARM: dts: exynos5420: add i2s controllers
Date: Mon, 12 Aug 2013 14:12:36 +0100
Message-ID: <20130812131235.GX6427@sirena.org.uk>
References: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
 <21180092.af8YMiXtjc@amdc1227>
 <20130812113447.GW6427@sirena.org.uk>
 <3916118.YsNJ4NTaJS@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iuErhZXXTDqxrbLV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50792 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756204Ab3HLNND (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 09:13:03 -0400
Content-Disposition: inline
In-Reply-To: <3916118.YsNJ4NTaJS@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org


--iuErhZXXTDqxrbLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 01:41:23PM +0200, Tomasz Figa wrote:
> On Monday 12 of August 2013 12:34:48 Mark Brown wrote:

> > I'd expect that to interact badly with the pinmuxing - unless the device
> > is disabled it'll try to grab its pins on probe which is not going to be
> > a good idea unless it is actually wired up for use in the system.  Or is
> > there some other mechanism for handling that?

> Ah, good point. Now I wonder whether pinctrl nodes shouldn't be considere=
d=20
> board-specific and specified in board-level dts instead?

It seems a bit cleaner to use the current mechanism in that it stops the
device appearing at all and hence repeated efforts to probe, plus a
simple enable is less error prone, the way these SoCs are designed you
don't have to pick which pinmux is in use for most of the IPs.  Where
there are multiple options it does seem like a good approach though.

Tastes may differ though.

--iuErhZXXTDqxrbLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCN9AAAoJELSic+t+oim9oNYP/Rwmgv/wJbEGemD8vFcM2b+Y
ap33udideatCfv5QAkaG/emt7oMhFN6jSbHT4fa4eHtkt8xSIE/nfs4VyxVsutZr
9ycs8iMNBRpRrxiZ5Dx1tUgjUqEYY+4+63/Hq7w9Q+xCczbB82Ah+ZhQVKE4i2Ws
9+hAxbLQrKlG+SI3/0DB/KCLLAKjR+pUCQeA1chTqSl9uk5egw6jmDKx6lhhHcl3
19USWeuQtHpG7mxxuS3Mz1QCAJSUAAQfWxUnWj9ZEj7ZNgBW8MKSU43EIhZ3Vw59
tMYu1Woms696/I4E7i+5mjmbtxNKQs9aT0RCN/nViYlv8tKA0ReJHw9lVKrAWmvi
6RnpX0vWVT7oK0YiabXVOWykynU2wNjfboYx2eYXcwmGhjmp0Ixlic6JVfipWapu
zmyXfbumuE0hyOGcwbS9+NhT/OMkr2XzxGrcFUzfBhZJxtkD5HS3++3GvrXfinBH
eNyu8VnWrJL+p/TMnGKfJXFkImzI7d9HdhNvqp2dyyH9/ci1lP6Q9XfGuEGqkHqQ
0xkUczwc0KEc513wUcCru/HZu0KiKXIc3PJQKzoZPag7t7WSzZL1Nv9ogR9lmQH4
Uqytywz8zGlhQeaFhAlcCOHr14F8OjbMl0gAPT8m5h40OfHmIt8246cbqi03JqDm
UM3PgiyX3brWb/SDlC9J
=2hXy
-----END PGP SIGNATURE-----

--iuErhZXXTDqxrbLV--
