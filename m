From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: exynos5-usbdrd: Remove "static" from local variable
Date: Sun, 06 Mar 2016 18:33:43 +0800
Message-ID: <1457260423.25403.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34166 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbcCFKds (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Mar 2016 05:33:48 -0500
Received: by mail-pa0-f49.google.com with SMTP id fy10so61081218pac.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2016 02:33:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jaewon Kim <jaewon02.kim@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Patrice Chotard <patrice.chotard@st.com>, linux-samsung-soc@vger.kernel.org

The 'reg' local variable does not need to be static.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-exynos5-usbdrd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exynos5-usbdrd.c
index 20696f5..07ed608 100644
--- a/drivers/phy/phy-exynos5-usbdrd.c
+++ b/drivers/phy/phy-exynos5-usbdrd.c
@@ -249,7 +249,7 @@ static void exynos5_usbdrd_phy_isol(struct phy_usb_instance *inst,
 static unsigned int
 exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 {
-	static u32 reg;
+	u32 reg;
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 
 	/* restore any previous reference clock settings */
@@ -295,7 +295,7 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 static unsigned int
 exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
 {
-	static u32 reg;
+	u32 reg;
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 
 	/* restore any previous reference clock settings */
-- 
2.1.4
