From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/4] drm/atomic: implement drm_atomic_helper_commit_tail
 for runtime_pm users
Date: Tue, 18 Jul 2017 09:05:22 +0200
Message-ID: <20170718070522.6uu7s6o3ivpemslf@flea>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
 <aeeb8f778dae8f170294b6da92819973b742feb2.1499956639.git-series.maxime.ripard@free-electrons.com>
 <1823154.LT2zYSFJ4j@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aowiajdehw3raejz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:45400 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751026AbdGRHFe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 03:05:34 -0400
Content-Disposition: inline
In-Reply-To: <1823154.LT2zYSFJ4j@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org


--aowiajdehw3raejz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Jul 14, 2017 at 02:43:12AM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Thursday 13 Jul 2017 16:41:13 Maxime Ripard wrote:
> > The current drm_atomic_helper_commit_tail helper works only if the CRTC=
 is
> > accessible, and documents an alternative implementation that is suppose=
d to
> > be used if that happens.
> >=20
> > That implementation is then duplicated by some drivers. Instead of
> > documenting it, let's implement an helper that all the relevant users c=
an
> > use directly.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c        | 47 +++++++++++++++--------
> >  drivers/gpu/drm/exynos/exynos_drm_fb.c     | 27 +-------------
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c      | 18 +---------
>=20
> I've submitted "[PATCH] drm: rcar-du: Setup planes before enabling CRTC t=
o=20
> avoid flicker" that changes the rcar-du implementation to the standard=20
> disable/update planes/enable order, so I'd appreciate if you could drop t=
he=20
> rcar-du part of this patch to avoid conflicts.

I will.

> This being said, the reason why I switched back from the "runtime PM" to =
the=20
> "standard" order is probably of interest to you. Quoting the commit messa=
ge,
>=20
> > Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
> > start to CRTC resume") changed the order of the plane commit and CRTC
> > enable operations to accommodate the runtime PM requirements. However,
> > this introduced corruption in the first displayed frame, as the CRTC is
> > now enabled without any plane configured. On Gen2 hardware the first
> > frame will be black and likely unnoticed, but on Gen3 hardware we end up
> > starting the display before the VSP compositor, which is more
> > noticeable.
> >=20
> > To fix this, revert the order of the commit operations back, and handle
> > runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
> > helper operation handlers.
>=20
> I believe that the "runtime PM" order is problematic in most drivers. The=
=20
> problem usually goes unnoticed as most monitors will not even display the=
=20
> first frame, and I assume many devices will just output it black, but it'=
s an=20
> issue nonetheless.
>=20
> Note that my driver hasn't lost the "runtime PM" requirements, so I had t=
o=20
> support them with the "standard" order. The best way I've found was to ru=
ntime=20
> resume in the one of .atomic_begin() and .enable() that is run first. Not=
 very=20
> neat, as similar code would be needed in most drivers. I wonder whether i=
t=20
> wouldn't be useful to add resume/suspend helper callbacks for the CRTC.

I'm not sure it would apply. Our driver doesn't use runtime_pm at all,
but in order for the commits to happen, we need to have the CRTC
active, but it will remain powered up the whole time. I'm not sure if
we'll ever see such a frame.

But since this seems to be a pretty generic, maybe we should address
it in the helper itself?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--aowiajdehw3raejz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbbMyAAoJEBx+YmzsjxAgctkP/3HlSSmclqUkq3timZRLVUww
41tvFzoqlmQ80iFoFsX9XVbSaOWVQqjttNxZJEU2/xtxK8QDSYYwQbYKRg1q88R+
yhVbL4xqcPWL8Xj0lU+TKpLMykRyy/hyeYGDkkeHi08Myz6zYbWjEvyG6/ZKsW5p
2bG/9t3vC19b0OxG6VB2OKzjb0MZHJpbBPP9PwwFI8sE1869DdLEGtd6ptgDyJqI
YC2PcYvAU0vv4RRXW2RMOYK70jnkNl37zB02OE0yssJRIdXvU3lpy8zuFznuzLIQ
egxs9J+Q8tjSYaZvLP0TxE0VYtWNrgBpM0vPXen7zoH8/tWNtDifCySf1pIPk6Y6
gDWoinMeb7dZCJrZn/9LR+aAYgB3dPdsXqxav9B4EZkIYYjuGOHvfowWGpCcdnO+
Q9EniJXq3Z6Vfne6RX9snGN2/rxYVD2PAaHTfHFa13LMxMYH+ojwpaM/yBGluI2Q
HnnSw7HxKxu52wgLGEKBO7PH8wLcqwowRuRIA3hemSyi/VpT6PT1sIqnEVY6O8hK
ZZd8XrCPlm2iuudNDzKa6nwAVON9PVwaRZA5Q3VAs6QvgKFLHpSMlmc045fE1rDl
dPajfdXrnaJjI+6t8rtS3a/2JSlCzNZv8QSgjylIRWGIHq81wNBivhjZIZ2NXqN4
Z3mSWSqaf/LcEjCxsnbg
=Fv0r
-----END PGP SIGNATURE-----

--aowiajdehw3raejz--
