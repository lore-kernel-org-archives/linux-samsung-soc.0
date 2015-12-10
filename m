From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 03/22] drm/exynos: gsc: add device tree support and
 remove usage of static mappings
Date: Thu, 10 Dec 2015 15:48:41 +0900
Message-ID: <56692049.9050709@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50877 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072AbbLJGsn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 01:48:43 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZ401BD3QX53Z90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Dec 2015 15:48:41 +0900 (KST)
In-reply-to: <1448891617-18830-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene.kim@samsung.com>Krzysztof Kozlowski <k.kozlowski@samsung.com>

CCing Mr. Kukjin and Krzysztof


Hi Kukjin and Krzysztof,

Below patch includes dt binding about gsc device but it'd be nice this =
patch to exynos drm tree with others.
So could you give me Acked-by so that I can merge it to exynos drm tree=
?

Thanks,
Inki Dae

2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> From: Seung-Woo Kim <sw0312.kim@samsung.com>
>=20
> This patch adds device tree support for exynos_drm_gsc. This patch
> also fixed build issue on non-Exynos platforms, thus dependency on
> !ARCH_MULTIPLATFORM can be now removed. The driver cannot be used
> simultaneously with V4L2 Mem2Mem GScaller driver thought.
>=20
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> [updated commit message, removed the need for wb-lcd property, becaus=
e
> all gscallers have support for lcd writeback, replaced dependency on
> !ARCH_MULTIPLATFORM with !VIDEO_SAMSUNG_EXYNOS_GSC]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/media/exynos5-gsc.txt      |  4 +++
>  drivers/gpu/drm/exynos/Kconfig                     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 30 ++++++++++++=
+++++++---
>  drivers/gpu/drm/exynos/regs-gsc.h                  |  4 +--
>  4 files changed, 33 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt =
b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> index 0604d42f38d1..5fe9372abb37 100644
> --- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> +++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> @@ -7,6 +7,10 @@ Required properties:
>  - reg: should contain G-Scaler physical address location and length.
>  - interrupts: should contain G-Scaler interrupt number
> =20
> +Optional properties:
> +- samsung,sysreg: handle to syscon used to control the system regist=
ers to
> +  set writeback input and destination
> +
>  Example:
> =20
>  gsc_0:  gsc@0x13e00000 {
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/=
Kconfig
> index 96e86cf4455b..83efca941388 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -118,7 +118,7 @@ config DRM_EXYNOS_ROTATOR
> =20
>  config DRM_EXYNOS_GSC
>  	bool "GScaler"
> -	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !ARCH_MULTIPLATFORM
> +	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !VIDEO_SAMSUNG_EXYNOS_=
GSC
>  	help
>  	  Choose this option if you want to use Exynos GSC for DRM.
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/dr=
m/exynos/exynos_drm_gsc.c
> index ed55d37b6330..7aecd23cfa11 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -15,7 +15,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
> -#include <plat/map-base.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> =20
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
> @@ -126,6 +127,7 @@ struct gsc_capability {
>   * @ippdrv: prepare initialization using ippdrv.
>   * @regs_res: register resources.
>   * @regs: memory mapped io registers.
> + * @sysreg: handle to SYSREG block regmap.
>   * @lock: locking of operations.
>   * @gsc_clk: gsc gate clock.
>   * @sc: scaler infomations.
> @@ -138,6 +140,7 @@ struct gsc_context {
>  	struct exynos_drm_ippdrv	ippdrv;
>  	struct resource	*regs_res;
>  	void __iomem	*regs;
> +	struct regmap	*sysreg;
>  	struct mutex	lock;
>  	struct clk	*gsc_clk;
>  	struct gsc_scaler	sc;
> @@ -437,9 +440,12 @@ static int gsc_sw_reset(struct gsc_context *ctx)
> =20
>  static void gsc_set_gscblk_fimd_wb(struct gsc_context *ctx, bool ena=
ble)
>  {
> -	u32 gscblk_cfg;
> +	unsigned int gscblk_cfg;
> =20
> -	gscblk_cfg =3D readl(SYSREG_GSCBLK_CFG1);
> +	if (!ctx->sysreg)
> +		return;
> +
> +	regmap_read(ctx->sysreg, SYSREG_GSCBLK_CFG1, &gscblk_cfg);
> =20
>  	if (enable)
>  		gscblk_cfg |=3D GSC_BLK_DISP1WB_DEST(ctx->id) |
> @@ -448,7 +454,7 @@ static void gsc_set_gscblk_fimd_wb(struct gsc_con=
text *ctx, bool enable)
>  	else
>  		gscblk_cfg |=3D GSC_BLK_PXLASYNC_LO_MASK_WB(ctx->id);
> =20
> -	writel(gscblk_cfg, SYSREG_GSCBLK_CFG1);
> +	regmap_write(ctx->sysreg, SYSREG_GSCBLK_CFG1, gscblk_cfg);
>  }
> =20
>  static void gsc_handle_irq(struct gsc_context *ctx, bool enable,
> @@ -1663,6 +1669,15 @@ static int gsc_probe(struct platform_device *p=
dev)
>  	if (!ctx)
>  		return -ENOMEM;
> =20
> +	if (dev->of_node) {
> +		ctx->sysreg =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> +							"samsung,sysreg");
> +		if (IS_ERR(ctx->sysreg)) {
> +			dev_warn(dev, "failed to get system register.\n");
> +			ctx->sysreg =3D NULL;
> +		}
> +	}
> +
>  	/* clock control */
>  	ctx->gsc_clk =3D devm_clk_get(dev, "gscl");
>  	if (IS_ERR(ctx->gsc_clk)) {
> @@ -1796,6 +1811,12 @@ static const struct dev_pm_ops gsc_pm_ops =3D =
{
>  	SET_RUNTIME_PM_OPS(gsc_runtime_suspend, gsc_runtime_resume, NULL)
>  };
> =20
> +static const struct of_device_id exynos_drm_gsc_of_match[] =3D {
> +	{ .compatible =3D "samsung,exynos5-gsc" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, exynos_drm_gsc_of_match);
> +
>  struct platform_driver gsc_driver =3D {
>  	.probe		=3D gsc_probe,
>  	.remove		=3D gsc_remove,
> @@ -1803,6 +1824,7 @@ struct platform_driver gsc_driver =3D {
>  		.name	=3D "exynos-drm-gsc",
>  		.owner	=3D THIS_MODULE,
>  		.pm	=3D &gsc_pm_ops,
> +		.of_match_table =3D of_match_ptr(exynos_drm_gsc_of_match),
>  	},
>  };
> =20
> diff --git a/drivers/gpu/drm/exynos/regs-gsc.h b/drivers/gpu/drm/exyn=
os/regs-gsc.h
> index 9ad592707aaf..4704a993cbb7 100644
> --- a/drivers/gpu/drm/exynos/regs-gsc.h
> +++ b/drivers/gpu/drm/exynos/regs-gsc.h
> @@ -273,12 +273,12 @@
>  #define GSC_CLK_GATE_MODE_SNOOP_CNT(x)	((x) << 0)
> =20
>  /* SYSCON. GSCBLK_CFG */
> -#define SYSREG_GSCBLK_CFG1		(S3C_VA_SYS + 0x0224)
> +#define SYSREG_GSCBLK_CFG1		0x0224
>  #define GSC_BLK_DISP1WB_DEST(x)		(x << 10)
>  #define GSC_BLK_SW_RESET_WB_DEST(x)	(1 << (18 + x))
>  #define GSC_BLK_PXLASYNC_LO_MASK_WB(x)	(0 << (14 + x))
>  #define GSC_BLK_GSCL_WB_IN_SRC_SEL(x)	(1 << (2 * x))
> -#define SYSREG_GSCBLK_CFG2		(S3C_VA_SYS + 0x2000)
> +#define SYSREG_GSCBLK_CFG2		0x2000
>  #define PXLASYNC_LO_MASK_CAMIF_GSCL(x)	(1 << (x))
> =20
>  #endif /* EXYNOS_REGS_GSC_H_ */
>=20
