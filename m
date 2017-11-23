From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: gem: Drop NONCONTIG flag for buffers
 allocated without IOMMU
Date: Thu, 23 Nov 2017 14:38:18 +0900
Message-ID: <5A165ECA.5050903@samsung.com>
References: <CGME20171122131501eucas1p1557c57b70990b11084228e64d54726c2@eucas1p1.samsung.com>
        <20171122131447.25627-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <20171122131447.25627-1-m.szyprowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



2017년 11월 22일 22:14에 Marek Szyprowski 이(가) 쓴 글:
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
> 
> Changelog:
> v2:
> - added warning message when buffer flags are updadated (requested by Inki)
> 
> v1: https://patchwork.kernel.org/patch/10034919/
> - initial version
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 077de014d610..4400efe3974a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -247,6 +247,15 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>  	if (IS_ERR(exynos_gem))
>  		return exynos_gem;
>  
> +	if (!is_drm_iommu_supported(dev) && (flags & EXYNOS_BO_NONCONTIG)) {
> +		/*
> +		 * when no IOMMU is available, all allocated buffers are
> +		 * contiguous anyway, so drop EXYNOS_BO_NONCONTIG flag
> +		 */
> +		flags &= ~EXYNOS_BO_NONCONTIG;
> +		DRM_WARN("Non-contiguous allocation is not supported without IOMMU, falling back to contiguous buffer\n");

WARNING: line over 80 characters

I wil change above a warning like below if you are ok,
	DRM_WARN("Changed to CONTIG buffer due to no IOMMU support.\n");


Thanks,
Inki Dae

> +	}
> +
>  	/* set memory type and cache attribute from user side. */
>  	exynos_gem->flags = flags;
>  
> 
