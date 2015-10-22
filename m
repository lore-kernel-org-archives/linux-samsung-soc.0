From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Consolidate SRAM bindings from all
 vendors
Date: Thu, 22 Oct 2015 11:05:29 +0200
Message-ID: <20151022090529.GV10947@lukather>
References: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mmR5Tf+WJGm+vTLg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-samsung-soc@vger.kernel.org


--mmR5Tf+WJGm+vTLg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 22, 2015 at 10:25:28AM +0900, Krzysztof Kozlowski wrote:
> SRAM bindings for various SoCs, using the mmio-sram genalloc
> API, are spread over different places - per SoC vendor. Since all of
> these are quite similar (they depend on mmio-sram) move them to a common
> place.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
>=20
> ---
>=20
> Changes since v1:
> 1. New patch. Extended suggestion from Rob.
> ---
>  .../bindings/{arm/rockchip/pmu-sram.txt =3D> sram/rockchip-pmu-sram.txt}=
    | 0
>  .../bindings/{arm/rockchip/smp-sram.txt =3D> sram/rockchip-smp-sram.txt}=
    | 0
>  .../bindings/{arm/exynos/smp-sysram.txt =3D> sram/samsung-sram.txt}     =
    | 0
>  Documentation/devicetree/bindings/{misc =3D> sram}/sram.txt             =
    | 0
>  .../devicetree/bindings/{soc/sunxi/sram.txt =3D> sram/sunxi-sram.txt}   =
    | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/rockchip/pmu-sram.txt =3D>=
 sram/rockchip-pmu-sram.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm/rockchip/smp-sram.txt =3D>=
 sram/rockchip-smp-sram.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm/exynos/smp-sysram.txt =3D>=
 sram/samsung-sram.txt} (100%)
>  rename Documentation/devicetree/bindings/{misc =3D> sram}/sram.txt (100%)
>  rename Documentation/devicetree/bindings/{soc/sunxi/sram.txt =3D> sram/s=
unxi-sram.txt} (100%)

I'm not sure about that one. The SRAM bindins we have for sunxi is for
an SRAM controller, that maps the SRAM either to the CPU or to the
devices.

It's not really related to the other users, and wouldn't it be
confusing to have a driver in drivers/soc, and a Documentation in
another sub-directory?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mmR5Tf+WJGm+vTLg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWKKbZAAoJEBx+YmzsjxAgh0MQALJ3m+d9NKx2tzreFdUkfIHJ
A1RQhXCxWoTFWk9NBG/qvehbXAXKGm35ByTEeOmz6Pkou8Qn8qyJbahHgEtk5YYo
uaadn3RNfiPDuggW1YnUAL8ofy/t225U0wijAIXtGD+SodHHeYE73wtR1y+D4/rK
FlubMxEwnelpLoMw6bQ/qeL75v0paqP990/sbN+ZC4U2ra9BNRaQqjCTNEPuE6pw
Bvarh1syydioK8FFzCN2egf7FQHDXkZUZ1fUWnvh2ClDdLNbOjYJ2TS+NrgjkpqP
eQIEmzgfLwybNdPmkPMYc2lLqKB7o2jG4ht8MrpTY4joknHA9b6sHRXgA8ER9kA7
KlAEPbDRlFsfzi6J9MDr+aqfECFN4Tx4Cs1n0CB44qykYdrELYt1AYSbAIYpDctt
GMS4EimekVB71XyuCOC/BKkTad3lnJcogzwQVyCU5aok+rsx+P/U67NNZ587MJLl
Uf3Xii26a1r8gVfAsnMbFbT9PKrsO6RAcdI/LTBv0DcjZxYP2TvWkkVFEanFFduu
0XC1rI5MGgo5lXcnXixLBSnuM6345h90PU05EYKKo9eVQJ/ttmJNN4vx2miBZVfO
JErxNS5VXMYpwPT9MBR0ArJoEaVfZNOJf+hG5nFMAKM49UhWqoa/Pg0M43L6Ukso
56Nn6i/OwdvfpQM5QJPB
=VBxb
-----END PGP SIGNATURE-----

--mmR5Tf+WJGm+vTLg--
