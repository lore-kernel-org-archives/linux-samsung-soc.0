From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 11/11] drm/exynos: Enable atomic modesetting feature
Date: Sat, 15 Aug 2015 13:26:20 -0300
Message-ID: <1439655980-32146-12-git-send-email-gustavo@padovan.org>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:34151 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753923AbbHOQ0x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:53 -0400
Received: by ykdt205 with SMTP id t205so93022593ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:53 -0700 (PDT)
In-Reply-To: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that atomic modesetting is implemented for exynos enable the
DRIVER_ATOMIC flag on the driver's features.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 241453f..0ebe04f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -439,7 +439,8 @@ static const struct file_operations exynos_drm_driver_fops = {
 };
 
 static struct drm_driver exynos_drm_driver = {
-	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME,
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME
+				  | DRIVER_ATOMIC,
 	.load			= exynos_drm_load,
 	.unload			= exynos_drm_unload,
 	.open			= exynos_drm_open,
-- 
2.1.0
