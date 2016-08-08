From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] exynos-drm: Fix unsupported GEM memory type error
 message to be clear
Date: Mon, 8 Aug 2016 18:56:57 +0200
Message-ID: <20160808165657.GB5959@kozik-book>
References: <1470448206-16538-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33750 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752348AbcHHQ5H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 12:57:07 -0400
Content-Disposition: inline
In-Reply-To: <1470448206-16538-1-git-send-email-shuahkh@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Fri, Aug 05, 2016 at 07:50:06PM -0600, Shuah Khan wrote:
> Fix unsupported GEM memory type error message to include the memory type
> information.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index e016640..c9315df 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -55,11 +55,11 @@ static int check_fb_gem_memory_type(struct drm_device *drm_dev,
>  	flags = exynos_gem->flags;
>  
>  	/*
> -	 * without iommu support, not support physically non-continuous memory
> +	 * without iommu support, not support physically non-contiguous memory

While at it, how about changing entire sentence to something in English? :)

Best regards,
Krzysztof

>  	 * for framebuffer.
>  	 */
>  	if (IS_NONCONTIG_BUFFER(flags)) {
> -		DRM_ERROR("cannot use this gem memory type for fb.\n");
> +		DRM_ERROR("Non-continguous GEM memory is not supported.\n");
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
