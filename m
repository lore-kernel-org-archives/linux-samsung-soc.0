From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: Leave Exynos5250 SPI controller disabled
 by default
Date: Thu, 12 Sep 2013 21:00:31 +0100
Message-ID: <20130912200031.GV29403@sirena.org.uk>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <10382663.35TJtu8bGt@amdc1227>
 <20130912135028.GR29403@sirena.org.uk>
 <3266701.1laYrVSaLy@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UCRqqk9O1GohlXh8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3266701.1laYrVSaLy@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--UCRqqk9O1GohlXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 05:51:58PM +0200, Tomasz Figa wrote:
> On Thursday 12 of September 2013 14:50:28 Mark Brown wrote:

> > There are no SPI devices on that board (at least not ones that are
> > currently instantiated by the DT).

> I can see a bunch of nodes simply adding status =3D "disabled" in dts of=
=20
> arndale.

Meh, gone now.

--UCRqqk9O1GohlXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMh1cAAoJELSic+t+oim9ZSIP/RRu9FDThgw5axEIF6Vhy6X+
nPCfV7SIuCcss+gpvkMnr3BxiPNSuQvBjR4AylxFeBmQmoTXczDrX0rMNHiwdfTn
P04jAoAN1LIi7ZxjXgBK+OvGVN29FAkzteWvui9gY0RXqJjYwz9zx72mlU+/Ik/o
R4bJJwQqdCw+h0ylkgtKs9V9KfKCH5DujpHQ4FVF1l6knkUYdxh5NlHC0AdTUibF
LJLCp3e46V76LpuqJg7UyS43i3tZ52yTf6aOnrtRhLRazX1JO1zCXUBw30UvvZD7
sD6mDiQGLrQp2nmG6xs3RVQc68rI9Wn9NoxSyXSYI6KmVrskr1ZR+dW6aJvKcHc0
py6q9xvmAqwehQTJZNW/CoePsmsK1bqC/KNcn1VBzK6udrWLo6X3OViSDlQbHa0x
X6GfPMxNV4ibiKfWdEsE+c2o30/UWCm8H8gMozKbtCHcl2yc6NR4z4jt19c3RrQw
C8MxkW1R/iaqlKbtr/1ke2C9NXF9+QqP+Qf2OlhcUQH2RaizZuK6d3z2iOvr+D4J
pqQBd6HyaI8QGfiBL+jSI8QhulSkh9d67X0lEFgFxjBJHpIS3WZ+o++3g23cc5yV
NToXJnbI4jYFm7aDZJRnJtPeAJOV3ja2FczvJABT6PhCe1kcK9zSG+rvlnuL5fRF
KmDwjG6uJHE0QRvJJvaP
=axC3
-----END PGP SIGNATURE-----

--UCRqqk9O1GohlXh8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
