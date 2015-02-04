From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: fix DMA_ATTR_NO_KERNEL_MAPPING usage
Date: Wed, 04 Feb 2015 11:59:23 +0900
Message-ID: <54D18B0B.5060208@samsung.com>
References: <1422953252-10835-1-git-send-email-carlo@caione.org>
 <1422953252-10835-2-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19139 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbbBDC7S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 21:59:18 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ8004BY8AS9A00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Feb 2015 11:59:16 +0900 (KST)
In-reply-to: <1422953252-10835-2-git-send-email-carlo@caione.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, jstpierre@mecheye.net, drake@endlessm.com, linux@arm.linux.org.uk, m.szyprowski@samsung.com, robdclark@gmail.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, kgene@kernel.org

Hi,

On 02/03/2015 05:47 PM, Carlo Caione wrote:
> The Exynos DRM driver doesn't follow the correct API when dealing with
> dma_{alloc, mmap, free}_attrs functions and the
> DMA_ATTR_NO_KERNEL_MAPPING attribute.
> 
> When a IOMMU is not available and the DMA_ATTR_NO_KERNEL_MAPPING is
> used, the driver should use the pointer returned by dma_alloc_attr() as
> a cookie.
> 
> The Exynos DRM driver directly uses the non-requested virtual
> kernel address returned by the DMA mapping subsystem. This just works
> now because the non-IOMMU codepath doesn't obey
> DMA_ATTR_NO_KERNEL_MAPPING but we need to fix it before fixing the DMA
> layer.
> 
> Signed-off-by: Carlo Caione <carlo@caione.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_buf.c   |  6 +++---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 29 +++++++++--------------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   |  2 ++
>  3 files changed, 14 insertions(+), 23 deletions(-)
> 

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
