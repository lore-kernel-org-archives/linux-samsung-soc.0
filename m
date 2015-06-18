From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/3] drm/exynos: vidi: always handle vblank on planes updates
Date: Thu, 18 Jun 2015 12:24:00 -0300
Message-ID: <1434641041-17833-3-git-send-email-gustavo@padovan.org>
References: <1434641041-17833-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33780 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755998AbbFRPYO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jun 2015 11:24:14 -0400
Received: by qged89 with SMTP id d89so27214522qge.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jun 2015 08:24:13 -0700 (PDT)
In-Reply-To: <1434641041-17833-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

We need to call drm_handle_vblank() after each successful plane update
to update vblank counter and send the necessary events.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 3413393..4706d45 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -193,10 +193,11 @@ static void vidi_fake_vblank_handler(struct work_struct *work)
 	/* refresh rate is about 50Hz. */
 	usleep_range(16000, 20000);
 
+	drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+
 	mutex_lock(&ctx->lock);
 
 	if (ctx->direct_vblank) {
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
 		ctx->direct_vblank = false;
 		mutex_unlock(&ctx->lock);
 		return;
-- 
2.1.0
