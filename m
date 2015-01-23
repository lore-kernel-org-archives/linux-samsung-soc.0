From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/6] drm/exynos: remove leftover code using event_list
Date: Fri, 23 Jan 2015 10:42:55 -0200
Message-ID: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:53844 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856AbbAWMnH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 07:43:07 -0500
Received: by mail-qa0-f49.google.com with SMTP id v8so5522336qal.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 04:43:07 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The drm_file event_list hasn't been used anymore by exynos, so we don't
need any code to clean it.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 25ba362..b60fd9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -256,11 +256,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
 		}
 	}
 
-	/* Release all events handled by page flip handler but not freed. */
-	list_for_each_entry_safe(e, et, &file->event_list, link) {
-		list_del(&e->link);
-		e->destroy(e);
-	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
 	kfree(file->driver_priv);
-- 
1.9.3
