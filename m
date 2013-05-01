From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: fimd: Get signal polarities from device tree
Date: Wed, 1 May 2013 22:00:25 +0200
Message-ID: <20130501200025.GE5763@phenom.ffwll.local>
References: <1367435169-15025-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:60250 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755916Ab3EAT5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:57:22 -0400
Received: by mail-wg0-f43.google.com with SMTP id c11so1691303wgh.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:57:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1367435169-15025-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Dave Airlie <airlied@gmail.com>

On Wed, May 01, 2013 at 09:06:09PM +0200, Tomasz Figa wrote:
> This patch modifies the driver to perform two stage parsing of video
> timings from device tree, to get timing information as struct videomode,
> which contains more data than struct fb_videomode.
> 
> Thanks to this change, information about polarity of control signals
> (VSYNC, HSYNC, VDEN, VCLK) can be retrieved, in addition to standard
> video timings.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Since the drm mode struct also contains flags for sync polarity ... why is
there no direct of -> drm_mode function? Going through an fb videomode in
a kms drm driver looks _really_ backwards to me.

Cc'in Dave for the fun of it ;-)

Cheers, Daniel

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index a1669d4..9023efa 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -21,7 +21,9 @@
>  #include <linux/pm_runtime.h>
>  
>  #include <video/of_display_timing.h>
> +#include <video/of_videomode.h>
>  #include <video/samsung_fimd.h>
> +#include <video/videomode.h>
>  #include <drm/exynos_drm.h>
>  
>  #include "exynos_drm_drv.h"
> @@ -928,18 +930,30 @@ static int fimd_probe(struct platform_device *pdev)
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
>  
>  	if (pdev->dev.of_node) {
> +		struct videomode vm;
> +
>  		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  		if (!pdata) {
>  			DRM_ERROR("memory allocation for pdata failed\n");
>  			return -ENOMEM;
>  		}
>  
> -		ret = of_get_fb_videomode(dev->of_node, &pdata->panel.timing,
> -					OF_USE_NATIVE_MODE);
> +		ret = of_get_videomode(dev->of_node, &vm, OF_USE_NATIVE_MODE);
>  		if (ret) {
>  			DRM_ERROR("failed: of_get_fb_videomode() : %d\n", ret);
>  			return ret;
>  		}
> +
> +		fb_videomode_from_videomode(&vm, &pdata->panel.timing);
> +
> +		if (vm.flags & DISPLAY_FLAGS_VSYNC_LOW)
> +			pdata->vidcon1 |= VIDCON1_INV_VSYNC;
> +		if (vm.flags & DISPLAY_FLAGS_HSYNC_LOW)
> +			pdata->vidcon1 |= VIDCON1_INV_HSYNC;
> +		if (vm.flags & DISPLAY_FLAGS_DE_LOW)
> +			pdata->vidcon1 |= VIDCON1_INV_VDEN;
> +		if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> +			pdata->vidcon1 |= VIDCON1_INV_VCLK;
>  	} else {
>  		pdata = pdev->dev.platform_data;
>  		if (!pdata) {
> -- 
> 1.8.2.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
