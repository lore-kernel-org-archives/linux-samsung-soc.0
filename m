From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/2] phy: samsung: add simple phys for exynos5420 SoC
Date: Sun, 20 Apr 2014 15:38:15 +0530
Message-ID: <1397988495-29376-3-git-send-email-rahul.sharma@samsung.com>
References: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35944 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754911AbaDTKJF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:09:05 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B006D0QV3GI30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:09:03 +0900 (KST)
In-reply-to: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kishon@ti.com, kgene.kim@samsung.com, inki.dae@samsung.com, t.stanislaws@samsung.com, joshi@samsung.com, pankaj.dubey@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Extend the support for simple phys for exynos5420
SoC in simple phy driver.

Change-Id: I0ab7b59b1f013db9e924fc868bd8b1b6ed8acbb3
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt        |    6 ++++++
 drivers/phy/exynos-simple-phy.c                    |    8 ++++++++
 2 files changed, 14 insertions(+)
 mode change 100644 => 100755 drivers/phy/exynos-simple-phy.c

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index f469099..f0ae619 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -123,6 +123,7 @@ Required properties:
 	- "samsung,exynos4210-simple-phy"
 	- "samsung,exynos4412-simple-phy"
 	- "samsung,exynos5250-simple-phy"
+	- "samsung,exynos5420-simple-phy"
 - reg : offset and length of the register set;
 - #phy-cells : from the generic phy bindings, must be 1;
 
@@ -145,6 +146,11 @@ the PHY specifier identifies the PHY and its meaning is as follows:
   1 - ADC PHY,
   2 - ADC PHY,
 
+For "samsung,exynos5420-simple-phy" compatible PHYs the second cell in
+the PHY specifier identifies the PHY and its meaning is as follows:
+  0 - HDMI PHY,
+  1 - ADC PHY,
+
 Example:
 Simple PHY provider node:
 
diff --git a/drivers/phy/exynos-simple-phy.c b/drivers/phy/exynos-simple-phy.c
old mode 100644
new mode 100755
index 187f6b1..9681a43
--- a/drivers/phy/exynos-simple-phy.c
+++ b/drivers/phy/exynos-simple-phy.c
@@ -71,6 +71,12 @@ static const u32 exynos5250_offsets[] = {
 	~0, /* end mark */
 };
 
+static const u32 exynos5420_offsets[] = {
+	0x0700, /* HDMI_PHY */
+	0x0720, /* ADC_PHY */
+	~0, /* end mark */
+};
+
 static const struct of_device_id exynos_phy_of_match[] = {
 	{ .compatible = "samsung,exynos4210-simple-phy",
 	  .data = exynos4210_offsets},
@@ -78,6 +84,8 @@ static const struct of_device_id exynos_phy_of_match[] = {
 	  .data = exynos4412_offsets},
 	{ .compatible = "samsung,exynos5250-simple-phy",
 	  .data = exynos5250_offsets},
+	{ .compatible = "samsung,exynos5420-simple-phy",
+	  .data = exynos5420_offsets},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, exynos_phy_of_match);
-- 
1.7.9.5
