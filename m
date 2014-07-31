From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 04/15] drm/panel: s6e8aa0: Add dummy prepare and unprepare
 routines
Date: Thu, 31 Jul 2014 23:12:03 +0530
Message-ID: <1406828534-10072-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9238 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbaGaRpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:38 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patch adds dummy definition for prepare and unprepare
routines to s6e8aa0 panel driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/panel/panel-s6e8aa0.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-s6e8aa0.c b/drivers/gpu/drm/panel/panel-s6e8aa0.c
index 06e57a2..60694dd 100644
--- a/drivers/gpu/drm/panel/panel-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-s6e8aa0.c
@@ -900,6 +900,16 @@ static int s6e8aa0_disable(struct drm_panel *panel)
 	return s6e8aa0_power_off(ctx);
 }
 
+static int s6e8aa0_unprepare(struct drm_panel *panel)
+{
+	return 0;
+}
+
+static int s6e8aa0_prepare(struct drm_panel *panel)
+{
+	return 0;
+}
+
 static int s6e8aa0_enable(struct drm_panel *panel)
 {
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
@@ -944,6 +954,8 @@ static int s6e8aa0_get_modes(struct drm_panel *panel)
 
 static const struct drm_panel_funcs s6e8aa0_drm_funcs = {
 	.disable = s6e8aa0_disable,
+	.unprepare = s6e8aa0_unprepare,
+	.prepare = s6e8aa0_prepare,
 	.enable = s6e8aa0_enable,
 	.get_modes = s6e8aa0_get_modes,
 };
-- 
1.7.9.5
