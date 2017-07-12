From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/hdmi: fix disable sequence
Date: Wed, 12 Jul 2017 12:01:23 +0200
Message-ID: <1499853683-10261-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170712100130eucas1p28e5dd505bee3f5e7f09d81bab8e5ba06@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50619 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750959AbdGLKBf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 06:01:35 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OSZ0001M2IJ6430@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jul 2017 11:01:32 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

The "Fixes" patch was incorrectly merged, as a result PHY is prematurely
powered off and for example Odroid-U3 cannot disable TV power domain
when HDMI cable is unplugged.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: 625e63e2 ("drm/exynos/hdmi: fix pipeline disable order")
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index e65cdbf..b1718d8 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1501,8 +1501,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	 */
 	cancel_delayed_work(&hdata->hotplug_work);
 	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
-
-	hdmiphy_disable(hdata);
 }
 
 static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
-- 
2.7.4
