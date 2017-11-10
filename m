From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Drop NONCONTIG flag for buffers
 allocated without IOMMU
Date: Fri, 10 Nov 2017 12:04:55 +0900
Message-ID: <5A051757.9020101@samsung.com>
References: <CGME20171031162824eucas1p1d15c2ea1d529edd18e16506b26669b91@eucas1p1.samsung.com>
        <20171031162813.1546-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <20171031162813.1546-1-m.szyprowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



2017년 11월 01일 01:28에 Marek Szyprowski 이(가) 쓴 글:
> When no IOMMU is available, all GEM buffers allocated by Exynos DRM driver
> are contiguous, because of the underlying dma_alloc_attrs() function
> provides only such buffers. In such case it makes no sense to keep

What if user disabled CMA support? In this case, it guarantees also to allocate physically contiguous memory?
I think it depends on CMA support so wouldn't be true.

Real problem I think is that user don't know whether the gem buffer allocated with CONTIG or NONCONTIG flag can be used as a SCANOUT buffer.
So user can request a page flip with NONCONTIG buffer to kernel which doesn't support IOMMU.

And another is that user may want to use NONCONTIG buffer for another purpose, not scanout.
So if we enforce on using CONTIG buffer on kernel without IOMMU support, then it wouldn't be really what user intended.

My idea is to provide a new flag - i.e., EXYNOS_BO_SCANOUT - which can allocate a buffer with a different allocation type - CONTIG or NONCONTIG - according to IOMMU support.
And any page flip request with NONCONTIG buffer to kernel without IOMMU support should fail and it has to return a error with a proper error message.

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

So this could be a tempararily solution until the new flag is added, and you may need to modify above comments.

Thanks,
Inki Dae

> +
>  	/* set memory type and cache attribute from user side. */
>  	exynos_gem->flags = flags;
>  
> 
