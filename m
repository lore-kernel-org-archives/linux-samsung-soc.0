From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 22/23] drm/exynos: fold encoder setup into exynos_drm_load()
Date: Mon,  6 Jul 2015 11:20:23 -0300
Message-ID: <1436192424-18194-23-git-send-email-gustavo@padovan.org>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33817 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbbGFOVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 10:21:42 -0400
Received: by qkeo142 with SMTP id o142so117995104qke.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2015 07:21:41 -0700 (PDT)
In-Reply-To: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

As we are removing the exynos encoder move the encoder setup operation
directly inside the exynos_drm_load()

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c     | 12 ++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 13 -------------
 drivers/gpu/drm/exynos/exynos_drm_encoder.h |  1 -
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 3542f2c..f3fcc2a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -41,7 +41,9 @@
 static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 {
 	struct exynos_drm_private *private;
-	int ret;
+	struct drm_encoder *encoder;
+	unsigned int clone_mask;
+	int cnt, ret;
 
 	private = kzalloc(sizeof(struct exynos_drm_private), GFP_KERNEL);
 	if (!private)
@@ -70,7 +72,13 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	exynos_drm_mode_config_init(dev);
 
 	/* setup possible_clones. */
-	exynos_drm_encoder_setup(dev);
+	cnt = 0;
+	clone_mask = 0;
+	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
+		clone_mask |= (1 << (cnt++));
+
+	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
+		encoder->possible_clones = clone_mask;
 
 	platform_set_drvdata(dev->platformdev, dev);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 4ed360b..d45a5c5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -78,19 +78,6 @@ static struct drm_encoder_funcs exynos_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-void exynos_drm_encoder_setup(struct drm_device *dev)
-{
-	struct drm_encoder *encoder;
-	unsigned int clone_mask = 0;
-	int cnt = 0;
-
-	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
-		clone_mask |= (1 << (cnt++));
-
-	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
-		encoder->possible_clones = clone_mask;
-}
-
 int exynos_drm_encoder_create(struct drm_device *dev,
 			      struct exynos_drm_encoder *exynos_encoder,
 			      enum exynos_drm_output_type type)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.h b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
index e998b82..6610dee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
@@ -16,7 +16,6 @@
 
 #include "exynos_drm_drv.h"
 
-void exynos_drm_encoder_setup(struct drm_device *dev);
 int exynos_drm_encoder_create(struct drm_device *dev, struct exynos_drm_encoder
 			      *encoder, enum exynos_drm_output_type type);
 
-- 
2.1.0
