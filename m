From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 8/9] drm/panel: simple: fix BOE/HV070WSA-100 timings
Date: Thu, 27 Sep 2018 13:51:58 +0200
Message-ID: <20180927115158.GA29102@ulmo>
References: <20180725154644.25412-1-a.hajda@samsung.com>
 <CGME20180725154703eucas1p1e07c626c26a574ab19a8c0d73eacc1c3@eucas1p1.samsung.com>
 <20180725154644.25412-9-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0959731856=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180725154644.25412-9-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Maciej Purski <m.purski@samsung.com>, linux-samsung-soc@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0959731856==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2018 at 05:46:43PM +0200, Andrzej Hajda wrote:
> Panel timings were taken from vendor code and are not fully correct - ref=
resh
> rate is about 50Hz instead of 60Hz. The patch fixes it.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlusxFwACgkQ3SOs138+
s6E0rQ//bKo38/rwPRLmDi94ugUsR8gPZzvx7LRG6eBkKQUnbLEM43+/J4r+HvMx
RQ+MzFjOXaeakZPUXx7tsFE+LtGt6PewlgFpAPN8QbGoUmYiS4WEJOwNvSA4vGOp
a3cCdhEYFRH1XUfiCBB/IRuOZcftpzUCMAOgmAyP9VjR5bjATEFDPOBMMNzHBvls
hIhyROr3OEfPyC8EoH2yiBgsOzxvhc/P0SWeNfxOyZFmVTpRizOmZVQpKvhQJBe3
08R0F9dOCgZ/eUYpXdP9i+hK2WhjT/O3sqTX3z7BdJDanj7BiUg1/sxOtb9yo3Sn
/YlzsQN5C/f5O7QCzsqVXIU/+tm+oO9AxxDfDl9L56tFLNrACotrFG9MXvv9ZE3n
zAPQtQw0GGa01Bmoi50Tip9Tf/2nHjh89iWO7sfzzER6Pl/a9LGtd2mpbnJrwhjj
3F+mMoK2lO2nK7sFbZsjjZMxRgFuXhKrIxAMWEBwyQ4H1zj9jaTlITRJJWePNf7F
4gI0B0P4FMmVjGwxEoEiYH4UY8qHX3lYCrz+ylX8garT+3DL98gaChp/L3vvwVBm
PHgb64yW4jZFXo6nFUxVGrN44+tjfLLImzIADwmZfMWQL1xKYNoqh9VHxBX0qu/N
qf9j5VZ4TmFd/jb4XiaxECysKYcGP0d8d7SVYp9n0o7zGGkoKos=
=mCbr
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--

--===============0959731856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0959731856==--
