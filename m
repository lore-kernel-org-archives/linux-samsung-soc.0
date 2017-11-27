From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: remove unnecessary descrptions
Date: Mon, 27 Nov 2017 17:07:09 +0900
Message-ID: <1511770029-3278-1-git-send-email-inki.dae@samsung.com>
References: <CGME20171127080710epcas2p11506ba025ec9e79aceb9c0c75420140a@epcas2p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35640 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdK0IHN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 03:07:13 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

Removed two descriptions to 'da_start' and 'da_space_size'
from exynos_drm_private structure.

These members don't exist anymore.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index f8bae4cb..b41df55 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -191,11 +191,6 @@ struct drm_exynos_file_private {
 /*
  * Exynos drm private structure.
  *
- * @da_start: start address to device address space.
- *	with iommu, device address space starts from this address
- *	otherwise default one.
- * @da_space_size: size of device address space.
- *	if 0 then default value is used for it.
  * @pending: the crtcs that have pending updates to finish
  * @lock: protect access to @pending
  * @wait: wait an atomic commit to finish
-- 
1.9.1
