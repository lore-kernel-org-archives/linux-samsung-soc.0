From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/2] drm: WARN_ON if a modeset driver uses legacy suspend/resume helpers
Date: Thu, 13 Aug 2015 17:06:39 -0300
Message-ID: <1439496399-25791-2-git-send-email-gustavo@padovan.org>
References: <1439496399-25791-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:36120 "EHLO
	mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753564AbbHMUGt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 16:06:49 -0400
Received: by qkdv3 with SMTP id v3so19215597qkd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2015 13:06:48 -0700 (PDT)
In-Reply-To: <1439496399-25791-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, daniel@ffwll.ch, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Legacy s/r hooks are only used for shadow-attaching drivers, warn
when a KMS driver tries to use them.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index b7bf4ce..4e76193 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -567,6 +567,8 @@ struct drm_device *drm_dev_alloc(struct drm_driver *driver,
 		ret = drm_minor_alloc(dev, DRM_MINOR_CONTROL);
 		if (ret)
 			goto err_minors;
+
+		WARN_ON(driver->suspend || driver->resume);
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
-- 
2.1.0
