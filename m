From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 4/8] drm: rockchip/dp: add rockchip platform dp driver
Date: Mon, 10 Aug 2015 15:17:11 +0200
Message-ID: <20150810131709.GA7302@ulmo.nvidia.com>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
 <1438944380-18897-1-git-send-email-ykk@rock-chips.com>
 <1730542.s7otqjtiXD@diego>
 <55C57D7E.6080800@rock-chips.com>
 <20150810100055.GB7850@ulmo.nvidia.com>
 <55C8A040.8090405@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34241 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752210AbbHJNSC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 09:18:02 -0400
Content-Disposition: inline
In-Reply-To: <55C8A040.8090405@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Thierry Reding <treding@nvidia.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, joe@perches.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, ajaynum


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 08:59:44PM +0800, Yakir Yang wrote:
> Hi Thierry,
>=20
> =E5=9C=A8 2015/8/10 18:00, Thierry Reding =E5=86=99=E9=81=93:
> >On Sat, Aug 08, 2015 at 11:54:38AM +0800, Yakir Yang wrote:
> >[...]
> >>         edp: edp@ff970000 {
> >[...]
> >>                 hsync-active-high =3D <0>;
> >>                 vsync-active-high =3D <0>;
> >>                 interlaced =3D <0>;
> >These look like they should come from the display mode definition (EDID)
> >rather than device tree.
>=20
> I do think so, those numbers can parse from struct drm_mode. But I haven't
> send those changes yet, cause I want to merge the split analogix_dp first,
> and
> then send some patches to improve it. If you think it's better to imptoved
> those
> now, I would like to do it , please let me know ;)
>=20
> >>                 samsung,color-space =3D <0>;
> >>                 samsung,dynamic-range =3D <0>;
> >>                 samsung,ycbcr-coeff =3D <0>;
> >I think these should also come from EDID, though I'm not sure if we
> >store this in internal data structures yet.
>=20
> Same to previous reply
>=20
> >>                 samsung,color-depth =3D <1>;
> >This is probably drm_display_info.bpc.
>=20
> Same to previous reply
>=20
> >>                 samsung,link-rate =3D <0x0a>;
> >>                 samsung,lane-count =3D <1>;
> >And these should really be derived from values in the DPCD and adjusted
> >(if necessary) during link training.
> >
> >Why would you ever want to hard-code the above?
>=20
> Yes, I do meet the problem that my eDP screen need lane-count to 4, but my
> DP TV need lane-count to 1. Just like previous reply, if you think I shou=
ld
> improved
> them in this series, I would rather to do it.

The problem with these is that if you keep them in for your initial
submission, you can never (or only under extreme pain) remove them.
Anything in DTB needs to be effectively supported forever.

Also since these don't make sense to hard-code, just improve the code
and get rid of the need for these DT properties. Mind you that you still
need to keep the code to parse them, because presumably Exynos relies on
them. But depending on how you split up the driver you might be able to
restrict these compatibility hacks to Exynos and not carry them forward
into your new driver.

> >>>>+	dp->clk_24m =3D devm_clk_get(dev, "clk_dp_24m");
> >>>Same here, maybe "dp_24m".
> >>Like my previous reply. And actually as those two clocks all have
> >>a common prefix "SCLK" in rk3288 clock tree, I thinkt we can name
> >>them to "sclk_dp" & "sclk_dp_24m", is it okay ?
> >I don't think there's a need for these common prefixes. The names here
> >are identifiers in the context of the IP block, so any SoC-specific
> >prefixes are irrelevant. Also they do appear, in DT and in code, in the
> >context of clocks already, so "sclk_" or "clk_" is completely redundant
> >in these names.
>=20
> The sclk_dp & sclk_dp_24m is not IP common ask, it's only exist in RK3288
> SoC (Like exynos
> only got one "dp" clock), and actually I add this to rockchip platform dp
> driver not analogix
> dp driver. So I think it's okay to add some platform some common prefixes.
>=20
> And I got a better idea for those clock. "sclk_dp" & "sclk_dp_24m" is
> provided for the eDP phy,
> and I just take Heiko suggest that add an new phy-rockchip-dp.c driver, so
> it's better to move
> those clock to phy driver, and rename them to "dp-phy" && "dp-phy-24m".

I agree that dealing with these in a PHY driver sounds like the better
option. However, I still think that the dp-phy prefix is redundant. The
names are in a per-driver scope, so "dp-phy" is implied by the device
tree binding and driver already. You could simply use shorter names such
as "phy" and "24m" for example.

Also note that the clock provider will already have the proper names for
these, so the clock tree will end up showing the provider names. The
names in the binding are merely the "consumer" names.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVyKRSAAoJEN0jrNd/PrOhgYoP/jOFL4bMSCopNJarQHy5H3Qz
QCkubUky3AyQPDbMKh0pGJi/idREXirG0ZJv3UOCMDdiJznHtvFg95fwwnCDb4on
5TyHiHPPBw/wlgIqn5Nz74m/VBJZLHOl52guN4+L4WzCfldGYgd3FW0ymcmYyx/f
aJz0jAj6TeeDg2Ds0ZJ+p8xPOyLk7Y7UMP7XNxY0wI+3JkgbKlY2wJp/ClFzDxNa
aMR66vftI0J3DSb5+M0Xs9XaBKC2wwIc4FtRBhivYjMDcmBcL8N9cJg2fDtS4fgb
VxaW11k5VdzAwYK6RKgWf1Z8JnQRtuvTmQF1zT99uVU0niMz67VIhNHp3id4STJH
GMO1rgBFUp+aBCwXRpju556AUA5/zXjTEguNYSu2uX6h6c5JE33Nbl4IJzG/Fffu
tjOxWoTrtv+OcMqvjRp9R174P9OT8IbkufY7EcL1wQeRYNDMCdSl60Y3fhVNrBz9
T3rekmWL539nh2zKhY/777fr2xgdxlLrf6JE+C9jU16v4wUjVixUfMUOjSN3VB1+
kR4Wuomx50XlF9RnYPImoet6VVMVDI45QF55TKtXGS7neNGun1IcSou4wo7Lr79u
abGwYrdbukmGeK2xrnSXt9ODW89ZHSDj47nB93R49nam0RumF88lIqqmIOD/WQLe
oa6jawX1wFd5oVdqFpmb
=q1Zd
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
