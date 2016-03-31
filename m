From: Thierry Reding <treding@nvidia.com>
Subject: Re: [v14, 01/17] drm: bridge: analogix/dp: split exynos dp driver to
 bridge directory
Date: Thu, 31 Mar 2016 11:56:02 +0200
Message-ID: <20160331095600.GD26032@ulmo.nvidia.com>
References: <1455534576-1486-1-git-send-email-ykk@rock-chips.com>
 <20160330203204.GA24156@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19679 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755775AbcCaJ4N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Mar 2016 05:56:13 -0400
In-Reply-To: <20160330203204.GA24156@roeck-us.net>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@roc>

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 01:32:04PM -0700, Guenter Roeck wrote:
> Hi,
>=20
> On Mon, Feb 15, 2016 at 07:09:36PM +0800, Yakir Yang wrote:
> > Split the dp core driver from exynos directory to bridge directory,
> > and rename the core driver to analogix_dp_*, rename the platform
> > code to exynos_dp.
> >=20
> > Beside the new analogix_dp driver would export six hooks.
> > "analogix_dp_bind()" and "analogix_dp_unbind()"
> > "analogix_dp_suspned()" and "analogix_dp_resume()"
> > "analogix_dp_detect()" and "analogix_dp_get_modes()"
> >=20
> > The bind/unbind symbols is used for analogix platform driver to connect
> > with analogix_dp core driver. And the detect/get_modes is used for anal=
ogix
> > platform driver to init the connector.
> >=20
> > They reason why connector need register in helper driver is rockchip drm
> > haven't implement the atomic API, but Exynos drm have implement it, so
> > there would need two different connector helper functions, that's why we
> > leave the connector register in helper driver.
> >=20
> > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> >=20
> [ ... ]
>=20
> > diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm=
/bridge/analogix/Makefile
> > new file mode 100644
> > index 0000000..9107b86
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_DRM_ANALOGIX_DP) +=3D analogix_dp_core.o analogix_dp_reg.o
>=20
> This results in the following build errors if DRM_ANALOGIX_DP
> is configured as module.
>=20
> ERROR: "analogix_dp_start_video" [drivers/gpu/drm/bridge/analogix/analogi=
x_dp_core.ko] undefined!
> ERROR: "analogix_dp_get_lane0_link_training" [drivers/gpu/drm/bridge/anal=
ogix/analogix_dp_core.ko] undefined!
> ERROR: "analogix_dp_get_lane1_link_training" [drivers/gpu/drm/bridge/anal=
ogix/analogix_dp_core.ko] undefined!
> ERROR: "analogix_dp_get_lane2_link_training" [drivers/gpu/drm/bridge/anal=
ogix/analogix_dp_core.ko] undefined!
> ERROR: "analogix_dp_get_lane3_link_training" [drivers/gpu/drm/bridge/anal=
ogix/analogix_dp_core.ko] undefined!
> ERROR: "analogix_dp_get_lane_count" [drivers/gpu/drm/bridge/analogix/anal=
ogix_dp_core.ko] undefined!
> ERROR: "analogix_dp_get_link_bandwidth" [drivers/gpu/drm/bridge/analogix/=
analogix_dp_core.ko] undefined!
>=20
> [ and so on ]

Ugh... most of these functions shouldn't be there in the first place. We
have helpers in the core that already do this. Most of the functionality
is duplicated in this driver.

I realize that this is a problem that existed in the Exynos DP driver,
but somebody really ought to rewrite those parts to make use of the DRM
DP helpers.

Thierry

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW/PQwAAoJEN0jrNd/PrOhbPwP/it6ANKQhbk/8sLmqtnkpIYK
eXuXu5AzQQ9RocsFRj5kwoOGTk1xc8rE9zNVyBZxrx1Kn5x0yMt8Raj4Gt5eisbL
nOhyQmaiwpEkmXYqWQlXoaY1wDJJCw3UMb3KMbdOP8UynVa0QCe0cUIJo55by42k
qQ3yPKYvNmvW6gKEiottxk7u+DDEcNwbiX3M9kYzFs7X1uE/k/8as/XO/HPIRgrC
fK8OFxixUaiRFX8eT+zjsfnizAp+vIVL92RPZyH9m2Hmmb7uCtsqpUzXN1x/d9nC
GY03AO69AjgSlGTepSaPwfgIdsRm9QOuQxoFN/ZfSpkQzA2YjEZq9w7i9JynDPE9
N9Hlm3OkSNcvaUFFtHWQpbTR29BXtgNqL31UJV7Tt6SxReVxGXFOnzLJiZ/MAKSE
PjoN+xiSNmgEKfU7qPj81YzvjQigC5tb2EBj4U+Mt2jyJREhO7nfBYJOPgTuCKcO
QEt7ffRHLqqzRcBaujjVEXQjRT466StKdPd6XXs1V4aAhO9dICl23qGLo1vGLllk
XiVk2G5DSHcnL1lOIUGKEj4zP4HdOKhzqg4qUvNFEJsBwv+gSmdTOYzwucw/JUq7
liIV8O6SYFkzat2jV7aKKCRI0bkz5v92NCw+bavrm786wH82ZK9tT2W3iOTFmwO9
k5h/xk8D86BbWtg0bcCP
=QVVt
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
