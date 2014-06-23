From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 5/5 v2] drm/exynos: enable vsync interrupt while waiting for
 vblank
Date: Mon, 23 Jun 2014 11:02:25 +0530
Message-ID: <1403501545-16482-6-git-send-email-rahul.sharma@samsung.com>
References: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25514 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211AbaFWFdb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 01:33:31 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7L00IROWRTAN40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jun 2014 14:33:29 +0900 (KST)
In-reply-to: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

mixer_wait_for_vblank function expects that the upcoming
vsync interrupt handler routine will clear the
wait_vsync_event atomic variable.

For this to happen, interrupts should be enabled and
disabled properly.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6f18581..7529946 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1019,6 +1019,8 @@ static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
 	}
 	mutex_unlock(&mixer_ctx->mixer_mutex);
 
+	drm_vblank_get(mgr->crtc->dev, mixer_ctx->pipe);
+
 	atomic_set(&mixer_ctx->wait_vsync_event, 1);
 
 	/*
@@ -1029,6 +1031,8 @@ static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
 				!atomic_read(&mixer_ctx->wait_vsync_event),
 				HZ/20))
 		DRM_DEBUG_KMS("vblank wait timed out.\n");
+
+	drm_vblank_put(mgr->crtc->dev, mixer_ctx->pipe);
 }
 
 static void mixer_window_suspend(struct exynos_drm_manager *mgr)
-- 
1.7.9.5
