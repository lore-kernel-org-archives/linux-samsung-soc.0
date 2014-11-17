From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 1/9] drm/exynos: move triggering checking
Date: Mon, 17 Nov 2014 22:00:08 +0900
Message-ID: <1416229216-32018-2-git-send-email-yj44.cho@samsung.com>
References: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35157 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbaKQNAX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:23 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF600LK5PGK9T40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:20 +0900 (KST)
In-reply-to: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

From: Joonyoung Shim <jy0922.shim@samsung.com>

It's better to be checking whether triggerring in fimd_trigger function.
Also it will return if in triggerring on fimd_te_handler, then it can't
execute remain codes.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0673a39..ec2d170 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -949,6 +949,13 @@ static void fimd_trigger(struct device *dev)
 	void *timing_base = ctx->regs + driver_data->timing_base;
 	u32 reg;
 
+	 /*
+	 * Skips to trigger if in triggering state, because multiple triggering
+	 * requests can cause panel reset.
+	 */
+	if (atomic_read(&ctx->triggering))
+		return;
+
 	atomic_set(&ctx->triggering, 1);
 
 	reg = readl(ctx->regs + VIDINTCON0);
@@ -969,13 +976,6 @@ static void fimd_te_handler(struct exynos_drm_manager *mgr)
 	if (ctx->pipe < 0 || !ctx->drm_dev)
 		return;
 
-	 /*
-	 * Skips to trigger if in triggering state, because multiple triggering
-	 * requests can cause panel reset.
-	 */
-	if (atomic_read(&ctx->triggering))
-		return;
-
 	/*
 	 * If there is a page flip request, triggers and handles the page flip
 	 * event so that current fb can be updated into panel GRAM.
-- 
1.9.0
