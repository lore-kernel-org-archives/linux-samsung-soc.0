From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 01/10] drm/exynos: do not start enabling DP at bind() phase
Date: Fri,  4 Sep 2015 17:15:43 -0300
Message-ID: <1441397752-6672-2-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f193.google.com ([209.85.160.193]:34533 "EHLO
	mail-yk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760474AbbIDUQB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:01 -0400
Received: by ykcm128 with SMTP id m128so2769299ykc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:01 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The DP device will be properly enabled at the enable() call just
after the bind call finishes.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index d66ade0..c73aff1 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1289,10 +1289,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
 
-	phy_power_on(dp->phy);
-
-	exynos_dp_init_dp(dp);
-
 	ret = devm_request_irq(&pdev->dev, dp->irq, exynos_dp_irq_handler,
 			irq_flags, "exynos-dp", dp);
 	if (ret) {
-- 
2.1.0
