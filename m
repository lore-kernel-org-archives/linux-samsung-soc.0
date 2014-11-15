From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V8 07/14] drm/bridge: ptn3460: probe connector at the end of
 bridge attach
Date: Sat, 15 Nov 2014 15:25:02 +0530
Message-ID: <1416045309-13359-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28096 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752412AbaKOKBu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Nov 2014 05:01:50 -0500
In-reply-to: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, seanpaul@google.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Force bridge connector detection at the end of the bridge attach.
This is needed to detect the bridge connector early.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/ptn3460.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index e6d5ae7..9f800a1 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -281,6 +281,7 @@ int ptn3460_bridge_attach(struct drm_bridge *bridge)
 		return -ENODEV;
 	}
 
+	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	ret = drm_connector_init(bridge->dev, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
@@ -296,6 +297,8 @@ int ptn3460_bridge_attach(struct drm_bridge *bridge)
 	if (ptn_bridge->panel)
 		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
 
+	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
+
 	return ret;
 }
 
-- 
1.7.9.5
