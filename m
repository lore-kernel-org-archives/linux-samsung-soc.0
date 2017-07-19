From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] gpu: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 08:23:48 +0200
Message-ID: <20170719062348.3epnl4u6vdnkx5cb@flea>
References: <20170718214339.7774-24-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1360306020=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170718214339.7774-24-robh@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Chen Feng <puck.chen@hisilicon.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Carlo Caione <carlo@caione.org>, Jyri Sarha <jsarha@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Se
List-Id: linux-samsung-soc@vger.kernel.org


--===============1360306020==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t6ilc4dxca6ptagp"
Content-Disposition: inline


--t6ilc4dxca6ptagp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2017 at 04:43:04PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Carlo Caione <carlo@caione.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mark Yao <mark.yao@rock-chips.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>  drivers/gpu/drm/armada/armada_crtc.c            |  3 +--
>  drivers/gpu/drm/armada/armada_drv.c             |  4 ++--
>  drivers/gpu/drm/drm_mipi_dsi.c                  |  6 +++---
>  drivers/gpu/drm/drm_modes.c                     |  4 ++--
>  drivers/gpu/drm/drm_of.c                        |  4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c         |  3 +--
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  3 +--
>  drivers/gpu/drm/mediatek/mtk_disp_color.c       |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_dpi.c              |  6 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c         |  7 +++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     |  6 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 16 ++++++++--------
>  drivers/gpu/drm/mediatek/mtk_dsi.c              |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_hdmi.c             |  8 ++++----
>  drivers/gpu/drm/meson/meson_drv.c               |  5 ++---
>  drivers/gpu/drm/panel/panel-lvds.c              | 16 ++++++++--------
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c       |  4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c           | 16 ++++++++--------
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  4 ++--
>  drivers/gpu/drm/stm/ltdc.c                      |  3 +--
>  drivers/gpu/drm/sun4i/sun4i_drv.c               |  9 ++++-----

For sun4i-drm:
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--t6ilc4dxca6ptagp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbvr0AAoJEBx+YmzsjxAgITYP/iWQDwIsdtm3dr7Z9sIdesLo
gY84xayD01vmtGj3ex/rmnwG9CxHXLrI6whLh8dGwE+NV+lEEczL+ydjUhTDo9gW
wOJXmCL11qEcbhPyQmrTGayFpsNkEQZrttNUpNpLOAB85m1G69Ky236TqLu5xgqE
MXOueG+cXhVHOMfW9vu/E55qLotmU6oNnOAwTfA1Qfejp3L6frZqRGNNxewkXQh1
I5s8J89Y+UZ4ZBe52nWUda7HxkaPLdj/e/QtsqirHRvXCEh9Xk1r7h8bDNYrWiZ6
5Cq83PXHn8CWW4zl0bAcCPN2tt7v93VE1Q5wV9N671X7XLTy8eaIkCwHQ5jyR6c8
SqwHX/p+IhpcTYZV3h6X6pldbqE0LzKmPmNjhWGh9SYtQUBb7x39HUKmbIS3quC8
cRlqh7idfcoS6u+GuHNyYs0NOExlC/FFG1Sg+7CxOC5OHs27NQ/iut4jpoLG2iRL
EQGO/FrnIGPAQFCeafAfM9s0YaDLboS3BY8EIuAewPCmrUM/q3QyzNBNq61BdHOB
GM33nFunka0eXWKgHTkoihcSGjSnTp8JElqecicNGjLhLYJ8P+klqX2rFMBfostm
So4ZmCSPZz3dmFGfroUu5So/mwuVJ4bbhUZGzR4/SQqtfJUGTBu6xNFaM1A/z7L8
zLggRDwKaHQAeerdu3Fh
=sj0d
-----END PGP SIGNATURE-----

--t6ilc4dxca6ptagp--

--===============1360306020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1360306020==--
