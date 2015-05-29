From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v9 13/18] drm/exynos: add exynos specific .atomic_commit()
Date: Fri, 29 May 2015 15:21:25 +0900
Message-ID: <55680565.3070603@samsung.com>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
 <1432849376-12828-14-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36443 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755244AbbE2GVT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 02:21:19 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP301Z0ULNC1M60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 May 2015 15:21:12 +0900 (KST)
In-reply-to: <1432849376-12828-14-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 05/29/2015 06:42 AM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> exynos needs to update planes with the crtc enabled (mainly for the FIMD
> case) so this specific atomic commit changes the order of
> drm_atomic_helper_commit_modeset_enables() and
> drm_atomic_helper_commit_planes() to commit planes after we enable crtc
> and encoders.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index 05d229c..b11047c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <uapi/drm/exynos_drm.h>
>  
> @@ -270,7 +271,31 @@ static int exynos_atomic_commit(struct drm_device *dev,
>  				struct drm_atomic_state *state,
>  				bool async)
>  {
> -	return drm_atomic_helper_commit(dev, state, false);
> +	int ret;
> +
> +	ret = drm_atomic_helper_prepare_planes(dev, state);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * This is the point of no return
> +	 */

Just oneline comment is enough.

> +
> +	drm_atomic_helper_swap_state(dev, state);
> +
> +	drm_atomic_helper_commit_modeset_disables(dev, state);
> +
> +	drm_atomic_helper_commit_modeset_enables(dev, state);

Maybe need description as comments about why need to change operation
order.

> +
> +	drm_atomic_helper_commit_planes(dev, state);
> +
> +	drm_atomic_helper_wait_for_vblanks(dev, state);
> +
> +	drm_atomic_helper_cleanup_planes(dev, state);
> +
> +	drm_atomic_state_free(state);
> +
> +	return 0;
>  }
>  
>  static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
> 
