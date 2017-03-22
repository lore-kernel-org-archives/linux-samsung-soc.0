From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 1/2] drm/exynos: mixer: simplify mixer_cfg_rgb_fmt()
Date: Wed, 22 Mar 2017 12:18:11 +0100
Message-ID: <e6a5e1d6-a31b-758b-932d-8e2114114cdd@math.uni-bielefeld.de>
References: <1489152617-10425-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56640 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933647AbdCVLSS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 07:18:18 -0400
In-Reply-To: <1489152617-10425-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, inki.dae@samsung.com

Gentle ping.

- Tobias

Tobias Jakobi wrote:
> Convert if-statements to switch statement. Removes
> duplicated code.
> 
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 72143ac..41d0c36 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -382,29 +382,14 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	u32 val;
>  
> -	if (height == 480) {
> +	switch (height) {
> +	case 480:
> +	case 576:
>  		val = MXR_CFG_RGB601_0_255;
> -	} else if (height == 576) {
> -		val = MXR_CFG_RGB601_0_255;
> -	} else if (height == 720) {
> -		val = MXR_CFG_RGB709_16_235;
> -		mixer_reg_write(res, MXR_CM_COEFF_Y,
> -				(1 << 30) | (94 << 20) | (314 << 10) |
> -				(32 << 0));
> -		mixer_reg_write(res, MXR_CM_COEFF_CB,
> -				(972 << 20) | (851 << 10) | (225 << 0));
> -		mixer_reg_write(res, MXR_CM_COEFF_CR,
> -				(225 << 20) | (820 << 10) | (1004 << 0));
> -	} else if (height == 1080) {
> -		val = MXR_CFG_RGB709_16_235;
> -		mixer_reg_write(res, MXR_CM_COEFF_Y,
> -				(1 << 30) | (94 << 20) | (314 << 10) |
> -				(32 << 0));
> -		mixer_reg_write(res, MXR_CM_COEFF_CB,
> -				(972 << 20) | (851 << 10) | (225 << 0));
> -		mixer_reg_write(res, MXR_CM_COEFF_CR,
> -				(225 << 20) | (820 << 10) | (1004 << 0));
> -	} else {
> +		break;
> +	case 720:
> +	case 1080:
> +	default:
>  		val = MXR_CFG_RGB709_16_235;
>  		mixer_reg_write(res, MXR_CM_COEFF_Y,
>  				(1 << 30) | (94 << 20) | (314 << 10) |
> @@ -413,6 +398,7 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>  				(972 << 20) | (851 << 10) | (225 << 0));
>  		mixer_reg_write(res, MXR_CM_COEFF_CR,
>  				(225 << 20) | (820 << 10) | (1004 << 0));
> +		break;
>  	}
>  
>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
> 
