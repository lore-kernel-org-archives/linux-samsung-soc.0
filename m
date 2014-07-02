From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] drivers: phy: exynos4x12-phy: Add missing MODULE_DEVICE_TABLE
Date: Wed,  2 Jul 2014 09:48:42 +0200
Message-ID: <1404287322-25730-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:49905 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750888AbaGBHtQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 03:49:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

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
