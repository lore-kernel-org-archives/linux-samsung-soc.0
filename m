From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos/dsi: Add runtime PM so LCD power domain
 could be turned off
Date: Fri, 14 Nov 2014 11:53:14 +0900
Message-ID: <54656E9A.8040702@samsung.com>
References: <1415368439-23642-1-git-send-email-k.kozlowski@samsung.com>
 <1415368439-23642-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22679 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933080AbaKNCxR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 21:53:17 -0500
In-reply-to: <1415368439-23642-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Hilman <khilman@kernel.org>

On 2014=EB=85=84 11=EC=9B=94 07=EC=9D=BC 22:53, Krzysztof Kozlowski wro=
te:
> Add runtime Power Management to the Exynos DSI driver so the LCD powe=
r
> domain could be turned off.
>=20
> This slightly reduces the energy consumption when screen is completel=
y
> turned off. On Trats2 board when the system was idle the energy
> consumption dropped by 1% (from 92.2 mA to 91.1 mA).
>=20
> Before the patch:
> $ cat cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> lcd0-power-domain               on
>     /devices/11c00000.fimd                              suspended
>     /devices/11c80000.dsi                               unsupported
>=20
> After applying the patch:
> lcd0-power-domain               off
>     /devices/11c00000.fimd                              suspended
>     /devices/11c80000.dsi                               suspended

Reasonable but this patch incurs page flip test timeout like below,
# modetest -v -s 15@12:720x1280
trying to open device 'i915'...failed.
trying to open device 'radeon'...failed.
trying to open device 'nouveau'...failed.
trying to open device 'vmwgfx'...failed.
trying to open device 'omapdrm'...failed.
trying to open device 'exynos'...success.
setting mode 720x1280-0Hz@XR24 on connectors 15, crtc 12
select timed out or error (ret 0)

I'm not sure why this issue is incurred with this patch even through
this patch is reasonable and correct. So we need more checking.

P.S. I tested it on exynos-drm-next and m0 board.

Thanks,
Inki Dae

>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> index 24741d8758e8..19ed36d2d557 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -21,6 +21,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/component.h>
> =20
> @@ -1356,6 +1357,8 @@ static int exynos_dsi_enable(struct exynos_dsi =
*dsi)
>  	if (dsi->state & DSIM_STATE_ENABLED)
>  		return 0;
> =20
> +	pm_runtime_get_sync(dsi->dev);
> +
>  	ret =3D exynos_dsi_poweron(dsi);
>  	if (ret < 0)
>  		return ret;
> @@ -1392,6 +1395,8 @@ static void exynos_dsi_disable(struct exynos_ds=
i *dsi)
>  	drm_panel_unprepare(dsi->panel);
>  	exynos_dsi_poweroff(dsi);
> =20
> +	pm_runtime_put_sync(dsi->dev);
> +
>  	dsi->state &=3D ~DSIM_STATE_ENABLED;
>  }
> =20
> @@ -1772,6 +1777,8 @@ static int exynos_dsi_probe(struct platform_dev=
ice *pdev)
>  	if (ret)
>  		goto err_del_component;
> =20
> +	pm_runtime_enable(&pdev->dev);
> +
>  	return ret;
> =20
>  err_del_component:
> @@ -1781,6 +1788,8 @@ err_del_component:
> =20
>  static int exynos_dsi_remove(struct platform_device *pdev)
>  {
> +	pm_runtime_disable(&pdev->dev);
> +
>  	component_del(&pdev->dev, &exynos_dsi_component_ops);
>  	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> =20
>=20
