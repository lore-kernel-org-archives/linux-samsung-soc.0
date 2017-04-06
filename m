From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: clean up description of exynos_drm_crtc
Date: Thu, 06 Apr 2017 10:21:09 +0900
Message-ID: <1491441669-5446-1-git-send-email-inki.dae@samsung.com>
References: <CGME20170406012110epcas1p3b013a6c11a9df4b76070540d73355534@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48712 "EHLO
        epoutp02.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751655AbdDFBWj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 21:22:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch removes unnecessary descriptions on
exynos_drm_crtc structure and adds one description
which specifies what pipe_clk member does.

pipe_clk support had been added by below patch without any description,
	 drm/exynos: add support for pipeline clock to the framework

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 527bf1d..b0462cc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -152,12 +152,10 @@ struct exynos_drm_clk {
  *
  * @base: crtc object.
  * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
- * @enabled: if the crtc is enabled or not
- * @event: vblank event that is currently queued for flip
- * @wait_update: wait all pending planes updates to finish
- * @pending_update: number of pending plane updates in this crtc
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the crtc's implementation specific context
+ * @pipe_clk: A pipe clock structure which includes a callback function
+	      for enabling DP clock of FIMD and HDMI PHY clock.
  */
 struct exynos_drm_crtc {
 	struct drm_crtc			base;
-- 
1.9.1
