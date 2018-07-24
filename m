From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 09/10] drm/vc4: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 24 Jul 2018 08:57:20 +0200
Message-ID: <20180724065720.5bhepamdo57it7nl@flea>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-10-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0963760892=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180720211509.23605-10-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0963760892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvhirj2j5trp26z6"
Content-Disposition: inline


--cvhirj2j5trp26z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2018 at 10:15:08PM +0100, Alexandru Gheorghe wrote:
> Signed-off-by: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_pl=
ane.c
> index 9d7a36f148cf..688ad9bb0f08 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -200,9 +200,7 @@ static void vc4_plane_reset(struct drm_plane *plane)
>  	if (!vc4_state)
>  		return;
> =20
> -	plane->state =3D &vc4_state->base;
> -	plane->state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> -	vc4_state->base.plane =3D plane;
> +	__drm_atomic_helper_plane_reset(plane, &vc4_state->base);

For vc4, rcar-du, atmel-hlcdc and sun4i, you're changing the reset
value of alpha from DRM_BLEND_ALPHA_OPAQUE to
plane->alpha_property->values[1].

This might or might not be a good idea, but you should definitely
explain why.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--cvhirj2j5trp26z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltWzc8ACgkQ0rTAlCFN
r3QS4RAAiVkxB3H5zyJEG8yfdoboO1qjAaK1uHFKuDq2DyHi3LWOfZI5YpUiH+LQ
6Q8PTuTCWwmToz1g8ioJHvpCmmOMXFMW/wKN4kB9k4Imi2Hr4FHVz97iupHApWFk
+FY45s5KKSdrEizk8Re49VzK0W+DDznqDlOsBexhtNXR3canrScVHkRmBaf9s6jt
B4VLXY+qXo0RRwfZEiEFR0lrlo8vTtTf7C1Gk2jsmfR34B9iSplO0RM8v+uCSicX
PAp4ILmbsc/W7dhJ8LJb77bzWpSUipnf8JGqaRWigl4KxnFeIqklTF0aqudY7Ogz
jDAfmKwbjxuIuQWxqTD+Wt4d/r6QLsbZ/sQi5L+ea0Nk3r7LDwat5vySYtwcs9TH
JtIrnLu+hrF6ZNqsnAtz1ALd4nwZczXPv/glZCTDordBhjjKd6RsrmjDQ4ccv2jH
Sz2UitFA/uZ4p6Bsfu8VjkAwbCPLSMaKkkPzA1W23bmrYgJnw/LtZORtk+LJzwmk
S7I2xGJEXX93OkJoLgs/EPjFSFGnrzUZOgfMFTzLwQXuE4BBW79CJD3n2ejOfdaA
DgoSMakDJpY/6nXfGQOFvDiGubYaC85ZJZKEWymInEdi3Lyoi7B3jNK7LzNFEMiC
nuw/0IEtKX5rxvqUb9NS3WzTDR5DhBMMu+lqo0+EG9GeIbaNG18=
=wvmf
-----END PGP SIGNATURE-----

--cvhirj2j5trp26z6--

--===============0963760892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0963760892==--
