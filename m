From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: enable fimd clocks in probe before accessing fimd
 registers
Date: Sun, 20 Apr 2014 18:02:13 +0530
Message-ID: <1397997133-22477-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21757 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755196AbaDTMc5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 08:32:57 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B00BGQXIVA850@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 21:32:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Fimd probe is accessing fimd Registers without enabling the fimd
gate clocks. This hangs the system at boot time.

This issue got surfaced when verifying with sysmmu enabled. Probe of
fimd Sysmmu enables the master clock before accessing sysmmu regs and
then disables. Later fimd probe tries to read the reegister without
enabling the clock which is wrong and hangs the system.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 40fd6cc..8706fde 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -916,9 +916,15 @@ static int fimd_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	clk_prepare_enable(ctx->bus_clk);
+	clk_prepare_enable(ctx->lcd_clk);
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
