From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 02/12] drm/mipi_dsi: create dsi devices only for nodes with
 reg property
Date: Fri, 28 Mar 2014 12:52:37 +0100
Message-ID: <1396007567-4015-3-git-send-email-a.hajda@samsung.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56950 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053AbaC1Lx2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 07:53:28 -0400
In-reply-to: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

MIPI DSI host node can contain child nodes which are not DSI devices.
Checking for existence of reg property can be used to distinguish such nodes.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index b155ee2..09821f4 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -142,8 +142,12 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct device_node *node;
 
-	for_each_available_child_of_node(host->dev->of_node, node)
+	for_each_available_child_of_node(host->dev->of_node, node) {
+		/* skip nodes without reg property */
+		if (!of_find_property(node, "reg", NULL))
+			continue;
 		of_mipi_dsi_device_add(host, node);
+	}
 
 	return 0;
 }
-- 
1.8.3.2
