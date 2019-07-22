From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC/RFT 5/5] phy: exynos5-usbdrd: drop duplicate setting PIPE3 tune signal
Date: Tue, 23 Jul 2019 00:29:38 +0530
Message-ID: <20190722185938.9043-6-linux.amoon@gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Drop duplicate configuration setting of PIPE tune signal.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 4f16c4f82ae5..f6d2f359d88a 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -410,12 +410,6 @@ static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 		PHYPARAM0_COMPDISTUNE(0x6));
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 
-	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
-	/* Set Tx De-Emphasis level */
-	reg &= ~PHYPARAM1_PCS_TXDEEMPH_MASK;
-	reg |=	PHYPARAM1_PCS_TXDEEMPH;
-	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
-
 	/* UTMI Power Control */
 	writel(PHYUTMI_OTGDISABLE, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
 
-- 
2.22.0
