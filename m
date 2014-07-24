From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: dsi: add LPM (Low Power Mode) transfer
 support
Date: Thu, 24 Jul 2014 12:48:09 +0200
Message-ID: <53D0E469.8010308@samsung.com>
References: <1405680964-6869-1-git-send-email-inki.dae@samsung.com>
 <1405680964-6869-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1405680964-6869-3-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: Thierry Reding <treding@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

+CC: Thierry and Alexandre

On 07/18/2014 12:56 PM, Inki Dae wrote:
> This patch adds LPM transfer support for video or command data.
>
> With this patch, Exynos MIPI DSI controller can transfer command or
> video data with HS or LP mode in accordance with mode_flags set
> by LCD Panel driver.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 2df3592..b120554 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -426,13 +426,28 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
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

Maybe I missed sth but it seems to me slightly unrelated to LPM flag.
According to specs some panels can require this clock even in LPM mode.
I wonder if recently introduced  MIPI_DSI_CLOCK_NON_CONTINUOUS wouldn't
handle it.

>  	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
>  
>  	return 0;
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
>  static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
>  {
>  	u32 reg;
> @@ -575,6 +590,9 @@ static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
>  {
>  	u32 reg;
>  
> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_LPM))
> +		exynos_dsi_enable_hs_clock(dsi, true);
> +

It does not care about enable argument of the function, I guess it should.

Regards
Andrzej

>  	reg = readl(dsi->reg_base + DSIM_MDRESOL_REG);
>  	if (enable)
>  		reg |= DSIM_MAIN_STAND_BY;
