From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: remove redundant mutex_unlock
Date: Fri, 23 May 2014 12:57:54 +0200
Message-ID: <1400842674-20499-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:33530 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855AbaEWK6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 06:58:22 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6000NRCX534IA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 May 2014 11:58:15 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, m.szyprowski@samsung.com

The patch fixes unlocking in exynos_drm_component_del.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Inki,

This patch is based on exynos_drm_next branch.

Regards
Andrzej
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 4cef88f..c5a401ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -417,7 +417,6 @@ void exynos_drm_component_del(struct device *dev,
 		if (dev == cdev->dev) {
 			list_del(&cdev->list);
 			kfree(cdev);
-			mutex_unlock(&drm_component_lock);
 			break;
 		}
 	}
-- 
1.9.1
