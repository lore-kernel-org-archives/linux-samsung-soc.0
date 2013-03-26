From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 1/6] usb: phy: samsung: Select common driver part implicitly
Date: Tue, 26 Mar 2013 15:53:10 +0100
Message-ID: <1364309595-16102-2-git-send-email-t.figa@samsung.com>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43175 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933632Ab3CZOxb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 10:53:31 -0400
In-reply-to: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, balbi@ti.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, gautam.vivek@samsung.com, m.szyprowski@samsung.com, Tomasz Figa <t.figa@samsung.com>

Since phy-samsung-usb library can be used only by phy-samsung-usb2 and
phy-samsung-usb3 drivers, there is no need to give explicit control over
its Kconfig symbol.

This patch makes CONFIG_SAMSUNG_USBPHY symbol hidden and selected
implicitly by CONFIG_SAMSUNG_USB2PHY and CONFIG_SAMSUNG_USB3PHY.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/usb/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 7e8fe0f..5fb0939 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -86,7 +86,7 @@ config OMAP_USB3
 	  on/off the PHY.
 
 config SAMSUNG_USBPHY
-	tristate "Samsung USB PHY Driver"
+	tristate
 	help
 	  Enable this to support Samsung USB phy helper driver for Samsung SoCs.
 	  This driver provides common interface to interact, for Samsung USB 2.0 PHY
-- 
1.8.1.5
