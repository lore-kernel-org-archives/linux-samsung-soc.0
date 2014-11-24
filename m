From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: fix exynos_drm_component_del
Date: Mon, 24 Nov 2014 17:10:05 +0900
Message-ID: <1416816605-2264-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46955 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752751AbaKXIKI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 03:10:08 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFJ00IFSAOU9580@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 17:10:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch resolves the issue that component object isn't removed
correctly.

A given component object couldn't be placed to head of drm_component_list
so all component objects added to the drm_component_list should be checked
to remove the given component object.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index c5cb8b6..0e4813b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -473,8 +473,6 @@ void exynos_drm_component_del(struct device *dev,
 			list_del(&cdev->list);
 			kfree(cdev);
 		}
-
-		break;
 	}
 
 	mutex_unlock(&drm_component_lock);
-- 
1.7.9.5
