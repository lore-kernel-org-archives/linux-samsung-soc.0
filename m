From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: fimd: fix screen shaking issue on i80 mode
Date: Wed, 24 Sep 2014 11:56:01 +0900
Message-ID: <1411527361-23813-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64684 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753546AbaIXC4F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 22:56:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCD0084YXHFQP40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Sep 2014 11:56:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch resolves a issue that screen is shaked after resumed.

The issue could be incurred when overlay registers are updated to
new buffer while fimd is still transmitting video data.

So this patch make sure to wait for the completion of the transmission
if fimd is transmitting video data before updating overlay registers.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2f896df..8a45a70 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -665,6 +665,25 @@ static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
 	}
 
 	/*
+	 * Wait for the completion of current transmission if fimd is still
+	 * transmitting video data.
+	 *
+	 * Below codes resolve following issue:
+	 * when resumed, fimd_win_commit() could be called to update overlay
+	 * relevent registers and then pae flip could be performed by userspace
+	 * request. The problem is that te interrupt could occur and
+	 * fimd_trigger() could be called before fimd_win_commit is called by
+	 * page flip function, exynos_drm_crtc_page_flip.
+	 *
+	 * In this case, there is a problem that fimd_win_commit() is called by
+	 * the page flip request while fimd is still transmitting video data
+	 * so overlay registers are updated to new buffer. That makes screen
+	 * to be shaked.
+	 */
+	if (ctx->i80_if && atomic_read(&ctx->triggering))
+		fimd_wait_for_vblank(mgr);
+
+	/*
 	 * SHADOWCON/PRTCON register is used for enabling timing.
 	 *
 	 * for example, once only width value of a register is set,
-- 
1.7.9.5
