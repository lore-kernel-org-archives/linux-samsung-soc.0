From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v4] drm/exynos/dsi: Remove error handling for bridge_node DT
 parsing
Date: Wed, 21 Jun 2017 19:51:43 +0900
Message-ID: <1498042303-5673-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170621105143epcas5p4b5c7fbbc0263c6190e69df6822e63699@epcas5p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26910 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750823AbdFUKvr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 06:51:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: javier@osg.samsung.com, a.hajda@samsung.com, tjakobi@math.uni-bielefeld.de, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Remove the error handling of bridge_node because the bridge_node is
optional.

For example, In case of Exynos SoC, a bridge device such as mDNIe and
MIC could be placed between Display Controller and MIPI DSI device but
the bridge device is optional.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---

Hi all,

Thanks for Krzysztof's advice.

Changes for V4:
- Fixed the word('optional') from commit message.

Changes for V3:
- Removed the word('required') from commit message.

Changes for V2:
- Modified the commit message in more detail than before.

Best regards,
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
