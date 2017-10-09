From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] PCI: exynos: remove redundant code in
 exynos_pcie_establish_link
Date: Mon, 09 Oct 2017 19:44:38 +0530
Message-ID: <1507558478-3218-1-git-send-email-pankaj.dubey@samsung.com>
References: <CGME20171009141438epcas2p4ead7e2f2d1af7e0950f2c026e3a9943b@epcas2p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55328 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754098AbdJIOOl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 10:14:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Anvesh Salveru <anvesh.s@samsung.com>

From: Anvesh Salveru <anvesh.s@samsung.com>

In exynos_pcie_establish_link if driver is not using generic phy,
we are resetting PHY twice, which is redundant, so this patch removes
repeated lines of code for PHY reset.

Signed-off-by: Anvesh Salveru <anvesh.s@samsung.com>
---
 drivers/pci/dwc/pci-exynos.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/pci/dwc/pci-exynos.c b/drivers/pci/dwc/pci-exynos.c
index 5596fde..85d2f4b 100644
--- a/drivers/pci/dwc/pci-exynos.c
+++ b/drivers/pci/dwc/pci-exynos.c
@@ -423,13 +423,6 @@ static int exynos_pcie_establish_link(struct exynos_pcie *ep)
 		exynos_pcie_deassert_phy_reset(ep);
 		exynos_pcie_power_on_phy(ep);
 		exynos_pcie_init_phy(ep);
-
-		/* pulse for common reset */
-		exynos_pcie_writel(ep->mem_res->block_base, 1,
-					PCIE_PHY_COMMON_RESET);
-		udelay(500);
-		exynos_pcie_writel(ep->mem_res->block_base, 0,
-					PCIE_PHY_COMMON_RESET);
 	}
 
 	/* pulse for common reset */
-- 
2.7.4
