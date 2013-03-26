From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/6] usb: phy: samsung: Use clk_get to get reference clock
Date: Tue, 26 Mar 2013 15:53:11 +0100
Message-ID: <1364309595-16102-3-git-send-email-t.figa@samsung.com>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43180 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933632Ab3CZOxe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 10:53:34 -0400
In-reply-to: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, balbi@ti.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, gautam.vivek@samsung.com, m.szyprowski@samsung.com, Tomasz Figa <t.figa@samsung.com>

There is no need to use devm_clk_get to get a clock that is being put
at the end of the function.

This patch changes the code getting reference clock to use clk_get
instead of useless in this case devm_clk_get.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/usb/phy/phy-samsung-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-samsung-usb.c b/drivers/usb/phy/phy-samsung-usb.c
index 7b118ee5..62cdb7e 100644
--- a/drivers/usb/phy/phy-samsung-usb.c
+++ b/drivers/usb/phy/phy-samsung-usb.c
@@ -175,9 +175,9 @@ int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)
 	 * external crystal clock XXTI
 	 */
 	if (sphy->drv_data->cpu_type == TYPE_EXYNOS5250)
-		ref_clk = devm_clk_get(sphy->dev, "ext_xtal");
+		ref_clk = clk_get(sphy->dev, "ext_xtal");
 	else
-		ref_clk = devm_clk_get(sphy->dev, "xusbxti");
+		ref_clk = clk_get(sphy->dev, "xusbxti");
 	if (IS_ERR(ref_clk)) {
 		dev_err(sphy->dev, "Failed to get reference clock\n");
 		return PTR_ERR(ref_clk);
-- 
1.8.1.5
