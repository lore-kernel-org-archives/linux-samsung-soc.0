From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/4] usb: dwc2: remove double call to dwc2_hsotg_of_probe
Date: Mon, 21 Sep 2015 12:16:09 +0200
Message-ID: <1442830572-6765-2-git-send-email-m.szyprowski@samsung.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch removes doubled call to dwc2_hsotg_of_probe() function.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index ddd14a7..410ea6e 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3488,8 +3488,6 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 	/* Set default UTMI width */
 	hsotg->phyif = GUSBCFG_PHYIF16;
 
-	dwc2_hsotg_of_probe(hsotg);
-
 	/* Initialize to legacy fifo configuration values */
 	hsotg->g_rx_fifo_sz = 2048;
 	hsotg->g_np_g_tx_fifo_sz = 1024;
-- 
1.9.2
