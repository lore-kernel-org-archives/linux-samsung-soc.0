From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: enable/disable blend based on pixel format
Date: Fri, 17 Apr 2015 15:16:50 +0900
Message-ID: <5530A552.7060600@samsung.com>
References: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
 <1426775270-31137-3-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62524 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370AbbDQGQx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Apr 2015 02:16:53 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NMX007E9TG2NM20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Apr 2015 15:16:50 +0900 (KST)
In-reply-to: <1426775270-31137-3-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Gustavo,

On 03/19/2015 11:27 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Change the switch to use the pixel_format instead of bpp to figure out
> if we need to enable or disable the layer blending.
> 

The default concept is ok about enable or disable of pixel blending
feature by pixel_format, but it will make to possible blending with
background layer. I'm not sure whether it's proper or not.

Thanks.

> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 7aff88f..0c54098 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -529,7 +529,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  	unsigned int x_ratio, y_ratio;
>  	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
>  	dma_addr_t dma_addr;
> -	unsigned int fmt;
> +	unsigned int fmt, blend;
>  	u32 val;
>  
>  	win_data = &ctx->win_data[win];
> @@ -539,15 +539,26 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  	#define ARGB4444 6
>  	#define ARGB8888 7
>  
> -	switch (win_data->bpp) {
> -	case 16:
> +	switch (win_data->pixel_format) {
> +	case DRM_FORMAT_ARGB4444:
>  		fmt = ARGB4444;
> +		blend = 1;
>  		break;
> -	case 32:
> +
> +	case DRM_FORMAT_ARGB8888:
> +		fmt = ARGB8888;
> +		blend = 1;
> +		break;
> +
> +	case DRM_FORMAT_XRGB8888:
>  		fmt = ARGB8888;
> +		blend = 0;
>  		break;
> +
>  	default:
>  		fmt = ARGB8888;
> +		blend = 0;
> +		break;
>  	}
>  
>  	if (win_data->crtc_width != win_data->src_width ||
> @@ -586,6 +597,16 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win),
>  			win_data->fb_pitch / (win_data->bpp >> 3));
>  
> +	if (blend) {
> +		val = MXR_GRP_CFG_BLEND_PRE_MUL;
> +		val |= MXR_GRP_CFG_PIXEL_BLEND_EN;
> +	} else {
> +		val = 0;
> +	}
> +	mixer_reg_writemask(res, MXR_GRAPHIC_CFG(win), val,
> +			    MXR_GRP_CFG_BLEND_PRE_MUL
> +			    | MXR_GRP_CFG_PIXEL_BLEND_EN);
> +
>  	/* setup display size */
>  	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
>  		win == MIXER_DEFAULT_WIN) {
> 
