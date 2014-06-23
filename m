From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/5 v2] drm/exynos: stop mixer before gating clocks during
 poweroff
Date: Mon, 23 Jun 2014 11:02:22 +0530
Message-ID: <1403501545-16482-3-git-send-email-rahul.sharma@samsung.com>
References: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17858 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122AbaFWFd1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 01:33:27 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7L009F3WRQARE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jun 2014 14:33:26 +0900 (KST)
In-reply-to: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Mixer should be power gated only after it is gracefully stopped.
The recommended sequence is to Stop the mixer and wait till
it enters to IDLE state before gating the clocks and power to
the mixer.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |   15 +++++++++++++++
 drivers/gpu/drm/exynos/regs-mixer.h   |    1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index c00abbe..d359501 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -377,6 +377,20 @@ static void mixer_run(struct mixer_context *ctx)
 	mixer_regs_dump(ctx);
 }
 
+static void mixer_stop(struct mixer_context *ctx)
+{
+	struct mixer_resources *res = &ctx->mixer_res;
+	int timeout = 20;
+
+	mixer_reg_writemask(res, MXR_STATUS, 0, MXR_STATUS_REG_RUN);
+
+	while (!(mixer_reg_read(res, MXR_STATUS) & MXR_STATUS_REG_IDLE) &&
+			--timeout)
+		usleep_range(10000, 12000);
+
+	mixer_regs_dump(ctx);
+}
+
 static void vp_video_buffer(struct mixer_context *ctx, int win)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
@@ -1094,6 +1108,7 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	}
 	mutex_unlock(&ctx->mixer_mutex);
 
+	mixer_stop(ctx);
 	mixer_window_suspend(mgr);
 
 	ctx->int_en = mixer_reg_read(res, MXR_INT_EN);
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index 4537026..5f32e1a 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -78,6 +78,7 @@
 #define MXR_STATUS_BIG_ENDIAN		(1 << 3)
 #define MXR_STATUS_ENDIAN_MASK		(1 << 3)
 #define MXR_STATUS_SYNC_ENABLE		(1 << 2)
+#define MXR_STATUS_REG_IDLE		(1 << 1)
 #define MXR_STATUS_REG_RUN		(1 << 0)
 
 /* bits for MXR_CFG */
-- 
1.7.9.5
