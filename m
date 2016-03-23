From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] drm/exynos/hdmi: add PHY power off signal handling
Date: Wed, 23 Mar 2016 14:15:13 +0100
Message-ID: <1458738918-32054-3-git-send-email-a.hajda@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57238 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755442AbcCWNPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:15:35 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00JV6U5WJB90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:15:32 +0000 (GMT)
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

HDMI-PHY power off bit defaults to 0 in older HDMI versions.
In case of Exynos5433 it defaults to 1. To make code
consistent across all versions this bit is always unset/set in
power on/off sequences.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5c7dbfc..16951f3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1757,6 +1757,8 @@ static void hdmi_enable(struct drm_encoder *encoder)
 
 	hdmi_set_refclk(hdata, true);
 
+	hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0, HDMI_PHY_POWER_OFF_EN);
+
 	hdmi_conf_apply(hdata);
 
 	hdata->powered = true;
@@ -1789,6 +1791,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
 
 	cancel_delayed_work(&hdata->hotplug_work);
 
+	hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0, HDMI_PHY_POWER_OFF_EN);
+
 	hdmi_set_refclk(hdata, false);
 
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
-- 
1.9.1
