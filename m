From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 04/19] drm: exynos: detach from default dma-mapping domain
 on init
Date: Wed, 19 Nov 2014 12:15:33 +0100
Message-ID: <1416395748-10731-5-git-send-email-m.szyprowski@samsung.com>
References: <1416395748-10731-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:23330 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754004AbaKSLQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 06:16:27 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFA00JRTA44RH40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 11:19:17 +0000 (GMT)
In-reply-to: <1416395748-10731-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds code, which detach sub-device nodes from default iommu
domain if such has been configured.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index b32b291f88ff..323601a52a25 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -100,6 +100,9 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 
 	dma_set_max_seg_size(subdrv_dev, 0xffffffffu);
 
+	if (subdrv_dev->archdata.mapping)
+		arm_iommu_detach_device(subdrv_dev);
+
 	ret = arm_iommu_attach_device(subdrv_dev, dev->archdata.mapping);
 	if (ret < 0) {
 		DRM_DEBUG_KMS("failed iommu attach.\n");
-- 
1.9.2
