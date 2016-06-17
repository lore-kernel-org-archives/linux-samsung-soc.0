From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/5] Exynos DRM: add support for ARM 64bit arch with IOMMU
Date: Fri, 17 Jun 2016 09:54:22 +0200
Message-ID: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36842 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754013AbcFQHyn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 03:54:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8W009H9ON40K00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2016 08:54:40 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

This patch series reworks IOMMU integration code to add support for ARM
64bit architecture with DMA-IOMMU glue code. Current inplementation uses
conditional code (hidden in the exynos_drm_iommu.h file) because ARM
32bit and 64bit are not compatible in the area of DMA-mapping and IOMMU
glue code. Once both architectures are unified, the conditional code can
be removed, but for now it lets one to use Exynos DRM on both
architectures.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:
v2:
- simplified ifdefs in exynos_drm_iommu.h, so when ARM32 bit will be converted
  to the generic IOMMU-DMA glue code, no changes will be needed to use generic
  code

v1:
- initial version

Patch summary:

Marek Szyprowski (5):
  drm/exynos: iommu: move dma_params configuration code to separate
    functions
  drm/exynos: iommu: add a check if all sub-devices have iommu
    controller
  drm/exynos: iommu: remove unused entries from exynos_drm_private
    strcuture
  drm/exynos: iommu: move ARM specific code to exynos_drm_iommu.h
  drm/exynos: iommu: add support for ARM64 specific code for IOMMU glue

 drivers/gpu/drm/exynos/Kconfig            |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  7 +--
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 -
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 77 +++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_iommu.h | 91 +++++++++++++++++++++++++++++++
 5 files changed, 126 insertions(+), 53 deletions(-)

-- 
1.9.1
