From: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/7] ARM: S3C64XX: Add clock source frequency as driver data
	to s3c-hsotg
Date: Mon, 8 Mar 2010 19:38:44 +0100
Message-ID: <b2e8f9f71003081038v9d94f4bnb49d7407b2bbe095@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/plat-s3c/include/plat/udc-hs.h |    8 ++++++++
 drivers/usb/gadget/s3c-hsotg.c          |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c/include/plat/udc-hs.h
b/arch/arm/plat-s3c/include/plat/udc-hs.h
index dd04db0..0dd69ca 100644
--- a/arch/arm/plat-s3c/include/plat/udc-hs.h
+++ b/arch/arm/plat-s3c/include/plat/udc-hs.h
@@ -18,12 +18,20 @@ enum s3c_hostg_dmamode {
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
 	enum s3c_hostg_dmamode	dma;
 	unsigned int		is_osc : 1;
+	enum s3c_hsotg_clkfreq	clk_sel;
 };
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 4b5dbd0..c6240bb 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2699,6 +2699,7 @@ static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 	mdelay(1);

 	osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
+	osc |= hsotg->plat->clk_sel;

 	writel(osc | 0x10, S3C_PHYCLK);

-- 
1.7.0.1
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
