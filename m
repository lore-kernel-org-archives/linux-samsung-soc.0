From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v14 11/17] drm: bridge: analogix/dp: add some rk3288
 special registers setting
Date: Fri, 18 Mar 2016 14:56:05 +0800
Message-ID: <56EBA685.4070508@gmail.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <1455534654-1966-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34769 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932AbcCRG4R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 02:56:17 -0400
In-Reply-To: <1455534654-1966-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-rockchip@lists.infradead.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, djkurtz@chromium.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>, ajaynumb



=E5=9C=A8 2016=E5=B9=B402=E6=9C=8815=E6=97=A5 19:10, Yakir Yang =E5=86=99=
=E9=81=93:
> RK3288 need some special registers setting, we can separate
> them out by the dev_type of plat_data.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

Tested-by: Caesar Wang <wxt@rock-chips.com>

> ---
> Changes in v14: None
> Changes in v13: None
> Changes in v12: None
> Changes in v11: None
> Changes in v10: None
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Fix compile failed dut to phy_pd_addr variable misspell error
>
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 76 ++++++++++++=
++---------
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 12 ++++
>   2 files changed, 60 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/driv=
ers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 3858df5..1e24b37 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -15,6 +15,8 @@
>   #include <linux/delay.h>
>   #include <linux/gpio.h>
>  =20
> +#include <drm/bridge/analogix_dp.h>
> +
>   #include "analogix_dp_core.h"
>   #include "analogix_dp_reg.h"
>  =20
> @@ -72,6 +74,14 @@ void analogix_dp_init_analog_param(struct analogix=
_dp_device *dp)
>   	reg =3D SEL_24M | TX_DVDD_BIT_1_0625V;
>   	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_2);
>  =20
> +	if (dp->plat_data && (dp->plat_data->dev_type =3D=3D RK3288_DP)) {
> +		writel(REF_CLK_24M, dp->reg_base + ANALOGIX_DP_PLL_REG_1);
> +		writel(0x95, dp->reg_base + ANALOGIX_DP_PLL_REG_2);
> +		writel(0x40, dp->reg_base + ANALOGIX_DP_PLL_REG_3);
> +		writel(0x58, dp->reg_base + ANALOGIX_DP_PLL_REG_4);
> +		writel(0x22, dp->reg_base + ANALOGIX_DP_PLL_REG_5);
> +	}
> +

In general, I will say what's mean for the number.

Okay that's the rk3288 special registers setting.

>   	reg =3D DRIVE_DVDD_BIT_1_0625V | VCO_BIT_600_MICRO;
>   	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_3);
>  =20
> @@ -206,81 +216,85 @@ void analogix_dp_set_analog_power_down(struct a=
nalogix_dp_device *dp,
>   				       bool enable)
>   {
>   	u32 reg;
> +	u32 phy_pd_addr =3D ANALOGIX_DP_PHY_PD;
> +
> +	if (dp->plat_data && (dp->plat_data->dev_type =3D=3D RK3288_DP))
> +		phy_pd_addr =3D ANALOGIX_DP_PD;
>  =20
>   	switch (block) {
>   	case AUX_BLOCK:
>   		if (enable) {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg |=3D AUX_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg &=3D ~AUX_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	case CH0_BLOCK:
>   		if (enable) {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg |=3D CH0_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg &=3D ~CH0_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	case CH1_BLOCK:
>   		if (enable) {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg |=3D CH1_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg &=3D ~CH1_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	case CH2_BLOCK:
>   		if (enable) {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg |=3D CH2_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg &=3D ~CH2_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	case CH3_BLOCK:
>   		if (enable) {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg |=3D CH3_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg &=3D ~CH3_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	case ANALOG_TOTAL:
>   		if (enable) {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg |=3D DP_PHY_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			reg =3D readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			reg =3D readl(dp->reg_base + phy_pd_addr);
>   			reg &=3D ~DP_PHY_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	case POWER_ALL:
>   		if (enable) {
>   			reg =3D DP_PHY_PD | AUX_PD | CH3_PD | CH2_PD |
>   				CH1_PD | CH0_PD;
> -			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(reg, dp->reg_base + phy_pd_addr);
>   		} else {
> -			writel(0x00, dp->reg_base + ANALOGIX_DP_PHY_PD);
> +			writel(0x00, dp->reg_base + phy_pd_addr);
>   		}
>   		break;
>   	default:
> @@ -399,8 +413,14 @@ void analogix_dp_init_aux(struct analogix_dp_dev=
ice *dp)
>   	analogix_dp_reset_aux(dp);
>  =20
>   	/* Disable AUX transaction H/W retry */
> -	reg =3D AUX_BIT_PERIOD_EXPECTED_DELAY(3) | AUX_HW_RETRY_COUNT_SEL(0=
) |
> -	      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
> +	if (dp->plat_data && (dp->plat_data->dev_type =3D=3D RK3288_DP))
> +		reg =3D AUX_BIT_PERIOD_EXPECTED_DELAY(0) |
> +		      AUX_HW_RETRY_COUNT_SEL(3) |
> +		      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
> +	else
> +		reg =3D AUX_BIT_PERIOD_EXPECTED_DELAY(3) |
> +		      AUX_HW_RETRY_COUNT_SEL(0) |
> +		      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
>   	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_HW_RETRY_CTL);
>  =20
>   	/* Receive AUX Channel DEFER commands equal to DEFFER_COUNT*64 */
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/driv=
ers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> index 738db4c..337912b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> @@ -22,6 +22,14 @@
>   #define ANALOGIX_DP_VIDEO_CTL_8			0x3C
>   #define ANALOGIX_DP_VIDEO_CTL_10		0x44
>  =20
> +#define ANALOGIX_DP_PLL_REG_1			0xfc
> +#define ANALOGIX_DP_PLL_REG_2			0x9e4
> +#define ANALOGIX_DP_PLL_REG_3			0x9e8
> +#define ANALOGIX_DP_PLL_REG_4			0x9ec
> +#define ANALOGIX_DP_PLL_REG_5			0xa00
> +
> +#define ANALOGIX_DP_PD				0x12c
> +
>   #define ANALOGIX_DP_LANE_MAP			0x35C
>  =20
>   #define ANALOGIX_DP_ANALOG_CTL_1		0x370
> @@ -154,6 +162,10 @@
>   #define VSYNC_POLARITY_CFG			(0x1 << 1)
>   #define HSYNC_POLARITY_CFG			(0x1 << 0)
>  =20
> +/* ANALOGIX_DP_PLL_REG_1 */
> +#define REF_CLK_24M				(0x1 << 1)
> +#define REF_CLK_27M				(0x0 << 1)
> +
>   /* ANALOGIX_DP_LANE_MAP */
>   #define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
>   #define LANE3_MAP_LOGIC_LANE_1			(0x1 << 6)


--=20
Thanks,
Caesar
