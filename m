From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v3] drm/exynos: mixer: cleanup pixelformat handling
Date: Tue, 28 Apr 2015 15:44:30 +0900
Message-ID: <553F2C4E.2080400@samsung.com>
References: <1430169119-5015-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25487 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751611AbbD1GoZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Apr 2015 02:44:25 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNI00M1981VS130@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Apr 2015 15:44:19 +0900 (KST)
In-reply-to: <1430169119-5015-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 04/28/2015 06:11 AM, Tobias Jakobi wrote:
> Move the defines for the pixelformats that the mixer supports out
> of mixer_graph_buffer() to the top of the source.
> Then select the mixer pixelformat (pf) in mixer_graph_buffer() based on
> the plane's pf (and not bpp).
> Also add handling of RGB565 and XRGB1555 to the switch statement and
> exit early if the plane has an unsupported pf.
> 
> Partially based on 'drm/exynos: enable/disable blend based on pixel
> format' by Gustavo Padovan <gustavo.padovan@collabora.co.uk>.
> 
> v2: Use the shorter MXR_FORMAT as prefix.
> v3: Re-add ARGB8888 because of compatibility reasons
>     (suggested by Joonyoung Shim).
> 
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index fbec750..0474fd3 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -44,6 +44,12 @@
>  #define MIXER_WIN_NR		3
>  #define MIXER_DEFAULT_WIN	0
>  
> +/* The pixelformats that are natively supported by the mixer. */
> +#define MXR_FORMAT_RGB565	4
> +#define MXR_FORMAT_ARGB1555	5
> +#define MXR_FORMAT_ARGB4444	6
> +#define MXR_FORMAT_ARGB8888	7
> +
>  struct mixer_resources {
>  	int			irq;
>  	void __iomem		*mixer_regs;
> @@ -531,20 +537,27 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  
>  	plane = &ctx->planes[win];
>  
> -	#define RGB565 4
> -	#define ARGB1555 5
> -	#define ARGB4444 6
> -	#define ARGB8888 7
> +	switch (plane->pixel_format) {
> +	case DRM_FORMAT_XRGB4444:
> +		fmt = MXR_FORMAT_ARGB4444;
> +		break;
> +

Actually i don't prefer that use new blank line like above on switch
case statement.

> +	case DRM_FORMAT_XRGB1555:
> +		fmt = MXR_FORMAT_ARGB1555;
> +		break;
>  
> -	switch (plane->bpp) {
> -	case 16:
> -		fmt = ARGB4444;
> +	case DRM_FORMAT_RGB565:
> +		fmt = MXR_FORMAT_RGB565;
>  		break;
> -	case 32:
> -		fmt = ARGB8888;
> +
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +		fmt = MXR_FORMAT_ARGB8888;
>  		break;
> +
>  	default:
> -		fmt = ARGB8888;
> +		DRM_DEBUG_KMS("pixelformat unsupported by mixer\n");
> +		return;
>  	}
>  
>  	/* check if mixer supports requested scaling setup */
> 

If except minor comment,

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
