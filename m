From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: when to call dma_map_sg() on a GEM object?
Date: Fri, 30 Oct 2015 21:44:06 +0100
Message-ID: <5633D696.8020103@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59042 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759980AbbJ3UoJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 16:44:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ML dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hey there,

this question arose during some discussion with someone concerning the
Exynos mixer and G2D.

The question is the following. Consider the Exynos mixer when run under
the IOMMU (that's sysmmu_tv IIRC). What exactly does setup the IOMMU
mapping so that the mixer can scanout the framebuffer?

There is exynos_gem_map_sgt_with_dma() in the Exynos GEM code, but it's
currently exclusively used for the G2D and only when dealing with
userptr (and not GEM) there.

I was looking at exynos_drm_alloc_buf() since this called when
allocating a BO to be used as scanout.

I see dma_alloc_attrs() being called, which also sets the DMA address
that is later used in the mixer code. But DMA_ATTR_NO_KERNEL_MAPPING is
passed, so no mapping is done at this point.

Is the mapping done somewhere else, or is it simply not necessary here?

With best wishes,
Tobias
