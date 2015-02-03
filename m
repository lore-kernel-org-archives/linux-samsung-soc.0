From: Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/2] dma: fix DMA_ATTR_NO_KERNEL_MAPPING for no-IOMMU platforms
Date: Tue,  3 Feb 2015 09:47:30 +0100
Message-ID: <1422953252-10835-1-git-send-email-carlo@caione.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:47664 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907AbbBCIsK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 03:48:10 -0500
Received: by mail-wi0-f175.google.com with SMTP id fb4so22480191wid.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Feb 2015 00:48:09 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, jstpierre@mecheye.net, drake@endlessm.com, linux@arm.linux.org.uk, m.szyprowski@samsung.com, robdclark@gmail.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, kgene@kernel.org, jy0922.shim@samsung.com
Cc: Carlo Caione <carlo@caione.org>

The DMA_ATTR_NO_KERNEL_MAPPING attribute is used to notify dma-mapping core
that the driver will not use kernel mapping for the allocated buffer at all, so
the core can skip creating it.

Unfortunately at the moment this attribute is only valid for IOMMU setups. In
non-IOMMU setups the codepath doesn't obey DMA_ATTR_NO_KERNEL_MAPPING so when
the CMA region is in high-memory all the buffers created with this attribute
that do not require a kernel virtual address space still put pressure on the
vmalloc area (for reference see
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/279325.html)

This patchset is composed by two patches.

The first patch fixes the Exynos DRM driver so that it keeps working when the
non-IOMMU DMA layer is fixed. The Exynos DRM driver doesn't follow the
recommendations in DMA-attributes.txt so in the non-IOMMU case when
DMA_ATTR_NO_KERNEL_MAPPING is used the driver directly uses the returned kernel
virtual address which it explicitly requested not to be assigned. That must be
fixed before the underlying DMA subsystem is improved to obey
DMA_ATTR_NO_KERNEL_MAPPING.

The second patch implements DMA_ATTR_NO_KERNEL_MAPPING for non-IOMMU capable
platforms.

Please note that:

* The first patch must be applied before the second one to avoid breaking the
Exynos DRM driver. This patch without the DMA layer fix works fine (we save
git-bisect) but it's not fully correct (we have double mapping in kernel
address space).

* The second patch breaks the Exynos DRM driver unless the first patch is
* applied first

Carlo Caione (1):
  drm/exynos: fix DMA_ATTR_NO_KERNEL_MAPPING usage

Jasper St. Pierre (1):
  arm/dma-mapping: Respect NO_KERNEL_MAPPING when we don't have an IOMMU

 arch/arm/mm/dma-mapping.c                 | 67 +++++++++++++++++++------------
 drivers/gpu/drm/exynos/exynos_drm_buf.c   |  6 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 29 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |  2 +
 4 files changed, 55 insertions(+), 49 deletions(-)

-- 
2.2.2
