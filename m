From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: forbid creating framebuffers from too small
 GEM buffers
Date: Tue, 8 Aug 2017 15:40:20 +0200
Message-ID: <41c67416-ba1a-a6fe-36e2-83c96f56a4f8@math.uni-bielefeld.de>
References: <CGME20170712100931eucas1p1bcc4da93969ed34797c984284d595b21@eucas1p1.samsung.com>
 <1499854165-10902-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:52596 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752070AbdHHNt0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 09:49:26 -0400
In-Reply-To: <1499854165-10902-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

Hello Marek,

I have a similar patch in my tree, so this one is

Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

- Tobias


Marek Szyprowski wrote:
> Add a check if the framebuffer described by the provided drm_mode_fb_cmd2
> structure fits into provided GEM buffers. Without this check it is
> possible to create a framebuffer object from a small buffer and set it to
> the hardware, what results in displaying system memory outside the
> allocated GEM buffer.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> CC: stable@vger.kernel.org # v4.7+
> ---
> This issue was there from the beggining, but the provided patch applies only
> to v4.7+ kernels due to other changes in the fixed code.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index d48fd7c918f8..73217c281c9a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -145,13 +145,19 @@ struct drm_framebuffer *
>  exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  		      const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> +	const struct drm_format_info *info = drm_get_format_info(dev, mode_cmd);
>  	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
>  	struct drm_gem_object *obj;
>  	struct drm_framebuffer *fb;
>  	int i;
>  	int ret;
>  
> -	for (i = 0; i < drm_format_num_planes(mode_cmd->pixel_format); i++) {
> +	for (i = 0; i < info->num_planes; i++) {
> +		unsigned int height = (i == 0) ? mode_cmd->height :
> +				     DIV_ROUND_UP(mode_cmd->height, info->vsub);
> +		unsigned long size = height * mode_cmd->pitches[i] +
> +				     mode_cmd->offsets[i];
> +
>  		obj = drm_gem_object_lookup(file_priv, mode_cmd->handles[i]);
>  		if (!obj) {
>  			DRM_ERROR("failed to lookup gem object\n");
> @@ -160,6 +166,12 @@ struct drm_framebuffer *
>  		}
>  
>  		exynos_gem[i] = to_exynos_gem(obj);
> +
> +		if (size > exynos_gem[i]->size) {
> +			i++;
> +			ret = -EINVAL;
> +			goto err;
> +		}
>  	}
>  
>  	fb = exynos_drm_framebuffer_init(dev, mode_cmd, exynos_gem, i);
> 
