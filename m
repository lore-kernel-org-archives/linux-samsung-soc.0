From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC v3 PATCH v2 10/16] drm/exynos: dsi: add driver data to
 support Exynos5420
Date: Tue, 29 Apr 2014 20:56:57 +0530
Message-ID: <CAK9yfHwY85FuMvTQo-HUKocyXkjjK9=5-oXVd9CL8hS7B5++=A@mail.gmail.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
	<1398563412-21781-11-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:48495 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758044AbaD2P06 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 11:26:58 -0400
Received: by mail-ob0-f175.google.com with SMTP id wp4so414167obc.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2014 08:26:57 -0700 (PDT)
In-Reply-To: <1398563412-21781-11-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On 27 April 2014 07:20, YoungJun Cho <yj44.cho@samsung.com> wrote:
> The offset of register DSIM_PLLTMR_REG in Exynos5420 is different
> from the one in Exynos4 SoC.
>
> In case of Exynos5420 SoC, there is no frequency band bit in DSIM_PLLCTRL_REG,
> and it uses DSIM_PHYCTRL_REG and DSIM_PHYTIMING*_REG instead.
> So this patch adds driver data to distinguish it.
>
> Changelog v2:
> - Moves exynos_dsi_enable_clocks() after exynos_dsi_reset()
>   (commented by Andrzej Hajda)
> - Splits D-PHY control setting routines from PLL setting one
>   (commented by Andrzej Hajda)
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |  154 ++++++++++++++++++++++++++-----
>  1 file changed, 132 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 4a918ec..c18dba3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -17,6 +17,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/irq.h>
> +#include <linux/of_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -54,9 +55,12 @@
>
>  /* FIFO memory AC characteristic register */
>  #define DSIM_PLLCTRL_REG       0x4c    /* PLL control register */
> -#define DSIM_PLLTMR_REG                0x50    /* PLL timer register */
>  #define DSIM_PHYACCHR_REG      0x54    /* D-PHY AC characteristic register */
>  #define DSIM_PHYACCHR1_REG     0x58    /* D-PHY AC characteristic register1 */
> +#define DSIM_PHYCTRL_REG       0x5c
> +#define DSIM_PHYTIMING_REG     0x64
> +#define DSIM_PHYTIMING1_REG    0x68
> +#define DSIM_PHYTIMING2_REG    0x6c
>
>  /* DSIM_STATUS */
>  #define DSIM_STOP_STATE_DAT(x)         (((x) & 0xf) << 0)
> @@ -200,6 +204,21 @@
>  #define DSIM_PLL_M(x)                  ((x) << 4)
>  #define DSIM_PLL_S(x)                  ((x) << 1)
>
> +/* DSIM_PHYTIMING */
> +#define DSIM_PHYTIMING_LPX(x)          ((x) << 8)
> +#define DSIM_PHYTIMING_HS_EXIT(x)      ((x) << 0)
> +
> +/* DSIM_PHYTIMING1 */
> +#define DSIM_PHYTIMING1_CLK_PREPARE(x) ((x) << 24)
> +#define DSIM_PHYTIMING1_CLK_ZERO(x)    ((x) << 16)
> +#define DSIM_PHYTIMING1_CLK_POST(x)    ((x) << 8)
> +#define DSIM_PHYTIMING1_CLK_TRAIL(x)   ((x) << 0)
> +
> +/* DSIM_PHYTIMING2 */
> +#define DSIM_PHYTIMING2_HS_PREPARE(x)  ((x) << 16)
> +#define DSIM_PHYTIMING2_HS_ZERO(x)     ((x) << 8)
> +#define DSIM_PHYTIMING2_HS_TRAIL(x)    ((x) << 0)
> +
>  #define DSI_MAX_BUS_WIDTH              4
>  #define DSI_NUM_VIRTUAL_CHANNELS       4
>  #define DSI_TX_FIFO_SIZE               2048
> @@ -233,6 +252,12 @@ struct exynos_dsi_transfer {
>  #define DSIM_STATE_INITIALIZED         BIT(1)
>  #define DSIM_STATE_CMD_LPM             BIT(2)
>
> +struct exynos_dsi_driver_data {

Shouldn't this be static?

> +       unsigned int plltmr_reg;
> +

nit: stray blank line

> +       unsigned int has_freqband:1;
> +};
> +

<snip>

> +static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
> +{
> +       struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
> +       u32 reg;
> +
> +       if (driver_data->has_freqband)
> +               return;
> +
> +       /* B D-PHY */
> +       reg = 0x0af & 0x1ff;

Please use macros instead of magic numbers.

-- 
With warm regards,
Sachin
