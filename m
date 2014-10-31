From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/9] drm/exynos: remove uneeded declaration of struct dma_iommu_mapping
Date: Fri, 31 Oct 2014 14:17:35 +0000
Message-ID: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:45561 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759394AbaJaORp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 10:17:45 -0400
Received: by mail-wi0-f177.google.com with SMTP id ex7so1434986wid.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 07:17:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

It is not even used in this header anymore.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_iommu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.h b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
index 72376d4..35d2588 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
@@ -40,7 +40,6 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
 
 #else
 
-struct dma_iommu_mapping;
 static inline int drm_create_iommu_mapping(struct drm_device *drm_dev)
 {
 	return 0;
-- 
1.9.3
