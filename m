From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: Add support for samsung s6e3ha2
 panel binding
Date: Thu, 6 Apr 2017 23:33:20 +0200
Message-ID: <20170406213320.GD27728@ulmo.ba.sec>
References: <1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308014258epcas5p3f1ae559dedf1d7561d2690d7777437db@epcas5p3.samsung.com>
 <1488937357-5623-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36128 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754410AbdDFVdX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Apr 2017 17:33:23 -0400
Content-Disposition: inline
In-Reply-To: <1488937357-5623-2-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, inki.dae@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 10:42:35AM +0900, Hoegeun Kwon wrote:
> The Samsung s6e3ha2 is a 5.7" 1440x2560 AMOLED panel connected
> using MIPI-DSI interfaces.
>=20
> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/panel/samsung,s6e3ha2.txt     | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsu=
ng,s6e3ha2.txt

Applied, thanks.

Thierry

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljmtCAACgkQ3SOs138+
s6HbuQ/9FBUa2pQdL96OZViBp9A7ldsH55I79P/+2B+FqV7XNdsrquyyWWNfembC
+UNrHwctpKaWpoClX1CJFDKowslUmq20s2u7TMn0KXDKFKikF7TlFwpbP1AgOcxW
l0e3KOCm+p2H1a7pP2ufd1mDkJ7JBYBUNYxfw7ffJOqrUxe5ad39XqV2J8AlaYp/
a/nQ0Kpq7I6IhI2CJ/1CnT7U/VfasvMZl4tuYK461U0BNOCeE3uGQoLZ4pJMK7Ds
EEvWRtTjqk7XrpZSd4/NGQn72K9XuB6bxJtzXmciWKtnDLENCwDaiIu+EMNVhmGR
WJmZCNA7r6P80oANGA/g2FbFBBVWpF4aqZVZpVGQaEbqtMNOT4KN0GA0StliYRwk
2ftrR1ImJ/vQcOAeOSDmaHieRZB3Ho4l/6lbF058KbM6jUzxes3y/EHdwgplD+lh
/yaAQh7RniLlyfc4Aw4DJjFgzO7BQp6HJLzsIjR6OMiG4ccnFxAxOLyaeSzlFgYE
sXsx5UUedcjP07VmPKtrwZoWwLpXl6ZjC5PqyvDwpnlQCzDsUXyrSp1Yp4XNO3LP
O/u/RpwJksZhcrnTuPTIxiFiCmC8M5meuymG2PJE4ItWlXliGFKHBAx3pqnP59Ny
8Lt1cl/mmxXqwVzuWsWFuSTfVLxlaSanHHMErCYs+KD3Sn4SbNg=
=Q4u0
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
