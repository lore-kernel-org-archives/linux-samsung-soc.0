From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Fri, 21 Aug 2015 15:16:33 +0200
Message-ID: <20150821131631.GC22118@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
 <55D6F6F8.70504@rock-chips.com>
 <8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11370 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863AbbHUNRv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Aug 2015 09:17:51 -0400
In-Reply-To: <8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, "joe@perches.com" <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "djkurtz@google.com" <djkurtz@google.com>, "dianders@google.com" <dianders@google.com>, "seanpaul@google.com" <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, "ajaynumb@gmail.com" <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2015 at 08:24:16PM +0900, Jingoo Han wrote:
> On 2015. 8. 21., at PM 7:01, Yakir Yang <ykk@rock-chips.com> wrote:
> >=20
> > Hi Jingoo,
> >=20
> >> =E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:
> >>> On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk@rock-chips.com> wrote:
> >>=20
> >> .....
> >>=20
> >>> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
> >>> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
> >>> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
> >>> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
> >>> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
> >>> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
> >>> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
> >>> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
> >>> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
> >>> drivers/gpu/drm/bridge/Kconfig                     |    5 +
> >>> drivers/gpu/drm/bridge/Makefile                    |    1 +
> >>> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 +++++++++++=
++++++++
> >>> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
> >>> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 +++++++++++=
+++++++
> >>> .../exynos_dp_reg.h =3D> bridge/analogix_dp_reg.h}   |  270 ++--
> >>> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
> >>> drivers/gpu/drm/exynos/Makefile                    |    2 +-
> >>> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
> >> Would you change this file name to "exynos_dp.c"?
> >=20
> > Sorry, I don't think so  ;(
> >=20
> > I think IP_name+Soc_name would be better in this re-use case.
>=20
> So? Is there the naming rule such as "IP_name+SoC_name"?
>=20
> > Beside I see
> > there are lots of driver named with this format in kernel, such as dw_h=
dmi & dw_mmc
>=20
> Please look at other dw cases.
> For example, look at dw_pcie.
>=20
> drivers/pci/host/
> pcie-designware.c
> pci-spear13xx.c
> pci-exynos.c
>=20
> In this case, pci-spear13xx.c and pci-exynos.c do not use "IP_name+SoC_na=
me", even though these are dw IPs.
>=20
> Also, naming consistency is more important.
> Now, Exynos DRM files are using "exynos_drm_" prefix.
>=20
> drivers/gpu/drm/exynos/
> exynos_drm_buf.c
> exynos_drm_core.c
> ....
>=20
> However, "analogix_dp-exynos.c" looks very inconsistent.
>=20
> If there is no strict naming rule, please use "exynos_dp.c"
> or "exynos_drm_dp.c".=20

Exynos DRM maintainers get to pick their filenames, so Yakir, please
rename as Jingoo suggested.

Even if you didn't the first thing that would go into the Exynos DRM
driver tree after this is merged is a rename patch anyway.

Thierry

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV1ySsAAoJEN0jrNd/PrOh/r0QAKWnKrpi02YDSdKHNyfDs75b
PzIpRa+QMZJwFdbA1XEpEsxgR4nNM5vZXzbNnTAWcXeqcjx+7lWCaxYx+gXES3OI
gl/EDZ2UQrIoK4V3QFL78z0NPj9CwnoUFlXVmJyaFXR6IXD1n/T1wHO/2I7uXwL7
VCttBFLU4dSB8Sff6nqJ6lOT2eogyWbrMmwq2CMrnu6KCmb22rsT60YZ9LcKTwVM
RGbD/voyTVKLjlEoNqwNrkqR+Ys5aLIE+jv7v+wR4ilNWzICgzFoCVyXwYW/+BF7
v6UkyJZLGF2lswTV22PjctXeRmeWfBSgTrzZTaFW890KMQuqvAchAt8z1+PRCgxa
12fBsHWXswnTJAe94zrCl9efY2MASYfp4AxhLZkssqwXlOypmyUf5FSlsRdwvsl0
+5hX9Pc993HJuXSO6FtciH439TsTGUDadKEy+tyGWR4mciScnAFDwNlweEw7DvZ0
k5dZ/BwDs5Ntv60fk0Ewqokya819UBa0Q13/zEJzlVr82mTQiVPIdBvyqVPpi9E+
sjUl2eRT/zaMdaoMr7ThaDc4Y1tkgoXPRn5QcuLxXlE0IvJk+IFrxO1PWrTuqpfi
3YwfNlSdfO0gPh+5wJD8pvJtrLiP6tX7RoTKJMf/OoObwdiYGlt/RBBFtAMRN/4j
jRAljPme1sKX9EW5ONTF
=YEy4
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
