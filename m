From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: mixer: simplify mixer_cfg_rgb_fmt()
Date: Mon, 06 Mar 2017 09:22:16 +0100
Message-ID: <d1a34f61-b3b2-c41b-ee3b-ba9583104d2a@samsung.com>
References: <CGME20170303134134epcas1p2195b73b9ab0c5011ac2c53f39699eb33@epcas1p2.samsung.com>
 <1488548452-4011-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12088 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752580AbdCFIWW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 03:22:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMD00IVSWL6K180@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Mar 2017 08:22:18 +0000 (GMT)
In-reply-to: <1488548452-4011-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Hi Tobias,

On 03.03.2017 14:40, Tobias Jakobi wrote:
> Convert if-statements to switch statement. Removes
> duplicated code.
>
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

Good change.
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

One small nitpick.
As I see this conditional/switch is to decide about BT standard
depending on the height. The similar problem is addressed in exynos-gsc
patches [1].
It would be good to have the same criteria to distinguish SD/HD mode. I
think ((height > 576) || (width > 720)) is more generic, in this case
even (height > 576) looks better, but as this changes logic of the code
it could be in separate patch.

[1]: https://lkml.org/lkml/2017/2/21/864

Regards
Andrzej

>  
>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
