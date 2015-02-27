From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: exynos5-usbdrd: Fix off-by-one valid value checking
 for args->args[0]
Date: Fri, 27 Feb 2015 23:44:24 +0800
Message-ID: <1425051864.6032.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Current code uses args->args[0] as array subscript of phy_drd->phys[].
So the valid value range for args->args[0] is 0 ... EXYNOS5_DRDPHYS_NUM - 1.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-exynos5-usbdrd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exynos5-usbdrd.c
index 0437401..e2a0be7 100644
--- a/drivers/phy/phy-exynos5-usbdrd.c
+++ b/drivers/phy/phy-exynos5-usbdrd.c
@@ -531,7 +531,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
 {
 	struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] > EXYNOS5_DRDPHYS_NUM))
+	if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
 		return ERR_PTR(-ENODEV);
 
 	return phy_drd->phys[args->args[0]].phy;
-- 
1.9.1
