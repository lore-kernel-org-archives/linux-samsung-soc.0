From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] dma: of-dma: return error when 'dma-cells' not found
Date: Tue, 05 Mar 2013 14:55:30 +0530
Message-ID: <1362475531-32260-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12098 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754978Ab3CEJYr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 04:24:47 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ6001OVKT4S6W0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Mar 2013 18:24:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, robherring2@gmail.com

This patch returns error when 'dma-cells' property not found
in the corresponding device node. With out this change there
is a crash in the generic dma incompatible platforms.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Based on Vinod Koul next branch.

 drivers/dma/of-dma.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index 69d04d2..46aca0d 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -92,6 +92,7 @@ int of_dma_controller_register(struct device_node *np,
 				void *data)
 {
 	struct of_dma	*ofdma;
+	const	 __be32 *ip;
 	int		nbcells;
 
 	if (!np || !of_dma_xlate) {
@@ -103,7 +104,12 @@ int of_dma_controller_register(struct device_node *np,
 	if (!ofdma)
 		return -ENOMEM;
 
-	nbcells = be32_to_cpup(of_get_property(np, "#dma-cells", NULL));
+	ip = of_get_property(np, "#dma-cells", NULL);
+	if (!ip)
+		return -ENXIO;
+
+	nbcells = be32_to_cpup(ip);
+
 	if (!nbcells) {
 		pr_err("%s: #dma-cells property is missing or invalid\n",
 		       __func__);
-- 
1.7.4.4
