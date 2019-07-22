From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC/RFT 2/5] phy: exynos5-usbdrd: add missing tuning of the phyutmi signal
Date: Tue, 23 Jul 2019 00:29:35 +0530
Message-ID: <20190722185938.9043-3-linux.amoon@gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing tuning of phyutmi controls to enter suspend and
resume state.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 32 ++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 3c14bf7718c1..135114d51bc1 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -42,7 +42,13 @@
 
 #define EXYNOS5_DRD_PHYUTMI			0x08
 
+#define PHYUTMI_TXBITSTUFFENH			BIT(8)
+#define PHYUTMI_TXBITSTUFFEN			BIT(7)
 #define PHYUTMI_OTGDISABLE			BIT(6)
+#define PHYUTMI_IDPULLUP			BIT(5)
+#define PHYUTMI_DRVVBUS				BIT(4)
+#define PHYUTMI_DPPULLDOWN                      BIT(3)
+#define PHYUTMI_DMPULLDOWN                      BIT(2)
 #define PHYUTMI_FORCESUSPEND			BIT(1)
 #define PHYUTMI_FORCESLEEP			BIT(0)
 
@@ -402,6 +408,23 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 		LINKSYSTEM_FLADJ(0x20);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
 
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+	/* High-Byte Transmit Bit-Stuffing Enable */
+	reg |= PHYUTMI_TXBITSTUFFENH;
+	/* Low-Byte Transmit Bit-Stuffing Enable */
+	reg |= PHYUTMI_TXBITSTUFFEN;
+	/* release force_sleep & force_suspend */
+	reg &= ~(PHYUTMI_FORCESLEEP | PHYUTMI_FORCESUSPEND);
+	/* DP/DM Pull Down Disable */
+	reg &= ~(PHYUTMI_DMPULLDOWN | PHYUTMI_DPPULLDOWN);
+	/* drvvbus controller signal controls the VBUS valid comparator */
+	reg &= ~PHYUTMI_OTGDISABLE;
+	/* controller signal controls the VBUS Valid comparator */
+	reg |= PHYUTMI_DRVVBUS;
+	/* Enable ID Sampling */
+	reg |= PHYUTMI_IDPULLUP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 	/* Select PHY CLK source */
 	reg &= ~PHYPARAM0_REF_USE_PAD;
@@ -452,9 +475,14 @@ static int exynos5_usbdrd_phy_exit(struct phy *phy)
 	if (ret)
 		return ret;
 
-	reg =	PHYUTMI_OTGDISABLE |
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+	reg |=	PHYUTMI_OTGDISABLE |
 		PHYUTMI_FORCESUSPEND |
-		PHYUTMI_FORCESLEEP;
+		PHYUTMI_FORCESLEEP |
+		PHYUTMI_DMPULLDOWN |
+		PHYUTMI_DPPULLDOWN;
+	reg &= ~(PHYUTMI_DRVVBUS | PHYUTMI_IDPULLUP |
+		PHYUTMI_TXBITSTUFFENH | PHYUTMI_TXBITSTUFFEN);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
 
 	/* Resetting the PHYCLKRST enable bits to reduce leakage current */
-- 
2.22.0
