From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH 1/3] drm/exynos: mixer: add 2x scaling to
 mixer_graph_buffer
Date: Thu, 26 Mar 2015 11:26:15 -0300
Message-ID: <20150326142615.GA18573@joana>
References: <1427325438-3791-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38025 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725AbbCZO0X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 10:26:23 -0400
Content-Disposition: inline
In-Reply-To: <1427325438-3791-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Tobias,

2015-03-26 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> While the VP (video processor) supports arbitrary scaling
> of its input, the mixer just supports a simple 2x (line
> doubling) scaling. Expose this functionality and exit
> early when an unsupported scaling configuration is
> encountered.
> 
> This was tested with modetest's DRM plane test (from
> the libdrm test suite) on an Odroid-X2 (Exynos4412).
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 38 +++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index df547b6..7c38d3b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -521,12 +521,37 @@ static void mixer_layer_update(struct mixer_context *ctx)
>  	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
>  }
>  
> +static int mixer_setup_scale(unsigned int src_w, unsigned int src_h,
> +	unsigned int dst_w, unsigned int dst_h,
> +	unsigned int *scale_w, unsigned int *scale_h)

I would keep calling these two vars x_ratio and y_ratio. I don't see a reason
to change the name here.

> +{
> +	if (dst_w != src_w) {
> +		if (dst_w == 2 * src_w)
> +			*scale_w = 1;
> +		else
> +			goto fail;
> +	}
> +
> +	if (dst_h != src_h) {
> +		if (dst_h == 2 * src_h)
> +			*scale_h = 1;
> +		else
> +			goto fail;
> +	}
> +
> +	return 0;
> +
> +fail:
> +	DRM_DEBUG_KMS("only 2x width/height scaling of plane supported\n");
> +	return -1;

Use EPERM or ENOTSUPP. Or even true/false.

> +}
> +
>  static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	unsigned long flags;
>  	struct hdmi_win_data *win_data;
> -	unsigned int x_ratio, y_ratio;
> +	unsigned int x_ratio = 0, y_ratio = 0;
>  	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
>  	dma_addr_t dma_addr;
>  	unsigned int fmt;
> @@ -550,9 +575,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  		fmt = ARGB8888;
>  	}
>  
> -	/* 2x scaling feature */
> -	x_ratio = 0;
> -	y_ratio = 0;
> +	/* check if mixer supports scaling setup */
> +	if (mixer_setup_scale(win_data->src_width, win_data->src_height,
> +		win_data->crtc_width, win_data->crtc_height,
> +		&x_ratio, &y_ratio)) return;

You need to fix style here

        if (mixer_setup_scale(win_data->src_width, win_data->src_height,        
                              win_data->crtc_width, win_data->crtc_height,      
                              &x_ratio, &y_ratio))                              
                return; 


I think your patch is good after these things get fixes and we can go with it
and drop mine. Then I'll just rebase the alpha channel fix patch on top of
this one.

	Gustavo
