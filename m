From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 5/7] usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
Date: Thu,  6 Jun 2013 01:57:29 +0200
Message-ID: <1370476651-6743-6-git-send-email-tomasz.figa@gmail.com>
References: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:39422 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753912Ab3FEX5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 19:57:50 -0400
In-Reply-To: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

This patch modifies the ohci-s3c2410 driver to prepare and unprepare
clocks in addition to enabling and disabling, since it is required
by common clock framework.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/usb/host/ohci-s3c2410.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index e125770..db096bf 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -47,10 +47,10 @@ static void s3c2410_start_hc(struct platform_device *dev, struct usb_hcd *hcd)
 
 	dev_dbg(&dev->dev, "s3c2410_start_hc:\n");
 
-	clk_enable(usb_clk);
+	clk_prepare_enable(usb_clk);
 	mdelay(2);			/* let the bus clock stabilise */
 
-	clk_enable(clk);
+	clk_prepare_enable(clk);
 
 	if (info != NULL) {
 		info->hcd	= hcd;
@@ -75,8 +75,8 @@ static void s3c2410_stop_hc(struct platform_device *dev)
 			(info->enable_oc)(info, 0);
 	}
 
-	clk_disable(clk);
-	clk_disable(usb_clk);
+	clk_disable_unprepare(clk);
+	clk_disable_unprepare(usb_clk);
 }
 
 /* ohci_s3c2410_hub_status_data
-- 
1.8.2.1
