From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 6/7] drm/bridge: ptn3460: enable polling based detection
Date: Wed, 16 Apr 2014 20:03:05 +0530
Message-ID: <1397658786-26138-7-git-send-email-ajaykumar.rs@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40010 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161089AbaDPOdp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:33:45 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4400HGKOG9XM10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 23:33:45 +0900 (KST)
In-reply-to: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, a.hajda@samsung.com, treding@nvidia.com, kyungmin.park@samsung.com, seanpaul@google.com, abrestic@chromium.org, rahul.sharma@samsung.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.comRahul Sharma <rahul.sharma@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Add DRM_CONNECTOR_POLL_HPD to the set of connector flags while
registering drm_connector for ptn3460.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/ptn3460.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index b171901..f1d2afc 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -326,6 +326,7 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 
 	bridge->driver_private = ptn_bridge;
 	encoder->bridge = bridge;
+	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(dev, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
-- 
1.8.1.2
