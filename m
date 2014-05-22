From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH V2] drm/exynos: enable fimd clocks in probe before accessing
 fimd registers
Date: Thu, 22 May 2014 10:46:07 +0530
Message-ID: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9374 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899AbaEVFSa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:18:30 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Y005REMQR4220@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 14:18:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Fimd probe is accessing fimd Registers without enabling the fimd
gate clocks. If FIMD clocks are kept disabled in Uboot or disbaled
during kernel boottime, the system hangs during boottime.

This issue got surfaced when verifying with sysmmu enabled. Probe of
fimd Sysmmu enables the master clock before accessing sysmmu regs and
then disables. Later fimd probe tries to read the register without
enabling the clock which is wrong and hangs the system.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
Rebased on exynos-drm-next branch.

 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 173ee97..a79ba0a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -891,9 +891,15 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
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
