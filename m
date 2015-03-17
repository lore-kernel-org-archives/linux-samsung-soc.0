From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: samsung_usb2: Fixup samsung_usb2_phy_power_on/off paths
Date: Tue, 17 Mar 2015 08:42:38 +0800
Message-ID: <1426552958.6645.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:35316 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693AbbCQAmn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 20:42:43 -0400
Received: by pabyw6 with SMTP id yw6so80393707pab.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2015 17:42:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Ensure we have balanced clk_prepare_enable/clk_disable_unprepare calls if
.power_on or .power_off callbacks return error.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-samsung-usb2.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
index 4a12f66..55b6994 100644
--- a/drivers/phy/phy-samsung-usb2.c
+++ b/drivers/phy/phy-samsung-usb2.c
@@ -37,10 +37,14 @@ static int samsung_usb2_phy_power_on(struct phy *phy)
 		spin_lock(&drv->lock);
 		ret = inst->cfg->power_on(inst);
 		spin_unlock(&drv->lock);
+		if (ret)
+			goto err_power_on;
 	}
 
 	return 0;
 
+err_power_on:
+	clk_disable_unprepare(drv->ref_clk);
 err_instance_clk:
 	clk_disable_unprepare(drv->clk);
 err_main_clk:
@@ -51,7 +55,7 @@ static int samsung_usb2_phy_power_off(struct phy *phy)
 {
 	struct samsung_usb2_phy_instance *inst = phy_get_drvdata(phy);
 	struct samsung_usb2_phy_driver *drv = inst->drv;
-	int ret = 0;
+	int ret;
 
 	dev_dbg(drv->dev, "Request to power_off \"%s\" usb phy\n",
 		inst->cfg->label);
@@ -59,10 +63,12 @@ static int samsung_usb2_phy_power_off(struct phy *phy)
 		spin_lock(&drv->lock);
 		ret = inst->cfg->power_off(inst);
 		spin_unlock(&drv->lock);
+		if (ret)
+			return ret;
 	}
 	clk_disable_unprepare(drv->ref_clk);
 	clk_disable_unprepare(drv->clk);
-	return ret;
+	return 0;
 }
 
 static struct phy_ops samsung_usb2_phy_ops = {
-- 
1.9.1
