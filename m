From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Consolidate SRAM bindings from all
 vendors
Date: Fri, 23 Oct 2015 08:06:26 +0200
Message-ID: <20151023060626.GF10947@lukather>
References: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ExIO7AL6tcaLjJBF"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:59366 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751735AbbJWGG2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Oct 2015 02:06:28 -0400
Content-Disposition: inline
In-Reply-To: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org


--ExIO7AL6tcaLjJBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 10:39:19AM +0900, Krzysztof Kozlowski wrote:
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

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ExIO7AL6tcaLjJBF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWKc5iAAoJEBx+YmzsjxAgc+gP/29kUZr7wgzjVzELbUk4l1P2
WCCi73QCiBOAGisd9Mw8OBYmMAiyLNKXyH6zrbHY8jio1oWE4ZIBC3POMcrTl95g
wn51ta1nIUSEz04pp5XYfUzcKENZQ6EGcHpSmR7TLN69GbY+KGHgu31exQD9wkqm
wFuVYMHnCATgaVPHg3WjDT8f44paiRKosLX4GLPiabbiUA+tBnZd6Up6ts6TB2xE
C8Bu9deLYs1LCXORNjTLuPRaNOai9uGdGXgx3jBMIGRBbtmUYWVH1anNgKEER6Yt
3zUJ+682unnEoLzh77RWfSP3sq2w5dEBSEyzbpFl1SY+gY7vFITmi6ifUXKodiex
2ybruOeOx91E/iG/SBXEGVSm/k7qv7D2gI4kKWYNBnDLZOUv1GaOdppqPCePDwtQ
gUYjqFdYydXHUC5bfbwyBlpZAGiZlnc/CA4sFOZ51DGHZbxMDtYPAc9pFX1K4GVQ
0AWN8gQkLhQBtz6g/qkVhEiVl49aWMBTUnNG7/Kv/Gs8AEweq1Gi7a4IElpsb1X0
aErMe8rJ12jaAO1dqpWB3l9aHFkF/NVvu0Dm0S0PzJxU/ogPkzual5YZwarcQckd
kwOAor4dwOTsUzLHPp9fAQi1iNSoS3uerhoMci1XMsdtvxOmYcPAg+mo/yKG2jIw
E2pLFtDPzG9jO/hYL+Ic
=u71Q
-----END PGP SIGNATURE-----

--ExIO7AL6tcaLjJBF--
