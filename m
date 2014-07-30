From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Wed, 30 Jul 2014 16:36:20 +0200
Message-ID: <20140730143619.GA1345@ulmo>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo>
 <53C87D2F.9000906@samsung.com>
 <53CCD5A8.6090406@samsung.com>
 <20140721091917.GK8843@ulmo>
 <53CCF70A.5010403@samsung.com>
 <53CDDD61.6000005@samsung.com>
 <20140722074935.GC18258@ulmo>
 <53D8F6B5.4090903@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:56737 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834AbaG3Og0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 10:36:26 -0400
Content-Disposition: inline
In-Reply-To: <53D8F6B5.4090903@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Paul Mundt <paul.mundt@gmail.com>, Imre Deak <imre.deak@intel.com>


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 04:44:21PM +0300, Tomi Valkeinen wrote:
> On 22/07/14 10:49, Thierry Reding wrote:
>=20
> > But what I was trying to say is that if the Read IDs command isn't an
> > official DCS command, maybe it would be a better idea to use the DDB
> > instead. I assume that even if it isn't the same information it would
> > at least be a superset and therefore a suitable replacement.
>=20
> Only if DDB commands work on that panel =3D). Even if a panel supports
> DCS, it doesn't mean it supports all the commands.

Indeed. I was perhaps a little na=C3=AFve and assumed this was such a great
standard command that every panel simply had to support it. But so far
I haven't yet come across a single panel that does...

> Also, does it really matter which one to use inside a panel driver? I
> don't really see any pros nor cons with either option. Except, of
> course, if using one of those makes the driver's code simpler.

Yeah, at this point I don't see why the read IDs command shouldn't be
used. It's somewhat unfortunate that it isn't mentioned in the DCS
specification at all, but specifications are only as useful to the
degree that they get implemented...

My hope had been that we would be able to automatically probe for panels
using the DDB, but it seems like that's not a practicable idea given the
almost non-existent support for it.

So as long as we can standardize on common APIs rather than per-driver
implementations, I'm good.

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2QLjAAoJEN0jrNd/PrOhGQEQAI4XFatbODIwvTeSGtgFoUqM
OZZmxyva4Wk+A6iRdCUDFiMBB3vqLbWSmNdAjwixYod3qn+KwTsqlnqPLTZLTBKS
O4+GBbpTl0aKOG2oZv4+99SsH/shBy7UDbgjpC1SVGkZDOh+LZC1v4+C8ZLIZbZh
xjmKoKMxGTxWd5veXbI1YYyE8XNZv6fN6wXIsh82FEU5vSPk5OMpoYACqDywOurJ
bmnLpim6GWbU1g8pyxoeNvPJs8jwkdyBJFvCcbo5F8Ow46cAVh5FlRiE/6TUm9g/
tHUUgh6QJiLxq8iFlFM8/DvEWue8UJsNjZcnrtvm47uTL5a4oPUJgwtfjCOyBK0g
18olXm9z9RDDGrGEFXaHmlzA9BpK2hSwQvEau4AZP5R4B9qQfgGqjPcBAhm4TNIM
q9S9rqvL2ALLSPsdvx5T+jP4iQLqDVr9Pv2eLkiWRC4K8B+5jnsUzoaC/WBQ7TV2
tPQ7jW79g78xren2lz6wn/MhvX9cVrcU0CGxPDzwzuCwu2mJFNVgvSa9MeH4iQTX
C7m8MpirZNIKsDSOfLcGszuVKaUSAWf5HB4jzZbNCnnS2KD7QePdk+Nt6D6RzEQL
G03vMyus/4DGC9jn0j5uSC6tUDRvgU30kFnKBLU8R7FRAOcBLDzRtTNXww+7uFGz
zHomiB5svCtqBN8d8D7K
=LdrU
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
