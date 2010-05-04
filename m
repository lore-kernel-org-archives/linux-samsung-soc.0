From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] ARM: S3C64XX: Add USB clock source frequency as driver data
 to s3c-hsotg
Date: Tue, 04 May 2010 13:12:36 +0200
Message-ID: <4BE00124.7030702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:23073 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432Ab0EDLMj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 07:12:39 -0400
Received: by ey-out-2122.google.com with SMTP id d26so205185eyd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 May 2010 04:12:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org

The upcoming SmartQ machines use a different base clock frequency
for the USB block, this patch allows passing it as platform data
to the driver.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/plat-samsung/include/plat/udc-hs.h |    8 ++++++++
 drivers/usb/gadget/s3c-hsotg.c              |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/udc-hs.h b/arch/arm/plat-samsung/include/plat/udc-hs.h
index a22a4f2..2905344 100644
--- a/arch/arm/plat-samsung/include/plat/udc-hs.h
+++ b/arch/arm/plat-samsung/include/plat/udc-hs.h
@@ -18,12 +18,20 @@ enum s3c_hsotg_dmamode {
 	S3C_HSOTG_DMA_DRV,	/* DMA is chosen by driver */
 };
 
+enum s3c_hsotg_clkfreq {
+	S3C_HSOTG_CLKFREQ_48MHZ = 0,
+	S3C_HSOTG_CLKFREQ_12MHZ = 2,
+	S3C_HSOTG_CLKFREQ_24MHZ = 3,
+};
+
 /**
  * struct s3c_hsotg_plat - platform data for high-speed otg/udc
  * @dma: Whether to use DMA or not.
  * @is_osc: The clock source is an oscillator, not a crystal
+ * @clk_sel: Frequency of the clock source
  */
 struct s3c_hsotg_plat {
 	enum s3c_hsotg_dmamode	dma;
 	unsigned int		is_osc : 1;
+	enum s3c_hsotg_clkfreq	clk_sel;
 };
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 1f73b48..600b56d 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2705,6 +2705,7 @@ static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 	mdelay(1);
 
 	osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
+	osc |= hsotg->plat->clk_sel;
 
 	writel(osc | 0x10, S3C_PHYCLK);
 
-- 
1.7.1
