From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 2/5] drm/exynos: fimd: add Exynos3 SoC support
Date: Mon, 18 Aug 2014 11:22:44 +0200
Message-ID: <53F1C5E4.2030804@samsung.com>
References: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
 <1408350093-26220-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21777 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaHRJWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 05:22:52 -0400
In-reply-to: <1408350093-26220-3-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 08/18/2014 10:21 AM, Inki Dae wrote:
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
--
Regards
Andrzej
> ---
>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   10 ++++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> index ecc899b..4e6c77c 100644
> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -9,6 +9,7 @@ Required properties:
>  		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
>  		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
>  		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
> +		"samsung,exynos3250-fimd"; /* for Exynos3250/3472 SoCs */
>  		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
>  		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 5d09e33..909e647 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -104,6 +104,14 @@ static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>  	.has_limited_fmt = 1,
>  };
>  
> +static struct fimd_driver_data exynos3_fimd_driver_data = {
> +	.timing_base = 0x20000,
> +	.lcdblk_offset = 0x210,
> +	.lcdblk_bypass_shift = 1,
> +	.has_shadowcon = 1,
> +	.has_vidoutcon = 1,
> +};
> +
>  static struct fimd_driver_data exynos4_fimd_driver_data = {
>  	.timing_base = 0x0,
>  	.lcdblk_offset = 0x210,
> @@ -168,6 +176,8 @@ struct fimd_context {
>  static const struct of_device_id fimd_driver_dt_match[] = {
>  	{ .compatible = "samsung,s3c6400-fimd",
>  	  .data = &s3c64xx_fimd_driver_data },
> +	{ .compatible = "samsung,exynos3250-fimd",
> +	  .data = &exynos3_fimd_driver_data },
>  	{ .compatible = "samsung,exynos4210-fimd",
>  	  .data = &exynos4_fimd_driver_data },
>  	{ .compatible = "samsung,exynos5250-fimd",
