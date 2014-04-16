From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCHv3 2/5] drm: exynos: hdmi: simplify extracting hpd-gpio from DT
Date: Wed, 16 Apr 2014 17:12:55 +0200
Message-ID: <1397661178-6016-3-git-send-email-t.stanislaws@samsung.com>
References: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43029 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756342AbaDPPNT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 11:13:19 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N4400HE5QA6XM20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Apr 2014 00:13:18 +0900 (KST)
In-reply-to: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: m.chehab@samsung.com, robh+dt@kernel.org, inki.dae@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com, t.figa@samsung.com, b.zolnierkie@samsung.com, jy0922.shim@samsung.com, rahul.sharma@samsung.com, pawel.moll@arm.com, l.stach@pengutronix.de, Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch eliminates redundant checks while retrieving HPD gpio from DT during
HDMI's probe().

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 482ca77..176e764 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2012,15 +2012,12 @@ fail:
 
 static int drm_hdmi_dt_parse(struct hdmi_context *hdata, struct device_node *np)
 {
-	u32 value;
-
-	if (!of_find_property(np, "hpd-gpio", &value)) {
+	hdata->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
+	if (!gpio_is_valid(hdata->hpd_gpio)) {
 		DRM_ERROR("no hpd gpio property found\n");
 		return -ENOENT;
 	}
 
-	hdata->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
-
 	return 0;
 }
 
-- 
1.7.9.5
