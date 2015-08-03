From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 07/11] drm/exynos: remove extra call to exynos_dp_commit()
Date: Mon,  3 Aug 2015 16:09:54 -0300
Message-ID: <1438628998-3435-8-git-send-email-gustavo@padovan.org>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:36392 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754870AbbHCTKW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 15:10:22 -0400
Received: by ykeo23 with SMTP id o23so21934634yke.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2015 12:10:22 -0700 (PDT)
In-Reply-To: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
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
index dd1809b..253f955 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -795,9 +795,6 @@ static int exynos_dp_config_video(struct exynos_dp_device *dp)
 	/* Configure video slave mode */
 	exynos_dp_enable_video_master(dp, 0);
 
-	/* Enable video */
-	exynos_dp_start_video(dp);
-
 	timeout_loop = 0;
 
 	for (;;) {
@@ -938,6 +935,9 @@ static void exynos_dp_commit(struct exynos_drm_encoder *encoder)
 		if (drm_panel_enable(dp->panel))
 			DRM_ERROR("failed to enable the panel\n");
 	}
+
+	/* Enable video */
+	exynos_dp_start_video(dp);
 }
 
 static enum drm_connector_status exynos_dp_detect(
@@ -1107,7 +1107,6 @@ static struct exynos_drm_encoder_ops exynos_dp_encoder_ops = {
 	.create_connector = exynos_dp_create_connector,
 	.enable = exynos_dp_enable,
 	.disable = exynos_dp_disable,
-	.commit = exynos_dp_commit,
 };
 
 static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
-- 
2.1.0
