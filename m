From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 20/23] drm/exynos: remove exynos_encoder's .commit() op
Date: Tue, 23 Jun 2015 18:35:33 -0300
Message-ID: <1435095336-6196-21-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:35137 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933407AbbFWVgn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:43 -0400
Received: by qgeu36 with SMTP id u36so8076100qge.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:43 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

.commit() is not used anymore, Exynos encoders now follow the
.enable()/.disable() semantics from drm atomic core, so remove this
callback.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h     | 2 --
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4bd770a..762b625 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -87,7 +87,6 @@ struct exynos_drm_plane {
  *	      would be called by encoder->mode_set().
  * @enable: display device on.
  * @disable: display device off.
- * @commit: apply changes to hw
  */
 struct exynos_drm_encoder;
 struct exynos_drm_encoder_ops {
@@ -100,7 +99,6 @@ struct exynos_drm_encoder_ops {
 				struct drm_display_mode *mode);
 	void (*enable)(struct exynos_drm_encoder *encoder);
 	void (*disable)(struct exynos_drm_encoder *encoder);
-	void (*commit)(struct exynos_drm_encoder *encoder);
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index b9a1c93..ce7b97e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -56,9 +56,6 @@ static void exynos_drm_encoder_enable(struct drm_encoder *encoder)
 
 	if (exynos_encoder->ops->enable)
 		exynos_encoder->ops->enable(exynos_encoder);
-
-	if (exynos_encoder->ops->commit)
-		exynos_encoder->ops->commit(exynos_encoder);
 }
 
 static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
-- 
2.1.0
