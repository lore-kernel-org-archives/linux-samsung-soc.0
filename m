From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 1/2] DRM: Exynos: return NULL if exynos_pages_to_sg fails
Date: Wed, 27 Jun 2012 11:17:19 +0900
Message-ID: <006201cd540a$faf9bf50$f0ed3df0$%dae@samsung.com>
References: <1340648577-28402-1-git-send-email-subash.ramaswamy@linaro.org>
 <1340648577-28402-2-git-send-email-subash.ramaswamy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49637 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159Ab2F0CRI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jun 2012 22:17:08 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6900E5H7OH4A20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jun 2012 11:17:05 +0900 (KST)
Received: from NOINKIDAE02 ([10.90.51.52])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M69000237OGTF70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jun 2012 11:17:05 +0900 (KST)
In-reply-to: <1340648577-28402-2-git-send-email-subash.ramaswamy@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Subash Patel' <subashrp@gmail.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: olofj@chromium.org, airlied@redhat.com, 'Subash Patel' <subash.rp@samsung.com>, 'Subash Patel' <subash.ramaswamy@linaro.org>



> -----Original Message-----
> From: Subash Patel [mailto:subashrp@gmail.com]
> Sent: Tuesday, June 26, 2012 3:23 AM
> To: dri-devel@lists.freedesktop.org; linux-samsung-soc@vger.kernel.org;
> linaro-mm-sig@lists.linaro.org
> Cc: olofj@chromium.org; inki.dae@samsung.com; airlied@redhat.com; Subash
> Patel; Subash Patel
> Subject: [PATCH 1/2] DRM: Exynos: return NULL if exynos_pages_to_sg fails
> 
> From: Subash Patel <subash.rp@samsung.com>
> 
> exynos_pages_to_sg() internally calls sg_kmalloc() which can return
> no pages when the system is under high memory crunch. One such instance
> is chromeos-install in the chromeos. This patch adds check for the return
> value of the function in subject to return NULL on failure.
> 
> Change-Id: I541ed30491a926ebe72738225041c9f2d88007bc
> Signed-off-by: Subash Patel <subash.ramaswamy@linaro.org>
> CC: dri-devel@lists.freedesktop.org
> CC: linux-samsung-soc@vger.kernel.org
> CC: linaro-mm-sig@lists.linaro.org
> CC: inki.dae@samsung.com
> CC: airlied@redhat.com
> CC: olofj@chromium.org
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dmabuf.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> index 97325c1..52cf761 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> @@ -87,6 +87,10 @@ static struct sg_table *
>  	npages = buf->size / buf->page_size;
> 
>  	sgt = exynos_pages_to_sg(buf->pages, npages, buf->page_size);
> +	if (!sgt) {
> +		DRM_DEBUG_PRIME("exynos_pages_to_sg returned NULL!\n");
> +		goto err_unlock;
> +	}
>  	nents = dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir);
> 
>  	DRM_DEBUG_PRIME("npages = %d buffer size = 0x%lx page_size =
> 0x%lx\n",
> --
> 1.7.9.5

Applied.

Thanks,
Inki Dae
