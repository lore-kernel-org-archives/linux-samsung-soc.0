From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH 1/2] drm/exynos: ipp: fix wrong index referencing a config
 element
Date: Tue, 09 Jun 2015 12:45:14 +0900
Message-ID: <1433821515-8952-1-git-send-email-human.hwang@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53052 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753665AbbFIDpV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 23:45:21 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPN00U6URRJXM00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Jun 2015 12:45:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com
Cc: sw0312.kim@samsung.com, jy0922.shim@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>

Config depends on the opreation. So it must be referenced by an
operation id, not a property id.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index b7f1cbc..54c5cf4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -486,8 +486,7 @@ static int ipp_validate_mem_node(struct drm_device *drm_dev,
 	unsigned int bpp;
 	int i;
 
-	/* The property id should already be varified */
-	ipp_cfg = &c_node->property.config[m_node->prop_id];
+	ipp_cfg = &c_node->property.config[m_node->ops_id];
 	num_plane = drm_format_num_planes(ipp_cfg->fmt);
 
 	/**
-- 
1.9.1
