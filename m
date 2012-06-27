From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 2/2] DRM: Exynos: check for null in return value of
 dma_buf_map_attachment()
Date: Wed, 27 Jun 2012 11:17:36 +0900
Message-ID: <006301cd540b$04b35f10$0e1a1d30$%dae@samsung.com>
References: <1340648577-28402-1-git-send-email-subash.ramaswamy@linaro.org>
 <1340648577-28402-3-git-send-email-subash.ramaswamy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55121 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159Ab2F0CRW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jun 2012 22:17:22 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6900IGL7O4DN80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jun 2012 11:17:21 +0900 (KST)
Received: from NOINKIDAE02 ([10.90.51.52])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M690011D7OXRL20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jun 2012 11:17:21 +0900 (KST)
In-reply-to: <1340648577-28402-3-git-send-email-subash.ramaswamy@linaro.org>
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
> Subject: [PATCH 2/2] DRM: Exynos: check for null in return value of
> dma_buf_map_attachment()
> 
> From: Subash Patel <subash.rp@samsung.com>
> 
> dma_buf_map_attachment() can return NULL and valid sg as return
> value. Hence the check for the returned scatter-gather must be using
> the inline function IS_ERR_OR_NULL() in place of IS_ERR()
> 
> Change-Id: I33218480e220f6a26a1e726b336bf533a95363de
> Signed-off-by: Subash Patel <subash.ramaswamy@linaro.org>
> CC: dri-devel@lists.freedesktop.org
> CC: linux-samsung-soc@vger.kernel.org
> CC: linaro-mm-sig@lists.linaro.org
> CC: inki.dae@samsung.com
> CC: airlied@redhat.com
> CC: olofj@chromium.org
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dmabuf.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> index 52cf761..c908a29 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> @@ -245,7 +245,7 @@ struct drm_gem_object
> *exynos_dmabuf_prime_import(struct drm_device *drm_dev,
> 
> 
>  	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> -	if (IS_ERR(sgt)) {
> +	if (IS_ERR_OR_NULL(sgt)) {
>  		ret = PTR_ERR(sgt);
>  		goto err_buf_detach;
>  	}
> --
> 1.7.9.5

Applied.

Thanks,
Inki Dae
