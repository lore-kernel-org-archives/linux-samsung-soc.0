From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v14 0/17] Add Analogix Core Display Port Driver
Date: Thu, 31 Mar 2016 12:22:48 +0200
Message-ID: <20160331102247.GE26032@ulmo.nvidia.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <20160331101535.GZ2510@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6538 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751771AbcCaKW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Mar 2016 06:22:59 -0400
In-Reply-To: <20160331101535.GZ2510@phenom.ffwll.local>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-rockchip@lists.infradead.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>aj

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 12:15:35PM +0200, Daniel Vetter wrote:
> On Mon, Feb 15, 2016 at 07:08:05PM +0800, Yakir Yang wrote:
> >=20
> > Hi all,
> >=20
> >   The Samsung Exynos eDP controller and Rockchip RK3288 eDP controller
> > share the same IP, so a lot of parts can be re-used. I split the common
> > code into bridge directory, then rk3288 and exynos only need to keep
> > some platform code. Cause I can't find the exact IP name of exynos dp
> > controller, so I decide to name dp core driver with "analogix" which I
> > find in rk3288 eDP TRM
> >=20
> > But there are still three light registers setting different between
> > exynos and rk3288.
> > 1. RK3288 have five special pll registers which not indicate in exynos
> >    dp controller.
> > 2. The address of DP_PHY_PD(dp phy power manager register) are different
> >    between rk3288 and exynos.
> > 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp de=
bug
> >    register).
> >=20
> > Due to Mark Yao have introduced the ATOMIC support to Rockchip drm, so =
it's
> > okay to use the ATOMIC helpers functions in connector_funcs. No need to=
 splict
> > the connector init to platform driver anymore, and this is the biggest =
change
> > since version 11.
> >=20
> > This v14 didn't have lots of new changes which seems not the correct ti=
me to
> > upgrade the version number, but I have changed ordering of patches (add=
ing 2
> > more, and removing 2 out). Especially to prevent confusing people, so I=
 updated
> > the whole series.
>=20
> So I'm jumping into this part way late, but just noticed (well Thierry
> pointed this out to me) that the exynos dp driver reinvents all the dp and
> dp-aux helpers we already. That's somewhat okish for a private driver (and
> exynos has a reputation for that kind of stuff), but imo not ok for a
> shared driver.
>=20
> Not saying this should block merging this patch, but it really needs to be
> addressed. All the dp aux and edid read code in the current
> exynos_dp_core/reg.c files needs to be replaced with dp helpers and the
> core i2c edid reading code.

Agreed. I think a first step would be to implement and register a
drm_dp_aux object for Analogix DP hardware. That will give you access to
a slew of helpers that allow to read DPCD, parse link status and use the
standard EDID reading routines that the DRM core already has. This
should remove a lot of duplication from this driver.

For extra incentive, doing this might even fix a bug or two.

Thierry

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW/Pp0AAoJEN0jrNd/PrOhQ8oP/1O6JJe+NVY/UGnYa7rAHyGh
IZABvSV3u0gLYBqaIQuCAhFlWKOwZewQGjhbQ5IciBQJ+kyjlz1rMALj70/ugju2
VUzgSL7oTy74JGIijKBhk06Le+4neePooniNmEFfReezCfqY9Ln+97s5/svkVM6r
dIJ2krPQiMqRgJ2/F+NtcDUvsnbv+Jc52YXmDrxnWinforNAjrOeE9Ha0Ik9FD1L
TO5q4PVpwxDgI8lvqkk+idrf3d03KkWsgm8q/za95E/GXcEwI27cArF1wPDLeczd
0hk1xuE3Lx4IJRsBqAla4DIfLs9gQPuciNlARYvDpFD66hhe7u6ndSCA2gmmwRqC
VnmfhNGPavXM573yZS1NmBBKpJQ+QsUPlosOQxFkEwx9g8dUTfrY1KXPZ2YZ/kAH
0MRXWNSWUspsxjAmUD50BJgbdAOxcTprKxVyWeOcoZHYvd/3/UooK/OggWMx8qhr
233+D1o+FGAIabxFmqamxQGYS4UU/rN9CUhICmBGfPcFXKcHx9Z+Iz4cX+4uENt1
QHLv1ZG9POxI+pZqqLgEJ/xO+d69z3lAABS/hR6ekKqN8dySwQKfhaqzgtpZFTwP
87DbLWGSeqHjRAsax/YgPwBaanrHcDdao4W+9HkNT0TaCSjGuTfjMXOdkrUv0d/h
kT2qsgzEGmoDjCrHb6Ob
=HdMD
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
