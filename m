From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: Fix dma-buf import
Date: Mon, 30 Oct 2017 11:04:00 +0100
Message-ID: <34d1d8db-5df7-1293-1893-9249cb4e1181@math.uni-bielefeld.de>
References: <CGME20171030072827eucas1p2264ae476f8c5dba59f917ac09246b04e@eucas1p2.samsung.com>
 <20171030072809.12456-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56134 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932315AbdJ3KEF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 06:04:05 -0400
In-Reply-To: <20171030072809.12456-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>

Marek Szyprowski wrote:
> When IOMMU support was enabled, dma-buf import in Exynos DRM was broken
> since commit f43c35966a5a ("drm/exynos: use real device for DMA-mapping
> operations") due to using wrong struct device in drm_gem_prime_import()
> function. This patch fixes following kernel BUG caused by incorrect buffer
> mapping to DMA address space:
> 
> exynos-sysmmu 14650000.sysmmu: 14450000.mixer: PAGE FAULT occurred at 0xb2e00000
> ------------[ cut here ]------------
> kernel BUG at drivers/iommu/exynos-iommu.c:449!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.14.0-rc4-next-20171016-00033-g990d723669fd #3165
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> task: c0e0b7c0 task.stack: c0e00000
> PC is at exynos_sysmmu_irq+0x1d0/0x24c
> LR is at exynos_sysmmu_irq+0x154/0x24c
> ------------[ cut here ]------------
Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>


- Tobias

> Reported-by: Marian Mihailescu <mihailescu2m@gmail.com>
> Fixes: f43c35966a5a ("drm/exynos: use real device for DMA-mapping operations")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 6 ++++++
>  drivers/gpu/drm/exynos/exynos_drm_gem.h | 2 ++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index e651a58c18cf..0822c5341ba4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -148,7 +148,7 @@ static struct drm_driver exynos_drm_driver = {
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_export	= drm_gem_prime_export,
> -	.gem_prime_import	= drm_gem_prime_import,
> +	.gem_prime_import	= exynos_drm_gem_prime_import,
>  	.gem_prime_get_sg_table	= exynos_drm_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
>  	.gem_prime_vmap		= exynos_drm_gem_prime_vmap,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 077de014d610..ef35bc23bb36 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -506,6 +506,12 @@ int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  }
>  
>  /* low-level interface prime helpers */
> +struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
> +					    struct dma_buf *dma_buf)
> +{
> +	return drm_gem_prime_import_dev(dev, dma_buf, to_dma_dev(dev));
> +}
> +
>  struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>  	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index e86d1a9518c3..5a4c7de80f65 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -117,6 +117,8 @@ int exynos_drm_gem_fault(struct vm_fault *vmf);
>  int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  
>  /* low-level interface prime helpers */
> +struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
> +					    struct dma_buf *dma_buf);
>  struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  struct drm_gem_object *
>  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
> 
