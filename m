From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/9] usb: dwc2/gadget: fix enumeration issues
Date: Thu, 16 Oct 2014 14:57:58 +0200
Message-ID: <1413464285-24172-3-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54147 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752456AbaJPM6d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 08:58:33 -0400
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Excessive debug messages might cause timing issues that prevent correct
usb enumeration. This patch hides information about USB bus reset to let
driver enumerate fast enough to avoid making host angry. This fixes
endless enumeration and usb reset loop observed with some Linux hosts.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 119c8a3effc2..8870e38c1d82 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2333,7 +2333,7 @@ irq_retry:
 
 		u32 usb_status = readl(hsotg->regs + GOTGCTL);
 
-		dev_info(hsotg->dev, "%s: USBRst\n", __func__);
+		dev_dbg(hsotg->dev, "%s: USBRst\n", __func__);
 		dev_dbg(hsotg->dev, "GNPTXSTS=%08x\n",
 			readl(hsotg->regs + GNPTXSTS));
 
-- 
1.9.2
