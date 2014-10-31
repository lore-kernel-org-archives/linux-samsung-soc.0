From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 8/9] drm/exynos: update documentation to reflect code changes
Date: Fri, 31 Oct 2014 14:17:42 +0000
Message-ID: <1414765063-30598-8-git-send-email-gustavo@padovan.org>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:62241 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759483AbaJaORu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 10:17:50 -0400
Received: by mail-wg0-f44.google.com with SMTP id x12so6070100wgg.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 07:17:49 -0700 (PDT)
In-Reply-To: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Description of the @create_connector callback was missing,
and the @manager was no longer needed.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index f77e6aa..e762cbb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -110,6 +110,7 @@ struct exynos_drm_overlay {
  * Exynos DRM Display Structure.
  *	- this structure is common to analog tv, digital tv and lcd panel.
  *
+ * @create_connector: initialize and register a new connector
  * @remove: cleans up the display for removal
  * @mode_fixup: fix mode data comparing to hw specific display mode.
  * @mode_set: convert drm_display_mode to hw specific display mode and
@@ -262,8 +263,6 @@ struct exynos_drm_private {
  * @dev: pointer to device object for subdrv device driver.
  * @drm_dev: pointer to drm_device and this pointer would be set
  *	when sub driver calls exynos_drm_subdrv_register().
- * @manager: subdrv has its own manager to control a hardware appropriately
- *     and we can access a hardware drawing on this manager.
  * @probe: this callback would be called by exynos drm driver after
  *     subdrv is registered to it.
  * @remove: this callback is used to release resources created
-- 
1.9.3
