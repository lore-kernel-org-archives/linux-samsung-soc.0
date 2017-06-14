From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2] drm/exynos/dsi: Remove error handling for bridge_node DT
 parsing
Date: Wed, 14 Jun 2017 15:33:40 +0900
Message-ID: <1497422020-8810-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170614063359epcas5p46658bba447468cd367d0684bd9485bf8@epcas5p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51691 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750764AbdFNGeC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 02:34:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: javier@osg.samsung.com, a.hajda@samsung.com, tjakobi@math.uni-bielefeld.de, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Remove the error handling of bridge_node because the bridge_node is
required optionally.

For example, In case of Exynos SoC, a bridge device such as mDNIe and
MIC could be placed between Display Controller and MIPI DSI device but
the bridge device is required optionally.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---

Hi Inki and Tobias,

Thanks for your review.

Changes for V2:
- Modified the commit message in more detail than before.

Best Regards,
Hoegeun

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index a11b795..6ee0dac 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1651,8 +1651,6 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 		return ret;
 
 	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
-	if (!dsi->bridge_node)
-		return -EINVAL;
 
 	return 0;
 }
-- 
1.9.1
