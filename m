From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: dsi: add LPM (Low Power Mode) transfer
 support
Date: Mon, 28 Jul 2014 17:50:50 +0200
Message-ID: <53D6715A.5040604@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38690 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707AbaG1Puy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 11:50:54 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9F005BWIOR73C0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 16:50:51 +0100 (BST)
In-reply-to: <1406512857-7213-3-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, treding@nvidia.com

On 07/28/2014 04:00 AM, Inki Dae wrote:
> This patch adds LPM transfer support for video or command data.
>
> With this patch, Exynos MIPI DSI controller can transfer command or
> video data with HS or LP mode in accordance with mode_flags set
> by LCD Panel driver.
>
> Changelog v2: Enable High Speed clock only in case of stand by request.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 5e78d45..1bed105 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -493,8 +493,11 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
>  			| DSIM_ESC_PRESCALER(esc_div)
>  			| DSIM_LANE_ESC_CLK_EN_CLK
>  			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
> -			| DSIM_BYTE_CLK_SRC(0)
> -			| DSIM_TX_REQUEST_HSCLK;
> +			| DSIM_BYTE_CLK_SRC(0);
> +
> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM))
> +		reg |= DSIM_TX_REQUEST_HSCLK;
> +
>  	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>  
>  	return 0;
> @@ -553,6 +556,18 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
>  	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
>  }
>  
> +static void exynos_dsi_enable_hs_clock(struct exynos_dsi *dsi,
> +					bool enable)
> +{
> +	u32 reg = readl(dsi->reg_base + DSIM_CLKCTRL_REG);
> +
> +	reg &= ~DSIM_TX_REQUEST_HSCLK;
> +	if (enable)
> +		reg |= DSIM_TX_REQUEST_HSCLK;
> +
> +	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
> +}
> +

I have tested DSIM_TX_REQUEST_HSCLK bit on trats device(video mode HS) -
it works with and without the bit set.
So I start to suspect this bit is not just for simply enable/disable HS
clock as function name suggests, do you know what is its
exact meaning? The specs are quite succinct on it.
On the other side I have found DSIM_TX_LPDT_LP and DSIM_CMD_LPDT_LP bits
in DSIM_ESCMODE register
which seems to be related to flags you have introduced:
- DSIM_CMD_LPDT_LP - transmit commands in LP mode,
- DSIM_TX_LPDT_LP - transmit data in LP mode.
The former is already triggered by MIPI_DSI_MSG_USE_LPM flag. Why do not
you use the latter?

Regards
Andrzej

>  static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
>  {
>  	u32 reg;
> @@ -705,6 +720,9 @@ static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
>  {
>  	u32 reg;
>  
> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_LPM) && enable)
> +		exynos_dsi_enable_hs_clock(dsi, true);
> +
>  	reg = readl(dsi->reg_base + DSIM_MDRESOL_REG);
>  	if (enable)
>  		reg |= DSIM_MAIN_STAND_BY;
