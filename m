From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 3/6] USB: s3c-hsotg: Ensure TX FIFO addresses setup when initialising FIFOs
Date: Tue, 25 May 2010 05:36:50 +0100
Message-ID: <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1274762213-3404-3-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Some versions of the S3C HS OtG block startup with overlapping TX FIFO
information, so change the fifo_init code to ensure that known values
are set into the FIFO registers at initialisation/reset time.

This also ensures that the FIFO RAM pointers are in a known state
before use.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index dce9366..2ee75a7 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -298,6 +298,11 @@ static void s3c_hsotg_ctrl_epint(struct s3c_hsotg *hsotg,
  */
 static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 {
+	unsigned int ep;
+	unsigned int addr;
+	unsigned int size;
+	u32 val;
+
 	/* the ryu 2.6.24 release ahs
 	   writel(0x1C0, hsotg->regs + S3C_GRXFSIZ);
 	   writel(S3C_GNPTXFSIZ_NPTxFStAddr(0x200) |
@@ -311,6 +316,26 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	writel(S3C_GNPTXFSIZ_NPTxFStAddr(2048) |
 	       S3C_GNPTXFSIZ_NPTxFDep(0x1C0),
 	       hsotg->regs + S3C_GNPTXFSIZ);
+
+	/* arange all the rest of the TX FIFOs, as some versions of this
+	 * block have overlapping default addresses. This also ensures
+	 * that if the settings have been changed, then they are set to
+	 * known values. */
+
+	/* start at the end of the GNPTXFSIZ, rounded up */
+	addr = 2048 + 1024;
+	size = 768;
+
+	/* currently we allocate TX FIFOs for all possible endpoints,
+	 * and assume that they are all the same size. */
+
+	for (ep = 0; ep <= 15; ep++) {
+		val = addr;
+		val |= size << S3C_DPTXFSIZn_DPTxFSize_SHIFT;
+		addr += size;
+
+		writel(val, hsotg->regs + S3C_DPTXFSIZn(ep));
+	}
 }
 
 /**
-- 
1.6.3.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
