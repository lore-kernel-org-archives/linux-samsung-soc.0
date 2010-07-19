From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] USB: s3c-hsotg: modify only selected bits in S3C_PHYPWR
 register
Date: Mon, 19 Jul 2010 16:01:41 +0200
Message-ID: <1279548102-32390-3-git-send-email-m.szyprowski@samsung.com>
References: <1279548102-32390-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1279548102-32390-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

S5PV210 SoCs has 2 USB PHY interfaces, both enabled by writing zero to
S3C_PHYPWR register. HS/OTG driver uses only PHY0, so do not touch bits
related to PHY1.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index ce272b4..258ca01 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2801,9 +2801,11 @@ static void __devinit s3c_hsotg_initep(struct s3c_hsotg *hsotg,
 static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 {
 	struct clk *xusbxti;
-	u32 osc;
+	u32 pwr, osc;
 
-	writel(0, S3C_PHYPWR);
+	pwr = readl(S3C_PHYPWR);
+	pwr &= ~0x19;
+	writel(pwr, S3C_PHYPWR);
 	mdelay(1);
 
 	osc = hsotg->plat->is_osc ? S3C_PHYCLK_EXT_OSC : 0;
-- 
1.7.1.569.g6f426

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
