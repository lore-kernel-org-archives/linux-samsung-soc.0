From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 07/12] drm/bridge: ptn3460: probe connector at the end of
 bridge attach
Date: Wed, 27 Aug 2014 19:59:41 +0530
Message-ID: <1409149783-12416-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10012 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934508AbaH0Ok3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:40:29 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY006SEZFGNF90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:40:28 +0900 (KST)
In-reply-to: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Force bridge connector detection at the end of the bridge attach.
This is needed to detect the bridge connector early.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/ptn3460.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index 3cb3a7c..1bb4d2b 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -287,6 +287,7 @@ int ptn3460_bridge_attach(struct drm_bridge *bridge)
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	int ret;
 
+	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	ret = drm_connector_init(bridge->drm, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
@@ -302,6 +303,8 @@ int ptn3460_bridge_attach(struct drm_bridge *bridge)
 	if (ptn_bridge->panel)
 		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
 
+	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
+
 	return ret;
 }
 
-- 
1.7.9.5
