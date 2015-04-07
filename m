From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFT PATCHv2] drm/exynos: Enable DP clock to fix display on
 Exynos5250 and other
Date: Tue, 07 Apr 2015 22:32:06 +0900
Message-ID: <5523DC56.6030108@samsung.com>
References: <1427472488-21454-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:28813 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754848AbbDGNcJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 09:32:09 -0400
In-reply-to: <1427472488-21454-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, stable@vger.kernel.org

On 2015=EB=85=84 03=EC=9B=94 28=EC=9D=BC 01:08, Krzysztof Kozlowski wro=
te:
> After adding display power domain for Exynos5250 in commit
> 2d2c9a8d0a4f ("ARM: dts: add display power domain for exynos5250") th=
e
> display on Chromebook Snow and others stopped working after boot.
>=20
> The reason for this suggested Andrzej Hajda: the DP clock was disable=
d.
> This clock is required by Display Port and is enabled by bootloader.
> However when FIMD driver probing was deferred, the display power doma=
in
> was turned off. This effectively reset the value of DP clock enable
> register.

Applied.

Thanks,
Inki Dae

>=20
> When exynos-dp is later probed, the clock is not enabled and display =
is
> not properly configured:
>=20
> exynos-dp 145b0000.dp-controller: Timeout of video streamclk ok
> exynos-dp 145b0000.dp-controller: unable to config video
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reported-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
> Fixes: 2d2c9a8d0a4f ("ARM: dts: add display power domain for exynos52=
50")
> Cc: <stable@vger.kernel.org>
>=20
> ---
>=20
> This should fix issue reported by Javier [1][2].
>=20
> Tested on Chromebook Snow (Exynos 5250). More testing would be great,
> especially on other Exynos 5xxx products.
>=20
> [1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/43889
> [2] http://thread.gmane.org/gmane.linux.ports.arm.kernel/400290
>=20
> Changes since v1:
> 1. Added missing exynos_drm_fimd.h.
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c  | 10 ++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.h | 15 +++++++++++++++
>  include/video/samsung_fimd.h             |  6 ++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd.h
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index bf17a60b40ed..1dbfba58f909 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -32,10 +32,16 @@
>  #include <drm/bridge/ptn3460.h>
> =20
>  #include "exynos_dp_core.h"
> +#include "exynos_drm_fimd.h"
> =20
>  #define ctx_from_connector(c)	container_of(c, struct exynos_dp_devic=
e, \
>  					connector)
> =20
> +static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_de=
vice *dp)
> +{
> +	return to_exynos_crtc(dp->encoder->crtc);
> +}
> +
>  static inline struct exynos_dp_device *
>  display_to_dp(struct exynos_drm_display *d)
>  {
> @@ -1070,6 +1076,8 @@ static void exynos_dp_poweron(struct exynos_dp_=
device *dp)
>  		}
>  	}
> =20
> +	fimd_dp_clock_enable(dp_to_crtc(dp), true);
> +
>  	clk_prepare_enable(dp->clock);
>  	exynos_dp_phy_init(dp);
>  	exynos_dp_init_dp(dp);
> @@ -1094,6 +1102,8 @@ static void exynos_dp_poweroff(struct exynos_dp=
_device *dp)
>  	exynos_dp_phy_exit(dp);
>  	clk_disable_unprepare(dp->clock);
> =20
> +	fimd_dp_clock_enable(dp_to_crtc(dp), false);
> +
>  	if (dp->panel) {
>  		if (drm_panel_unprepare(dp->panel))
>  			DRM_ERROR("failed to turnoff the panel\n");
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index c300e22da8ac..bdf0818dc8f5 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -32,6 +32,7 @@
>  #include "exynos_drm_fbdev.h"
>  #include "exynos_drm_crtc.h"
>  #include "exynos_drm_iommu.h"
> +#include "exynos_drm_fimd.h"
> =20
>  /*
>   * FIMD stands for Fully Interactive Mobile Display and
> @@ -1231,6 +1232,24 @@ static int fimd_remove(struct platform_device =
*pdev)
>  	return 0;
>  }
> =20
> +void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable)
> +{
> +	struct fimd_context *ctx =3D crtc->ctx;
> +	u32 val;
> +
> +	/*
> +	 * Only Exynos 5250, 5260, 5410 and 542x requires enabling DP/MIE
> +	 * clock. On these SoCs the bootloader may enable it but any
> +	 * power domain off/on will reset it to disable state.
> +	 */
> +	if (ctx->driver_data !=3D &exynos5_fimd_driver_data)
> +		return;
> +
> +	val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
> +	writel(DP_MIE_CLK_DP_ENABLE, ctx->regs + DP_MIE_CLKCON);
> +}
> +EXPORT_SYMBOL_GPL(fimd_dp_clock_enable);
> +
>  struct platform_driver fimd_driver =3D {
>  	.probe		=3D fimd_probe,
>  	.remove		=3D fimd_remove,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.h b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.h
> new file mode 100644
> index 000000000000..b4fcaa568456
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.h
> @@ -0,0 +1,15 @@
> +/*
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute  it and/or mo=
dify it
> + * under  the terms of  the GNU General  Public License as published=
 by the
> + * Free Software Foundation;  either version 2 of the  License, or (=
at your
> + * option) any later version.
> + */
> +
> +#ifndef _EXYNOS_DRM_FIMD_H_
> +#define _EXYNOS_DRM_FIMD_H_
> +
> +extern void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool =
enable);
> +
> +#endif /* _EXYNOS_DRM_FIMD_H_ */
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fim=
d.h
> index a20e4a3a8b15..847a0a2b399c 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -436,6 +436,12 @@
>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE		(1 << 0)
>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE		(0 << 0)
> =20
> +/* Display port clock control */
> +#define DP_MIE_CLKCON				0x27c
> +#define DP_MIE_CLK_DISABLE			0x0
> +#define DP_MIE_CLK_DP_ENABLE			0x2
> +#define DP_MIE_CLK_MIE_ENABLE			0x3
> +
>  /* Notes on per-window bpp settings
>   *
>   * Value	Win0	 Win1	  Win2	   Win3	    Win 4
>=20
