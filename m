From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Drop NONCONTIG flag for buffers
 allocated without IOMMU
Date: Wed, 01 Nov 2017 15:31:28 +0900
Message-ID: <59F96A40.5080101@samsung.com>
References: <CGME20171031162824eucas1p1d15c2ea1d529edd18e16506b26669b91@eucas1p1.samsung.com>
        <20171031162813.1546-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43439 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdKAGbc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 02:31:32 -0400
In-reply-to: <20171031162813.1546-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org



2017년 11월 01일 01:28에 Marek Szyprowski 이(가) 쓴 글:
> When no IOMMU is available, all GEM buffers allocated by Exynos DRM driver
> are contiguous, because of the underlying dma_alloc_attrs() function
> provides only such buffers. In such case it makes no sense to keep
> BO_NONCONTIG flag for the allocated GEM buffers. This allows to avoid
> failures for buffer contiguity checks in the subsequent operations on GEM
> objects.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> CC: stable@vger.kernel.org # v4.4+
> ---
> This issue is there since commit 0519f9a12d011 ("drm/exynos: add iommu
> support for exynos drm framework"), but this patch applies cleanly
> only to v4.4+ kernel releases due changes in the surrounding code.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 02f978bb9261..476c00fe1998 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -227,6 +227,13 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>  	if (IS_ERR(exynos_gem))
>  		return exynos_gem;
>  
> +	/*
> +	 * when no IOMMU is available, all allocated buffers are contiguous
> +	 * anyway, so drop EXYNOS_BO_NONCONTIG flag
> +	 */
> +	if (!is_drm_iommu_supported(dev))
> +		flags &= ~EXYNOS_BO_NONCONTIG;

Even through iommu isn't supported, there could be 3D GPU or other DMA devices which support IOMMU. Of course, in this case, at least one memory copy will be required to pass it to Display controller.
So I'm not clear yet and it would bring more dicussions here.

Thanks,
Inki Dae

> +
>  	/* set memory type and cache attribute from user side. */
>  	exynos_gem->flags = flags;
>  
> 
