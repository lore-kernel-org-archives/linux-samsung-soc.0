From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 09/10] drm/vc4: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 06 Aug 2018 12:58:20 -0700
Message-ID: <87va8n1d43.fsf@anholt.net>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-10-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1963710941=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180804161530.12275-10-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: seanpaul@chromium.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, ville.syrjala@linux.intel.com, daniel@ffwll.ch, gustavo@padovan.org, maarten.lankhorst@linux.intel.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, harry.wentland@amd.com, andrey.grodzovsky@amd.com, Tony.Cheng@amd.com, sunpeng.li@amd.com, shirish.s@amd.com, boris.brezillon@bootlin.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com, maxime.ripard@bootlin.com, wens@csie.orglinu
Cc: nd@arm.com, Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1963710941==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com> writes:

> A new helper function(__drm_atomic_helper_plane_reset) has been added
> for linking a plane with its state and resetting the core
> properties(alpha, rotation, etc.) to their default values.
> Use that instead of duplicating the logic.
>
> __drm_atomic_helper_plane_reset initializes the alpha property to its
> max value, which is defined by the drm core as DRM_BLEND_ALPHA_OPAQUE,
> so nothing changes regarding the alpha value.
>
> Signed-off-by: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAltoqFwACgkQtdYpNtH8
nuhXqxAAhKaiES1L7rQQ70OEqtrZx5z0849rQjbGiQW/z+R/1zbdjOlyv7rCRUSY
4iIp9QHg2Ouw7u1vdrdfqDeNLgDI9iRtErsLAgW6Abu+AlyOLanoQzEW2EmVPPjC
oF1QuAw/n0LJwdx1r3w0DmbZiKacMZ/vlf+CPJ7uADdKS5yQTdxXhSIEBVE/nVJj
nacvqZFXtcrq4G8DSk+AszAI1oPNurtDk37MESqpBa54OJqndjb54gTW5+hHG7W9
ZuU2CY0TgueTDNaRwU/hLDAX4vNnFF/Y9QBRFyRSfxqLEg5MPsj2U4YqQ9CUNph8
yaKAUir67CWg1awxBjo4hxLpV7GjkcQAjYZmBKzXZjuxOV03/RIxQtnsNAXixlHv
6XWfKZsWtKPAAX3TpoWDnf9KZ9kKS1CjYnlpbl66g5y4/XFKudmqGC/LGC4f21h3
dKjtRqLzpwvtxNtKCMpfzW6WVGJ3RuSL//m1M8xd6f1ROljQmfjC/w3oKYwqjebe
1y9hRxZ3qeXRKCU9v+hpKc/4icYwY4Gdf99RfHYbY4GmVyH2S8LV3UKAnHw1tddT
le/La2RNe7uDRTn3d6IOGlraEIF+ASNmpHfV0+rS6H8ByMCK4EkBPlgJ9vgN8FPj
xAWLcwL+96k+5YpzYG+H23WU02pA1A+6l/3+hJduKSr4dkWVwgU=
=3fd6
-----END PGP SIGNATURE-----
--=-=-=--

--===============1963710941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1963710941==--
