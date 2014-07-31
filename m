From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 05/15] drm/panel: simple: Add dummy prepare and unprepare
 routines
Date: Thu, 31 Jul 2014 23:12:04 +0530
Message-ID: <1406828534-10072-6-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9244 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753067AbaGaRpl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:41 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patch adds dummy definition for prepare and unprepare
routines to simple panel driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/panel/panel-simple.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a251361..2e51c34 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -114,6 +114,16 @@ static int panel_simple_disable(struct drm_panel *panel)
 	return 0;
 }
 
+static int panel_simple_unprepare(struct drm_panel *panel)
+{
+	return 0;
+}
+
+static int panel_simple_prepare(struct drm_panel *panel)
+{
+	return 0;
+}
+
 static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
@@ -164,6 +174,8 @@ static int panel_simple_get_modes(struct drm_panel *panel)
 
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
+	.unprepare = panel_simple_unprepare,
+	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 };
-- 
1.7.9.5
