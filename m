From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Consolidate SRAM bindings from all
 vendors
Date: Thu, 22 Oct 2015 15:34:47 +0200
Message-ID: <20151022133447.GZ10947@lukather>
References: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
 <20151022090529.GV10947@lukather>
 <5628AA23.5070608@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f8lmXUvqnCdFQPaI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5628AA23.5070608@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-samsung-soc@vger.kernel.org


--f8lmXUvqnCdFQPaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 06:19:31PM +0900, Krzysztof Kozlowski wrote:
> On 22.10.2015 18:05, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Oct 22, 2015 at 10:25:28AM +0900, Krzysztof Kozlowski wrote:
> >> SRAM bindings for various SoCs, using the mmio-sram genalloc
> >> API, are spread over different places - per SoC vendor. Since all of
> >> these are quite similar (they depend on mmio-sram) move them to a comm=
on
> >> place.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> Cc: Heiko Stuebner <heiko@sntech.de>
> >> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> Cc: Chen-Yu Tsai <wens@csie.org>
> >> Cc: Kukjin Kim <kgene@kernel.org>
> >> Suggested-by: Rob Herring <robh+dt@kernel.org>
> >>
> >> ---
> >>
> >> Changes since v1:
> >> 1. New patch. Extended suggestion from Rob.
> >> ---
> >>  .../bindings/{arm/rockchip/pmu-sram.txt =3D> sram/rockchip-pmu-sram.t=
xt}    | 0
> >>  .../bindings/{arm/rockchip/smp-sram.txt =3D> sram/rockchip-smp-sram.t=
xt}    | 0
> >>  .../bindings/{arm/exynos/smp-sysram.txt =3D> sram/samsung-sram.txt}  =
       | 0
> >>  Documentation/devicetree/bindings/{misc =3D> sram}/sram.txt          =
       | 0
> >>  .../devicetree/bindings/{soc/sunxi/sram.txt =3D> sram/sunxi-sram.txt}=
       | 0
> >>  5 files changed, 0 insertions(+), 0 deletions(-)
> >>  rename Documentation/devicetree/bindings/{arm/rockchip/pmu-sram.txt =
=3D> sram/rockchip-pmu-sram.txt} (100%)
> >>  rename Documentation/devicetree/bindings/{arm/rockchip/smp-sram.txt =
=3D> sram/rockchip-smp-sram.txt} (100%)
> >>  rename Documentation/devicetree/bindings/{arm/exynos/smp-sysram.txt =
=3D> sram/samsung-sram.txt} (100%)
> >>  rename Documentation/devicetree/bindings/{misc =3D> sram}/sram.txt (1=
00%)
> >>  rename Documentation/devicetree/bindings/{soc/sunxi/sram.txt =3D> sra=
m/sunxi-sram.txt} (100%)
> >=20
> > I'm not sure about that one. The SRAM bindins we have for sunxi is for
> > an SRAM controller, that maps the SRAM either to the CPU or to the
> > devices.
> >=20
> > It's not really related to the other users, and wouldn't it be
> > confusing to have a driver in drivers/soc, and a Documentation in
> > another sub-directory?
>=20
> I guess the only relation to other users is the "mmio-sram". In the same
> time this is still similar to e.g. Samsung's sram bindings (where the
> memory is mapped to CPU only).
>=20
> Being located in drivers/soc is not an issue here - code for other
> vendors may be moved there as well in the future.
>=20
> Of course I do not insist. Actually Rob's comment was only about moving
> sram.txt and Samsung's sram to common place.
>=20
> Anyway I will be sending v3 of these because while looking more
> carefully I found hard-coded paths to bindings/misc/sram.txt. I'll fix
> it in next version.

I didn't really have the context. If Rob feels like we should do that,
then go ahead.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--f8lmXUvqnCdFQPaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWKOX3AAoJEBx+YmzsjxAggIgP/iBRI8a2YT4JxpscEhidRCuH
bSsgvwZFt/RryoU8cs44payOvJPooBK3Whe6vm+IZ+zjTusznHOt4Um8hkovFv1u
kgn1dA2x3UYSufvA6rdcdJI2XL3DOD37DSyhodYf6mpTHukoeqDViNxSixtbA/OW
OOGyIzyC6QxzcPwffpUrCmB2kAZoacIo4wWu9pYbrCNwRmnBVm6XEKVFm65QB50E
tdnX68g0DLfGV59FqJsBvU/4X1igiUe8uL/6FiHgD3RaURVmN7K7macMMahYQjhj
1yRh8PPJaptBr8jvcEuArDNPSLRtoBKyVZzWXL6cG/g7uVzxF11sDYHRgF/LnCLx
W+KGim4iJvVJPfr/RIFyYUH3CEo+b8YmEI9TiQVh/faAowBEoff3ik31G6ySAi/S
Ky7QRS+5Dm0mllME+gbGzaVuQCvBlxRgHuuQlxabWEGq69tyg89qh9H1Xpq9ndWp
Az8PfyK1Z+vE6ayALDg3XvO6cFD0MfrBOxYOHLGA7QtUCqquJ97exv+fkPpFnOSo
1UM27tyBj81KmiSMEtjcgjH0ZcMrdYyG0oZOUc3EwQGPi6npWqbS6VCG+o2SKvS1
FBnhLaBCZzFtwFi9tgHy6dFY7cSf6u2uxCKTtm6fZ6fqXY+Sjy2WKhoX5v7K7h/R
JKPxxSsQlPACPaXc/yAk
=9Un3
-----END PGP SIGNATURE-----

--f8lmXUvqnCdFQPaI--
