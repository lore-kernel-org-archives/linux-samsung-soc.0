From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] drivers: phy: phy-samsung-usb2.c: Add missing MODULE_DEVICE_TABLE
Date: Thu,  3 Jul 2014 08:57:34 +0200
Message-ID: <1404370654-14033-1-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1404287322-25730-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:38565 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751135AbaGCG5v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 02:57:51 -0400
In-Reply-To: <1404287322-25730-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Allow phy-exynos-usb2 to be autoloaded based on devicetree information.
Tested on Odroid X2 with its USB subsystem build as modules.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 drivers/phy/phy-samsung-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
index 8a8c6bc..1e69a32 100644
--- a/drivers/phy/phy-samsung-usb2.c
+++ b/drivers/phy/phy-samsung-usb2.c
@@ -107,6 +107,7 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
 #endif
 	{ },
 };
+MODULE_DEVICE_TABLE(of, samsung_usb2_phy_of_match);
 
 static int samsung_usb2_phy_probe(struct platform_device *pdev)
 {
-- 
2.0.0
