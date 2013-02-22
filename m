From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2] drm/exynos: modify condition in mixer and hdmi resume
Date: Fri, 22 Feb 2013 08:46:45 -0500
Message-ID: <1361540805-19055-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54517 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756922Ab3BVN0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Feb 2013 08:26:46 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MIM00MXEIOFUR70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Feb 2013 22:26:45 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MIM00F4NIN6NQ10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Feb 2013 22:26:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

From: Prathyush K <prathyush.k@samsung.com>

If mixer is runtime suspended (by DPMS OFF), mixer_suspend
does not call mixer_poweroff and just returns. Similarily the
mixer_resume should not resume the mixer if mixer is
runtime_suspended. It should be done through DPMS ON.

The existing check is stopping the resume. This issue is fixed
by reversing the condiftion. It also holds good for hdmi driver.

v2: updated the error messages.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
It is based on exynos-drm-next-todo branch at
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 9 ++++++---
 drivers/gpu/drm/exynos/exynos_mixer.c | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9e3c2ad..67030b1 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2365,7 +2365,8 @@ static int hdmi_suspend(struct device *dev)
 		drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	if (pm_runtime_suspended(dev)) {
-		DRM_DEBUG_KMS("%s : Already suspended\n", __func__);
+		DRM_DEBUG_KMS("%s: already runtime-suspended.\n",
+			__func__);
 		return 0;
 	}
 
@@ -2386,8 +2387,10 @@ static int hdmi_resume(struct device *dev)
 	enable_irq(hdata->external_irq);
 	enable_irq(hdata->internal_irq);
 
-	if (!pm_runtime_suspended(dev)) {
-		DRM_DEBUG_KMS("%s : Already resumed\n", __func__);
+	if (pm_runtime_suspended(dev)) {
+		/* dpms callback should resume the hdmi. */
+		DRM_DEBUG_KMS("%s: already runtime-suspended.\n",
+		__func__);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 5139a43..3c12518 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1249,7 +1249,8 @@ static int mixer_suspend(struct device *dev)
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
 	if (pm_runtime_suspended(dev)) {
-		DRM_DEBUG_KMS("%s : Already suspended\n", __func__);
+		DRM_DEBUG_KMS("%s: already runtime-suspended.\n",
+			__func__);
 		return 0;
 	}
 
@@ -1265,8 +1266,10 @@ static int mixer_resume(struct device *dev)
 
 	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
 
-	if (!pm_runtime_suspended(dev)) {
-		DRM_DEBUG_KMS("%s : Already resumed\n", __func__);
+	if (pm_runtime_suspended(dev)) {
+		/* dpms callback should resume the mixer. */
+		DRM_DEBUG_KMS("%s: already runtime-suspended.\n",
+		__func__);
 		return 0;
 	}
 
-- 
1.8.0
