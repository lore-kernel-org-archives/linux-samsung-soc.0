From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: fix nested calls to lock mutex in drm resume
Date: Wed, 30 Apr 2014 19:11:34 +0530
Message-ID: <1398865294-6754-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36569 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757878AbaD3NnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 09:43:19 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4U00M8ZJG5EDD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Apr 2014 22:43:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

While testing S2R on exynos board, system is hanging and
rebooting due to nested mutex_lock calls in exynos drm
resume callback. Changing the order of the calls is fixing
the issue.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
Based on exynos-drm-next branch in Inki Dae's tree.
 drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index bb7dfee..2bb6233 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -184,8 +184,8 @@ static int exynos_drm_resume(struct drm_device *dev)
 			connector->funcs->dpms(connector, connector->dpms);
 	}
 
-	drm_helper_resume_force_mode(dev);
 	drm_modeset_unlock_all(dev);
+	drm_helper_resume_force_mode(dev);
 
 	return 0;
 }
-- 
1.7.9.5
