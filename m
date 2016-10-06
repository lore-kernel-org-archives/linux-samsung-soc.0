From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] exynos-drm: Fix error messages to print flags and size
Date: Thu, 6 Oct 2016 15:09:31 +0200
Message-ID: <57F64D0B.5050506@math.uni-bielefeld.de>
References: <1470850236-9101-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56907 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932720AbcJFNJi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 09:09:38 -0400
In-Reply-To: <1470850236-9101-1-git-send-email-shuahkh@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

I think this patch was never picked up. So just a short 'ping' from my side.

With best wishes,
Tobias


Shuah Khan wrote:
> Fix exynos_drm_gem_create() error messages to include flags and size when
> flags and size are invalid.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index cdf9f1a..4c4cb0e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -231,12 +231,12 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>  	int ret;
>  
>  	if (flags & ~(EXYNOS_BO_MASK)) {
> -		DRM_ERROR("invalid flags.\n");
> +		DRM_ERROR("invalid GEM buffer flags: %u\n", flags);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (!size) {
> -		DRM_ERROR("invalid size.\n");
> +		DRM_ERROR("invalid GEM buffer size: %lu\n", size);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> 
