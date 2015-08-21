From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/7] usb: dwc2: remove double call to s3c_hsotg_of_probe
Date: Fri, 21 Aug 2015 14:38:40 +0200
Message-ID: <1440160723-6636-5-git-send-email-m.szyprowski@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19697 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751955AbbHUMjQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Aug 2015 08:39:16 -0400
In-reply-to: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

This patch removes doubled call to s3c_hsotg_of_probe() function.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 3ee5b4c77a1f..47960787f572 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3488,8 +3488,6 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 	/* Set default UTMI width */
 	hsotg->phyif = GUSBCFG_PHYIF16;
 
-	s3c_hsotg_of_probe(hsotg);
-
 	/* Initialize to legacy fifo configuration values */
 	hsotg->g_rx_fifo_sz = 2048;
 	hsotg->g_np_g_tx_fifo_sz = 1024;
-- 
1.9.2
