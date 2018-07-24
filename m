From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 09/10] drm/vc4: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 24 Jul 2018 14:54:21 +0200
Message-ID: <20180724125421.zde2qtbeie5zkvpw@flea>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-10-alexandru-cosmin.gheorghe@arm.com>
 <20180724065720.5bhepamdo57it7nl@flea>
 <20180724081121.GA22689@e114479-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1285577391=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180724081121.GA22689@e114479-lin.cambridge.arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1285577391==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rceohzw64vwd2bjc"
Content-Disposition: inline


--rceohzw64vwd2bjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 09:11:21AM +0100, Alexandru-Cosmin Gheorghe wrote:
> Hi Maxime,
>=20
> On Tue, Jul 24, 2018 at 08:57:20AM +0200, Maxime Ripard wrote:
> > On Fri, Jul 20, 2018 at 10:15:08PM +0100, Alexandru Gheorghe wrote:
> > > Signed-off-by: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_plane.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc=
4_plane.c
> > > index 9d7a36f148cf..688ad9bb0f08 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_plane.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> > > @@ -200,9 +200,7 @@ static void vc4_plane_reset(struct drm_plane *pla=
ne)
> > >  	if (!vc4_state)
> > >  		return;
> > > =20
> > > -	plane->state =3D &vc4_state->base;
> > > -	plane->state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> > > -	vc4_state->base.plane =3D plane;
> > > +	__drm_atomic_helper_plane_reset(plane, &vc4_state->base);
> >=20
> > For vc4, rcar-du, atmel-hlcdc and sun4i, you're changing the reset
> > value of alpha from DRM_BLEND_ALPHA_OPAQUE to
> > plane->alpha_property->values[1].
>=20
> plane->alpha_property->values[1] holds the max value for alpha, and
> it's initialized by the core to DRM_BLEND_ALPHA_OPAQUE.
>=20
> >=20
> > This might or might not be a good idea, but you should definitely
> > explain why.
>=20
> Would a commit message suffice? Or do you have other ideas?

Yes, that would be enough.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--rceohzw64vwd2bjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltXIXwACgkQ0rTAlCFN
r3RBlA/9Hcn1N8RLw4MfVjUK4Deew2hMWOsQfIcvH6MiSSb+eOK3De+ahBz+iggB
6yPgRMhj9TN9iLItmVRNicqP9+OQSCc01c10F8G/KzHGhq44M2FGKc9kiOCJvCQ+
JN4BReBrXpCBKftXRdgfDemSyhOBJOec8QsMqWoNseqh9iWcSsKlkN1aDQXc+C4B
l2x1D9Ffi5Ge4xjXbAu6HrS7TR2jgGHlyPonKCIejxzbCIerldSiM0AQdByTzMNa
rjwOEbxZnINf1d2+IYEYhcPP6RKpWB9YQRa6nPDVmx2i/eD8zxg7uhR6YqK6o/dN
Vy+WU1pcMqCgoCITizPnjCn8sIyWMZi/YC4MMsNFSjnXfIWDZ2VIsRUR2qLLabJx
IoSnZxRtwyL+MU0VszFpTXnTIVE3NW8TjcZ9wzdwT9aOIIRc/SHzHqzkpEIu4iO7
StLAX+p0bcyvrL5SmfuEi/HHA3D6Q4BIjvfMuvILnXRoHwkWjbk58U3XHoJ/ZesH
dLmfyHWz6+Q45PD+bCKfKrKK0gmLwJzVMqRVQblESpmVDgcElGsnp1/6enbeEC4y
7HB6DCbXfmWhuiF2QeAqkEcEtZCnnB5wwTHNi6hTb0aybwcpE/W1NCgQX/1JGR7l
xyBNEKE9CBA9Z8UxGuUxGvjcP41jpZCsVOwOvkaaq5H7Cio/XdI=
=kUDu
-----END PGP SIGNATURE-----

--rceohzw64vwd2bjc--

--===============1285577391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1285577391==--
