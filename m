From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V9 07/14] drm/bridge: ptn3460: probe connector at the end of
 bridge attach
Date: Tue, 20 Jan 2015 22:08:48 +0530
Message-ID: <1421771935-31618-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43050 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755447AbbATQrE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 11:47:04 -0500
In-reply-to: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Force bridge connector detection at the end of the bridge attach.
This is needed to detect the bridge connector early.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Rahul Sharma <rahul.sharma@samsung.com>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
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
