From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] PCI: exynos: fix the potential null pointer dereference
Date: Mon, 22 Jan 2018 11:28:54 +0900
Message-ID: <20180122022854.3634-1-jh80.chung@samsung.com>
References: <CGME20180122022856epcas1p494a9efeae478b299e3e8006adad71e6a@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41424 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750969AbeAVC26 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Jan 2018 21:28:58 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jingoohan1@gmail.com, lorenzo.pieralisi@arm.com, kgene@kernel.org, krzk@kernel.org, Jaehoon Chung <jh80.chung@samsung.com>

Before calling the callback function, it needs to check whether
init_clk_resources is assigned or not.
Otherwise, it can be occurred the NULL pointer dereference when
init_clk_resources is not assigned.

Even though init_clk_resources is assigned now, it needs to prevent the
potential NULL pointer dereference in future.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 drivers/pci/dwc/pci-exynos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/dwc/pci-exynos.c b/drivers/pci/dwc/pci-exynos.c
index 56f32aeebd0a..39f08881f9a4 100644
--- a/drivers/pci/dwc/pci-exynos.c
+++ b/drivers/pci/dwc/pci-exynos.c
@@ -499,7 +499,8 @@ static int __init exynos_pcie_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (ep->ops && ep->ops->get_clk_resources) {
+	if (ep->ops && ep->ops->get_clk_resources &&
+			ep->ops->init_clk_resources) {
 		ret = ep->ops->get_clk_resources(ep);
 		if (ret)
 			return ret;
-- 
2.15.1
