From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 15/16] drm/exynos/hdmi: remove unused field
Date: Fri, 25 Sep 2015 14:48:28 +0200
Message-ID: <1443185309-13827-16-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45906 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932219AbbIYMtI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 08:49:08 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV800CR2GXSLN10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 13:49:04 +0100 (BST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

The patch removes unused hdmi_context field.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a4ec8b9..b0f5ff4 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -103,7 +103,6 @@ struct hdmi_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
-	bool				hpd;
 	bool				powered;
 	bool				dvi_mode;
 	struct delayed_work		hotplug_work;
-- 
1.9.1
