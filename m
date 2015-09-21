From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 0/16] Add Analogix Core Display Port Driver
Date: Mon, 21 Sep 2015 11:15:39 +0200
Message-ID: <20150921091537.GA20992@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <3233920.KG0buE86B2@phil>
 <55E65BCD.7090804@rock-chips.com>
 <55FFC3B8.9030108@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:18314 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687AbbIUJPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Sep 2015 05:15:49 -0400
In-Reply-To: <55FFC3B8.9030108@rock-chips.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, s.infradead.org@NULL.NULL, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, architt@codeaurora.org, linux-samsung-soc@vger.kernel.org, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@list.NULL.NULL, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, Mark Yao <mark.yao@rock-chips.com>, Jingoo Han <jingoohan1@gmail.co>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 04:45:44PM +0800, Yakir Yang wrote:
> Hi Heiko,
>=20
> On 09/02/2015 10:15 AM, Yakir Yang wrote:
> >Hi Heiko,
> >
> >=E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> >>Hi Yakir,
> >>
> >>Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
> >>>    The Samsung Exynos eDP controller and Rockchip RK3288 eDP
> >>>controller
> >>>share the same IP, so a lot of parts can be re-used. I split the common
> >>>code into bridge directory, then rk3288 and exynos only need to keep
> >>>some platform code. Cause I can't find the exact IP name of exynos dp
> >>>controller, so I decide to name dp core driver with "analogix" which I
> >>>find in rk3288 eDP TRM ;)
> >>>
> >>>Beyond that, there are three light registers setting differents bewteen
> >>>exynos and rk3288.
> >>>1. RK3288 have five special pll resigters which not indicata in exynos
> >>>    dp controller.
> >>>2. The address of DP_PHY_PD(dp phy power manager register) are
> >>>different
> >>>    between rk3288 and exynos.
> >>>3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp
> >>>debug
> >>>    register).
> >>>
> >>>I have verified this series on two kinds of rockchip platform board,
> >>>one
> >>>is rk3288 sdk board which connect with a 2K display port monitor, the
> >>>other
> >>>is google jerry chromebook which connect with a eDP screen
> >>>"cnm,n116bgeea2",
> >>>both of them works rightlly.
> >>it looks like during the rebase something did go wrong and I found some
> >>issues
> >>I mentioned in the replies to individual patches.
> >>
> >>I did prepare a branch based on mainline [0] with both the old and the
> >>new edp
> >>driver - rk3288_veyron_defconfig build both drivers into the image.
> >>
> >>While the old driver still works, I wasn't able to make the new one work
> >>yet
> >>... the drm core does find the connector, but not that anything is
> >>connected
> >>to it. I'll try to dig deeper tomorrow, but maybe you'll see anything
> >>interesting before then.
> >
> >Many thanks for your comment and debug, I would rebase on your
> >"edp-with-veyron" branch and fix the broken, make sure v6 would
> >work rightly at least in your side and my side.
>=20
> Just like we talk off line, I guess there are two tricky questions which
> make analogix_dp just crash/failed on rockchip platform:
>=20
> -  One is how to reach a agreement with the common way to register
> connector. There would be a conflict with Exynos & IMX & Rockchip.
>      On analogix_dp thread, Exynos want to register connector when that
> connector is ready.
>      On dw_hdmi thread, IMX want to register connector when all component=
 is
> already.
>      So Exynos & IMX & Rockchip should reach a common way to register
> connector to fix this issue.
>=20
> -  The other is atomic API.
>       The rockchip drm haven't implemented the atomic API, but the origin=
al
> exynos_dp have used the atomic API on connector helper function. That's w=
hy
> analogix_dp just keep crash on your side.

There's really no reason not to convert Rockchip to atomic. It will have
to happen eventually anyway.

That said, there's another option that would allow you to side-step both
of the above problems at the same time. If you turn the common code into
a helper library that should give you enough flexibility to integrate it
into all existing users. For example you could leave out the connector
registration and let the drivers do that. Similarly since the helpers
are only hooked up at registration time you could probably find a way to
share the low-level code but again leave it up to the drivers to glue it
all together at registration time (drivers could wrap the low-level code
with atomic or non-atomic callbacks).

This option may also have the benefit of loosening the coupling between
DRM drivers and the helper code for this IP, which may be handy in case
the drivers diverge again in the future, or ease transitions to new API.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV/8q3AAoJEN0jrNd/PrOhg2IP/0sQgyUansld2uvkG7EMFK41
vbBpPicg3XTiZJQ14Itsb3HJEI6WMVeTzvb0nva8KxucXRAk3tYyMuHtxKa+UHDH
Hc+4ljDd7wUdHBoWIkSFEXmIe/JBCSH5HA9OcIzseCk2lTYPmnDjPzNpwbQj1l/3
BGYp8f+4f2LQ9Vc16SnMptLAIZY/ISoBqebIv9gUCVpqakZDahkp39ArlF71lTvg
a8/bHJofaoF4U4Chk9n5akSkJ8Vw2RQ+wuw0IcwJRfd8tbyTbhEAg7rHAthl+sM/
0Hajt2hkUHWuL3JZ3a/rpL1EZfzP7kqPtHcCygufe/92knNWzgKv5R7IgVcIauuC
dG3LyjrE5cTbdavEKBA5WPVPMq4NY8vm5+J6FNdc3r4EwdcZ3Uf63SIavdUKqiBV
3bnJGVzxZrtG1XhgNWOdHoUEUb0ObSBIB+JRojnmk7RqRXcR/dU6ZjEniBbzHTCA
S+AG4ME/IfzNwINcnsrNK4on0nHmNWkUq9ZS2+4XJEn5zC03FFOD1SNYH97lDLSI
y4UfqV5H5b/S0IicbLeG6aBEJcxz6jYUY9DFkY46Anithj7MhrBoIVlXUGbPjWk+
qs+UTstuHOkFiUEhimlBQ69y2lYPpdn2S80ffzMTwQGUlGk1L7g4/MZ9se4kWEn9
9OoachQrzeNRrHP7Ryc+
=eNwf
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
