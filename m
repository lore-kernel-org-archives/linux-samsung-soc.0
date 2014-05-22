From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3] drm/exynos: enable fimd clocks in probe before accessing
 fimd registers
Date: Thu, 22 May 2014 19:41:07 +0530
Message-ID: <1400767867-8965-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9286 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751146AbaEVOMm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 10:12:42 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Z0086UBH4DX20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 23:12:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, thierry.reding@gmail.com, sachin.kamat@linaro.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>Rahul Sharma <rahul.sharma@samsung.com>

Fimd probe is accessing fimd Registers without enabling the fimd
gate clocks. If FIMD clocks are kept disabled in Uboot or disbaled
during kernel boottime, the system hangs during boottime.

This issue got surfaced when verifying with sysmmu enabled. Probe of
fimd Sysmmu enables the master clock before accessing sysmmu regs and
then disables. Later fimd probe tries to read the register without
enabling the clock which is wrong and hangs the system.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bd30d0c..38b77ed 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -898,16 +898,31 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct fimd_context *ctx = fimd_manager.ctx;
 	struct drm_device *drm_dev = data;
-	int win;
+	int win, ret;
 
 	fimd_mgr_initialize(&fimd_manager, drm_dev);
 	exynos_drm_crtc_create(&fimd_manager);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
+	ret = clk_prepare_enable(ctx->bus_clk);
+	if (ret) {
+		dev_err(dev, "bus clock enable failed.\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->lcd_clk);
+	if (ret) {
+		dev_err(dev, "lcd clock enable failed.\n");
+		return ret;
+	}
+
 	for (win = 0; win < WINDOWS_NR; win++)
 		fimd_clear_win(ctx, win);
 
+	clk_disable_unprepare(ctx->lcd_clk);
+	clk_disable_unprepare(ctx->bus_clk);
+
 	return 0;
 
 }
-- 
1.7.9.5
