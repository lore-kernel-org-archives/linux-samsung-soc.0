From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 1/9] drm/exynos: remove uneeded declaration of struct
 dma_iommu_mapping
Date: Thu, 6 Nov 2014 10:38:47 -0200
Message-ID: <20141106123847.GB30193@joana>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:52310 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbaKFMiv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Nov 2014 07:38:51 -0500
Received: by mail-qg0-f47.google.com with SMTP id j107so624076qga.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Nov 2014 04:38:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>


Hi Inki,

Could you please give a review to this series?

Thanks.

	Gustavo

2014-10-31 Gustavo Padovan <gustavo@padovan.org>:

> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> It is not even used in this header anymore.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_iommu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.h b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
> index 72376d4..35d2588 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_iommu.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
> @@ -40,7 +40,6 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
>  
>  #else
>  
> -struct dma_iommu_mapping;
>  static inline int drm_create_iommu_mapping(struct drm_device *drm_dev)
>  {
>  	return 0;
> -- 
> 1.9.3
> 
