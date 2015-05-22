From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 1/5] drm/exynos: mixer: refactor layer setup
Date: Fri, 22 May 2015 18:12:21 +0900
Message-ID: <555EF2F5.5090701@samsung.com>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1430919410-9917-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32637 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946153AbbEVJMW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 05:12:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NOQ00M4MUWKIL30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 May 2015 18:12:21 +0900 (KST)
In-reply-to: <1430919410-9917-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

On 05/06/2015 10:36 PM, Tobias Jakobi wrote:
> First step in allowing a more generic way to setup complex
> blending for the different layers.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 90 ++++++++++++++++++++++++++++++-----
>  1 file changed, 79 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 4a1656b..e4a5e76 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -63,6 +63,11 @@ struct mixer_resources {
>  	struct clk		*mout_mixer;
>  };
>  
> +struct layer_config {
> +	unsigned int index;
> +	unsigned int priority;

I think layer index and priority information can go to struct
exynos_drm_plane.

> +};
> +
>  enum mixer_version_id {
>  	MXR_VER_0_0_0_16,
>  	MXR_VER_16_0_33_0,
> @@ -75,6 +80,8 @@ struct mixer_context {
>  	struct drm_device	*drm_dev;
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
> +	const struct layer_config *layer_config;
> +	unsigned int num_layer;
>  	int			pipe;
>  	bool			interlace;
>  	bool			powered;
> @@ -95,6 +102,40 @@ struct mixer_drv_data {
>  	bool					has_sclk;
>  };
>  
> +/*
> + * The default layer priorities. A higher priority means that
> + * the layer is at the top of layer stack.
> + * The current configuration assumes the following usage scenario:
> + * layer1: OSD [top]
> + * layer0: main framebuffer
> + * video layer: video overlay [bottom]
> + * Note that the video layer is only usable when the
> + * video processor is available.
> + */
> +
> +static const struct layer_config default_layer_config[] = {
> +	{
> +		.index = 0,			/* layer0 */
> +		.priority = 1
> +	}, {
> +		.index = 1,			/* layer1 */
> +		.priority = 2
> +	}
> +};
> +
> +static const struct layer_config vp_layer_config[] = {
> +	{
> +		.index = 2,			/* video layer */
> +		.priority = 1
> +	}, {
> +		.index = 0,			/* layer0 */
> +		.priority = 2
> +	}, {
> +		.index = 1,			/* layer1 */
> +		.priority = 3
> +	}
> +};
> +

I feel there is no reason to split config, actually video layer exists
and video layer isn't enabled if no vp even if we use 3 layer.
