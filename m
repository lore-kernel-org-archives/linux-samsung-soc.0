From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: when to call dma_map_sg() on a GEM object?
Date: Mon, 02 Nov 2015 16:41:56 +0900
Message-ID: <563713C4.2050309@samsung.com>
References: <5633D696.8020103@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36411 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbKBHl6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 02:41:58 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NX6004ITG1WI020@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 16:41:56 +0900 (KST)
In-reply-to: <5633D696.8020103@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 10/31/2015 05:44 AM, Tobias Jakobi wrote:
> Hey there,
> 
> this question arose during some discussion with someone concerning the
> Exynos mixer and G2D.
> 
> The question is the following. Consider the Exynos mixer when run under
> the IOMMU (that's sysmmu_tv IIRC). What exactly does setup the IOMMU
> mapping so that the mixer can scanout the framebuffer?
> 

IOMMU mapping is in dma_alloc_attrs(). Already IOMMU was integrated in
the DMA mapping API on ARM arch.

> There is exynos_gem_map_sgt_with_dma() in the Exynos GEM code, but it's
> currently exclusively used for the G2D and only when dealing with
> userptr (and not GEM) there.
> 
> I was looking at exynos_drm_alloc_buf() since this called when
> allocating a BO to be used as scanout.
> 
> I see dma_alloc_attrs() being called, which also sets the DMA address
> that is later used in the mixer code. But DMA_ATTR_NO_KERNEL_MAPPING is
> passed, so no mapping is done at this point.
> 

Did you read Documentation/DMA-attributes.txt document?
DMA_ATTR_NO_KERNEL_MAPPING is just to avoid creating a kernel virtual
mapping for the allocated buffer on ARM arch.

> Is the mapping done somewhere else, or is it simply not necessary here?
> 

What is the mapping you mean? As you know, the DMA address of the
memory gets from dma_alloc_attrs() and it can be used by device. There
is no reason to use dma_map_*().

Thanks.
