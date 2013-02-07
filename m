From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] i2c: s3c2410: fixup the styling of the newly moved register definitions
Date: Fri, 8 Feb 2013 00:57:49 +0100
Message-ID: <201302080057.49864.heiko@sntech.de>
References: <201302080057.00664.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201302080057.00664.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Make them conform more to established standards.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |   50 ++++++++++++++++++-------------------
 1 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 5cc4f71..5ef5c3d 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -46,35 +46,33 @@
 
 /* see s3c2410x user guide, v1.1, section 9 (p447) for more info */
 
-#define S3C2410_IICREG(x) (x)
-
-#define S3C2410_IICCON    S3C2410_IICREG(0x00)
-#define S3C2410_IICSTAT   S3C2410_IICREG(0x04)
-#define S3C2410_IICADD    S3C2410_IICREG(0x08)
-#define S3C2410_IICDS     S3C2410_IICREG(0x0C)
-#define S3C2440_IICLC	  S3C2410_IICREG(0x10)
-
-#define S3C2410_IICCON_ACKEN		(1<<7)
-#define S3C2410_IICCON_TXDIV_16		(0<<6)
-#define S3C2410_IICCON_TXDIV_512	(1<<6)
-#define S3C2410_IICCON_IRQEN		(1<<5)
-#define S3C2410_IICCON_IRQPEND		(1<<4)
-#define S3C2410_IICCON_SCALE(x)		((x)&15)
+#define S3C2410_IICCON			0x00
+#define S3C2410_IICSTAT			0x04
+#define S3C2410_IICADD			0x08
+#define S3C2410_IICDS			0x0C
+#define S3C2440_IICLC			0x10
+
+#define S3C2410_IICCON_ACKEN		(1 << 7)
+#define S3C2410_IICCON_TXDIV_16		(0 << 6)
+#define S3C2410_IICCON_TXDIV_512	(1 << 6)
+#define S3C2410_IICCON_IRQEN		(1 << 5)
+#define S3C2410_IICCON_IRQPEND		(1 << 4)
+#define S3C2410_IICCON_SCALE(x)		((x) & 0xf)
 #define S3C2410_IICCON_SCALEMASK	(0xf)
 
-#define S3C2410_IICSTAT_MASTER_RX	(2<<6)
-#define S3C2410_IICSTAT_MASTER_TX	(3<<6)
-#define S3C2410_IICSTAT_SLAVE_RX	(0<<6)
-#define S3C2410_IICSTAT_SLAVE_TX	(1<<6)
-#define S3C2410_IICSTAT_MODEMASK	(3<<6)
+#define S3C2410_IICSTAT_MASTER_RX	(2 << 6)
+#define S3C2410_IICSTAT_MASTER_TX	(3 << 6)
+#define S3C2410_IICSTAT_SLAVE_RX	(0 << 6)
+#define S3C2410_IICSTAT_SLAVE_TX	(1 << 6)
+#define S3C2410_IICSTAT_MODEMASK	(3 << 6)
 
-#define S3C2410_IICSTAT_START		(1<<5)
-#define S3C2410_IICSTAT_BUSBUSY		(1<<5)
-#define S3C2410_IICSTAT_TXRXEN		(1<<4)
-#define S3C2410_IICSTAT_ARBITR		(1<<3)
-#define S3C2410_IICSTAT_ASSLAVE		(1<<2)
-#define S3C2410_IICSTAT_ADDR0		(1<<1)
-#define S3C2410_IICSTAT_LASTBIT		(1<<0)
+#define S3C2410_IICSTAT_START		(1 << 5)
+#define S3C2410_IICSTAT_BUSBUSY		(1 << 5)
+#define S3C2410_IICSTAT_TXRXEN		(1 << 4)
+#define S3C2410_IICSTAT_ARBITR		(1 << 3)
+#define S3C2410_IICSTAT_ASSLAVE		(1 << 2)
+#define S3C2410_IICSTAT_ADDR0		(1 << 1)
+#define S3C2410_IICSTAT_LASTBIT		(1 << 0)
 
 #define S3C2410_IICLC_SDA_DELAY0	(0 << 0)
 #define S3C2410_IICLC_SDA_DELAY5	(1 << 0)
@@ -82,7 +80,7 @@
 #define S3C2410_IICLC_SDA_DELAY15	(3 << 0)
 #define S3C2410_IICLC_SDA_DELAY_MASK	(3 << 0)
 
-#define S3C2410_IICLC_FILTER_ON		(1<<2)
+#define S3C2410_IICLC_FILTER_ON		(1 << 2)
 
 /* Treat S3C2410 as baseline hardware, anything else is supported via quirks */
 #define QUIRK_S3C2440		(1 << 0)
-- 
1.7.2.3
