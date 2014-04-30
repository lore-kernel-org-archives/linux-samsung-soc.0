From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: fix nested calls to lock mutex in drm resume
Date: Wed, 30 Apr 2014 18:32:22 +0530
Message-ID: <1398862942-6668-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45232 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757058AbaD3NF3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 09:05:29 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4U0086VHP4VK80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Apr 2014 22:05:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

While testing S2R on exynos board, system is hanging and
rebooting due to nested mutex_lock calls in exynos drm
resume callback. Changing the order of the calls is fixing
the issue.

Change-Id: I3f3ada8a413a414dca0bbac53cfc5fe3138af4d6
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
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
