From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD
 driver
Date: Fri, 27 Jun 2014 19:28:14 +0900
Message-ID: <004801cf91f2$80fcfb90$82f6f2b0$%han@samsung.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
 <1403863946-15492-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17953 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752827AbaF0K2R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:28:17 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7T00GFUP331QE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jun 2014 19:28:15 +0900 (KST)
In-reply-to: <1403863946-15492-2-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, June 27, 2014 7:12 PM, Ajay Kumar wrote:
> 
> Add the missing setting for DP CLKCON register.
> 
> This register is present on Exynos5 based FIMD controllers,
> and needs to be set if we are using DP.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++++++++++++
>  include/video/samsung_fimd.h                       |    4 ++++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt
> b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> index 2dad41b..12f3d7a 100644
> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -41,6 +41,7 @@ Optional Properties:
>  - samsung,power-domain: a phandle to FIMD power domain node.
>  - samsung,invert-vden: video enable signal is inverted
>  - samsung,invert-vclk: video clock signal is inverted
> +- samsung,output-type: Type of display output interface(DPI=0, DSI=1, DP=2)
>  - display-timings: timing settings for FIMD, as described in document [1].
>  		Can be used in case timings cannot be provided otherwise
>  		or to override timings provided by the panel.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 33161ad..aa74e90 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -72,6 +72,7 @@ struct fimd_driver_data {
>  	unsigned int has_shadowcon:1;
>  	unsigned int has_clksel:1;
>  	unsigned int has_limited_fmt:1;
> +	unsigned int has_dp_clkcon:1;
>  };
> 
>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
> @@ -88,6 +89,13 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>  	.timing_base = 0x20000,
>  	.has_shadowcon = 1,
> +	.has_dp_clkcon = 1,
> +};
> +
> +enum exynos_fimd_output_type {
> +	EXYNOS_FIMD_OUTPUT_DPI,
> +	EXYNOS_FIMD_OUTPUT_DSI,
> +	EXYNOS_FIMD_OUTPUT_DP,
>  };
> 
>  struct fimd_win_data {
> @@ -125,6 +133,8 @@ struct fimd_context {
>  	struct exynos_drm_panel_info panel;
>  	struct fimd_driver_data *driver_data;
>  	struct exynos_drm_display *display;
> +
> +	enum exynos_fimd_output_type exynos_fimd_output_type;
>  };
> 
>  static const struct of_device_id fimd_driver_dt_match[] = {
> @@ -331,6 +341,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>  	if (clkdiv > 1)
>  		val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
> 
> +	if (ctx->driver_data->has_dp_clkcon &&
> +		ctx->exynos_fimd_output_type == EXYNOS_FIMD_OUTPUT_DP)
> +		writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
> +
>  	writel(val, ctx->regs + VIDCON0);
>  }
> 
> @@ -924,6 +938,7 @@ static int fimd_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct fimd_context *ctx;
>  	struct resource *res;
> +	u32 fimd_output_type;
>  	int ret = -EINVAL;
> 
>  	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
> @@ -949,6 +964,14 @@ static int fimd_probe(struct platform_device *pdev)
>  		ctx->vidcon1 |= VIDCON1_INV_VDEN;
>  	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
>  		ctx->vidcon1 |= VIDCON1_INV_VCLK;
> +	if (!of_property_read_u32(dev->of_node, "samsung,output-type",
> +				&fimd_output_type)) {
> +		if ((fimd_output_type < EXYNOS_FIMD_OUTPUT_DPI) ||
> +		    (fimd_output_type > EXYNOS_FIMD_OUTPUT_DP))
> +			dev_err(dev, "invalid output type for FIMD\n");
> +		else
> +			ctx->exynos_fimd_output_type = fimd_output_type;
> +	}
> 
>  	ctx->bus_clk = devm_clk_get(dev, "fimd");
>  	if (IS_ERR(ctx->bus_clk)) {
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index b039320..d8f4b0b 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -435,6 +435,10 @@
>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE		(1 << 0)
>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE		(0 << 0)
> 
> +/* Video clock enable for DP */
> +#define DP_CLKCON				0x27C
> +#define DP_CLK_ENABLE				0x2
> +
>  /* Notes on per-window bpp settings
>   *
>   * Value	Win0	 Win1	  Win2	   Win3	    Win 4
> --
> 1.7.9.5
