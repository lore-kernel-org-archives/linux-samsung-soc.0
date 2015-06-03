From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/3] Exynos SYSMMU (IOMMU) updates for Exynos DRM
Date: Wed, 03 Jun 2015 10:26:21 +0200
Message-ID: <1433319984-18683-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:49710 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752537AbbFCI0j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 04:26:39 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPD00KMJ0SDZJ50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Jun 2015 09:26:37 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello,

Main changes for Exynos SYSMMU (IOMMU) driver has been finally scheduled
for merging - see
https://git.kernel.org/cgit/linux/kernel/git/joro/iommu.git/commit/?h=next

To let Exynos IOMMU driver work correctly, some fixes are also needed in
Exynos DRM driver.

v2 of this patchset has been rebased onto latest exynos-drm-next branch
with atomic mode setting patches applied.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (3):
  drm/exynos: fimd: ensure proper hw state in fimd_clear_channel()
  drm/exynos: iommu: detach from default dma-mapping domain on init
  drm/exynos: iommu: improve a check for non-iommu dma_ops

 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 22 ++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_iommu.c |  7 +++++--
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
1.9.2
