From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 09/16] drm: rockchip: add bpc and color mode setting
Date: Wed, 2 Sep 2015 10:34:46 +0200
Message-ID: <20150902083445.GA24654@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441087308-25455-1-git-send-email-ykk@rock-chips.com>
 <120097760.HO2inCimVA@phil>
 <55E659AC.9000402@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55E659AC.9000402@rock-chips.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kern
List-Id: linux-samsung-soc@vger.kernel.org

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 10:06:36AM +0800, Yakir Yang wrote:
> =E5=9C=A8 09/02/2015 05:00 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> >Am Dienstag, 1. September 2015, 14:01:48 schrieb Yakir Yang:
[...]
> >>diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> >>b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c index 34b78e7..5d7f9b6 10=
0644
> >>--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> >>+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> >>@@ -811,14 +811,41 @@ static const struct drm_plane_funcs vop_plane_fun=
cs =3D
> >>{
> >>
> >>  int rockchip_drm_crtc_mode_config(struct drm_crtc *crtc,
> >>  				  int connector_type,
> >>-				  int out_mode)
> >>+				  int bpc, int color)
> >>  {
> >>  	struct vop *vop =3D to_vop(crtc);
> >>-
> >>  	vop->connector_type =3D connector_type;
> >>  	vop->connector_out_mode =3D out_mode;
> >this line should probably go away, as the source var "out_mode" does not=
 exist
> >in the function params any more, making the compilation break, and is set
> >below anyway.
>=20
> Sorry for the failed, there are must be a problem when I backport those c=
ode
> to chrome-3.14 to verify.
>=20
> Thanks a lot, I would update next version soon.

*sigh*

I get the feeling that you're going about upstreaming the wrong way. If
you post patches to upstream mailing lists and you expect people to
apply those patches, then your target is the upstream kernel. So you
should be basing all of your work on top of a recent release candidate
directly from Linus or some recent version of linux-next.

Your current approach is already making people waste time trying to
build the patches and fail because you've been testing on something
other than mainline or linux-next.

At the very least your code must compile when applied against a recent
upstream tree. I would also expect you to make sure the code works at
runtime, though, contrary to build testing, not everybody will be able
to verify that you've actually done so. It is ultimately your platform
maintainer's (i.e. Heiko's) responsibility to ensure that because they
will get to deal with user complaints if people can't run an upstream
kernel on the devices.

I realize that the upstream kernel isn't what's going to end up in
products later on, but that doesn't change the fact that you're
submitting code for inclusion in the mainline tree. If you need to
backport code to some ChromeOS tree, then that should be done after
you've verified that things build and run upstream. Doing so makes life
a lot easier for your upstream maintainers, and that in turn makes it
more likely to get your code merged.

Thierry

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV5rSiAAoJEN0jrNd/PrOh6MAP/iyH9u6icnoveJighTWuyBZU
hZKI/TpTPFLN1tPJnUdbpdtCfx0K6Dq22hnyB6XNWMPKaI0nTdUS/MZh8QicxNVa
C3jk153jouiiMq8BbsbibVuXRnYCe6mpLZ5rPRer93TURgduu7lclOHfvLj5+vRg
PMb5vRcG0JTANDeE9GBgaSH73DqFzH9Lhb+dj+fQlcyZvOJrq2i5ZkRVR36bLRzm
pPxWYN7sVsSmN4GDlqZreXBVE3GEPkpnXq98O9OE5z/Ih3c7oO+CBBlVdv+APxD+
Rj7Ae0YShdJrnFw0W48/nUwMBpFg4otnuXMRm/2DX2KVPjsTPYDBbPuodwFIIaci
ocwmdAS5JYBg4SFt5lIFF3cAC51Y5xvqgMAeorhFHcqCHU4gveJqzCno4I54zpIk
YdnDGomi4qXoa6AE/9BnuJgzVuIXBEm2B2jIJyAj0mB5doPc2sy3+23fEFCbL/4E
hJdVcMZAid+Sm4l5wULW2prYu9EH6gaYiX8/x5j6nEO5XKwV8URcKVouikW7D+BG
n73qVvpveOcnBMZMmr0DRMQORVlOWTGssXwzdEkEqGc7GViFTfF3ZWBzkLg2ys+U
I0/lMYn7cMDZnrlVl/a+ck7SqELkKP0Th6QK15tCkpGd/skH1V0DrV+XmN2ftlPn
w7elaisXMdZXkpk2kYL9
=4CKn
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
