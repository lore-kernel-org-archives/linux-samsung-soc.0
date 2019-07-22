From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC/RFT 1/5] phy: exynos5-usbdrd: read from correct offset of xhci linksystem
Date: Tue, 23 Jul 2019 00:29:34 +0530
Message-ID: <20190722185938.9043-2-linux.amoon@gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Read from linksystem offset to update the xhci version.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 646259bee909..3c14bf7718c1 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -397,7 +397,8 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	 * Setting the Frame length Adj value[6:1] to default 0x20
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
-	reg =	LINKSYSTEM_XHCI_VERSION_CONTROL |
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+	reg |=	LINKSYSTEM_XHCI_VERSION_CONTROL |
 		LINKSYSTEM_FLADJ(0x20);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
 
-- 
2.22.0
