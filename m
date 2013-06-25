From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/4] usb: gadget: s3c-hsotg: Allow driver instantiation
 using device tree
Date: Tue, 25 Jun 2013 23:46:32 +0300
Message-ID: <20130625204632.GB9748@arwen.pp.htv.fi>
References: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
 <1372174706-5459-2-git-send-email-t.figa@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:60975 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753029Ab3FYUrJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 16:47:09 -0400
Content-Disposition: inline
In-Reply-To: <1372174706-5459-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, m.szyprowski@samsung.com, l.majewski@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 05:38:23PM +0200, Tomasz Figa wrote:
> This patch adds OF match table to the driver to allow instantiating it
> using device tree.
>=20
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

when will this driver get merged into dwc2 ?

--=20
balbi

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRygGnAAoJEIaOsuA1yqRE1rAP/2uhYD8P2bfGDzpHX/Cv0mxY
82f/Oti3a3BGFrWwbKIdKbvloI9mYYoruKu4nIpuRXqbqtAoQ66/0hmm32sfh3N3
lUCLlCR95i4qwYpx5AFK2YiCxueMGh3p1e1GGpKyuImTsC9TUKxIyRC0Pw7JnTpI
SILKH/z50SW6LKZR7jBPIQCnqBXqmoNVBPXpJcz3aMUjQU+npxiMjOsqv6kQ3y2C
JewA9P+dhZ5LnryIVe+kvHz7dNkD0TmmQK3TDdbJQxW8QoWswMYwTXs3Rq55XpgA
/M1CUU8qIpKq9lejz6I1j7XCuGmRT0uNkbWzWZESGWVntrUk2dg9F2OhCU7Niv/Z
w/O+BOrlTIE5IyYZ8ferDsTJLiUpKhCC96fk/I+n3Hrmq6Fj4k9wr/vSR9Ppxgl7
u2qhzUHpIwCyumx1L1CTijMY6uqrPwBG1CfOQfevGNfVtX3Gi/rpaQu8yoSOCRwW
uoCMg3j99rxEH/BrgvmKpTJat9eNPK+rygcOmCBPIDEOAR71yWtdSVC0tqcUI1Aq
FwFeYDCr3N9TrPAdXYU9slvdS0KR8srnRsP6hrUtA3GBlA0+NJjeETHnPJxL/Ub9
f6SpLXeRUczQgauy8ppHKpnc/lW+ZN5ek1KFEhX7KW6QFDDsybvKE0034Bhy5pgl
T85MMzxAnruMtD77JSmh
=JeRy
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
