From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 19/23] drm/exynos: remove extra call to exynos_dp_commit()
Date: Tue, 23 Jun 2015 18:35:32 -0300
Message-ID: <1435095336-6196-20-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:32992 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933407AbbFWVgl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:41 -0400
Received: by qkhu186 with SMTP id u186so12220133qkh.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:40 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

exynos_dp_commit() was getting called twice by exynos encoder core, once
inside the .enable() call and another time by .commit() itself.

The remove of the second call caused the wake of a bug, the operations
orders inside exynos_dp_commit was wrong and we had to move
exynos_dp_start_video() to be the last operation in there.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 8614b4f..c853b46 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -796,9 +796,6 @@ static int exynos_dp_config_video(struct exynos_dp_device *dp)
 	/* Configure video slave mode */
 	exynos_dp_enable_video_master(dp, 0);
 
-	/* Enable video */
-	exynos_dp_start_video(dp);
-
 	timeout_loop = 0;
 
 	for (;;) {
@@ -939,6 +936,9 @@ static void exynos_dp_commit(struct exynos_drm_encoder *encoder)
 		if (drm_panel_enable(dp->panel))
 			DRM_ERROR("failed to enable the panel\n");
 	}
+
+	/* Enable video */
+	exynos_dp_start_video(dp);
 }
 
 static enum drm_connector_status exynos_dp_detect(
@@ -1108,7 +1108,6 @@ static struct exynos_drm_encoder_ops exynos_dp_encoder_ops = {
 	.create_connector = exynos_dp_create_connector,
 	.enable = exynos_dp_enable,
 	.disable = exynos_dp_disable,
-	.commit = exynos_dp_commit,
 };
 
 static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
-- 
2.1.0
