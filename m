From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 08/10] drm/sun4i: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Fri, 27 Jul 2018 14:54:49 +0200
Message-ID: <20180727125449.iyoocim6s3sniyf7@flea>
References: <20180726161756.1794-1-alexandru-cosmin.gheorghe@arm.com>
 <20180726161756.1794-9-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2147074762=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180726161756.1794-9-alexandru-cosmin.gheorghe@arm.com>
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


--===============2147074762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pwwib7gnpzt4o2p4"
Content-Disposition: inline


--pwwib7gnpzt4o2p4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 05:17:54PM +0100, Alexandru Gheorghe wrote:
> A new helper function(__drm_atomic_helper_plane_reset) has been added
> for linking a plane with its state and resetting the core
> properties(alpha, rotation, etc.) to their default values.
> Use that instead of duplicating the logic.
>=20
> __drm_atomic_helper_plane_reset initializes the alpha property to its
> max value, which is defined by the drm core as DRM_BLEND_ALPHA_OPAQUE,
> so nothing changes regarding the alpha value.
>=20
> Signed-off-by: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--pwwib7gnpzt4o2p4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltbFhkACgkQ0rTAlCFN
r3RfaQ/+On/S4QtbO+a7aCDmuDvFoK9qpoXT1KUtxpZaGx+KX68ZvcSGcbXhAATh
1/FRKXjOob1uQXbD8aw6cWZAj4+Zb8ZJ6mjKdzdgcCVMR795ehex8kXFu7HqtRt1
CQJmu5F4usau9RiYBef9gzCe15Q3kF4t/IlDYfILx6DqyVKVGnjhXkvTZx8UqQWN
2ItWozHVliIzI1WNKeq8k8FgocR0PGfvjus4I0xjpIy3yBltSQRBHy6PayP3wT+2
dQfe5XIVYE6VdHiuFko6SBdvcpC4OUQT1zrzQJmU+GgT3oSuBddDXQc8u//UG222
/VKotfEdqKfjQV9S9DvAdSSesL4i1wJmbte6K5kMYW2bm4aFIfmkKIFrJ7YMDR+R
ajrduE1dXTVPvT3sRl9G4OgqSyAJLxFAesCvK077l3DjiSWbCf26r0lu53rHP08z
BSoCy8GG1x2SIcVm24B6hCGMSXeSbgf3B4PvzoKg8fKFYAi0ktq3II520RBUPnpg
BT+MSm2305rocZBSMZAg94Gcslmaxe2YwU1IZFpkifCCS806mgQOx9eCvB/XxZRT
1cKoJ2a4djY/cvtgUSIrBKcocp1wC3Msmvj4HAN8zkN6+A/bpEV0jP22tC5Ip/5N
tYS6Qnn4UzQxZ1PRA5171QiaXp0XbomhdVufvVQMIu4BYEfN8l8=
=xMt/
-----END PGP SIGNATURE-----

--pwwib7gnpzt4o2p4--

--===============2147074762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2147074762==--
