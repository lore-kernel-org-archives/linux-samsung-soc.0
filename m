From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/2] phy: samsung: add simple phys for exynos5250 SoC
Date: Sun, 20 Apr 2014 15:38:14 +0530
Message-ID: <1397988495-29376-2-git-send-email-rahul.sharma@samsung.com>
References: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19871 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754911AbaDTKJC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:09:02 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B00HW4QV11I20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:09:01 +0900 (KST)
In-reply-to: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kishon@ti.com, kgene.kim@samsung.com, inki.dae@samsung.com, t.stanislaws@samsung.com, joshi@samsung.com, pankaj.dubey@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Extend the support for simple phys for exynos5250 SoC
in simple phy driver.

Change-Id: I39e7745e01ae4b1cf5063dce8a29ebdc37180130
---
 .../devicetree/bindings/phy/samsung-phy.txt        |   22 ++++++++++++++++++++
 drivers/phy/exynos-simple-phy.c                    |    9 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index f97c4c3..f469099 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -122,6 +122,7 @@ Required properties:
 - compatible : should be one of the listed compatibles:
 	- "samsung,exynos4210-simple-phy"
 	- "samsung,exynos4412-simple-phy"
+	- "samsung,exynos5250-simple-phy"
 - reg : offset and length of the register set;
 - #phy-cells : from the generic phy bindings, must be 1;
 
@@ -138,3 +139,24 @@ the PHY specifier identifies the PHY and its meaning is as follows:
   0 - HDMI PHY,
   1 - ADC PHY,
 
+For "samsung,exynos5250-simple-phy" compatible PHYs the second cell in
+the PHY specifier identifies the PHY and its meaning is as follows:
+  0 - HDMI PHY,
+  1 - ADC PHY,
+  2 - ADC PHY,
+
+Example:
+Simple PHY provider node:
+
+	simplephys: simple-phys@10040000 {
+		compatible = "samsung,exynos5250-simple-phy";
+		reg = <0x10040000 0x10000>;
+		#phy-cells = <1>;
+	};
+
+Other nodes accessing simple PHYs:
+
+	hdmi {
+		phys = <&simplephys 0>;
+		phy-names = "hdmiphy";
+	};
diff --git a/drivers/phy/exynos-simple-phy.c b/drivers/phy/exynos-simple-phy.c
index 57ad338..187f6b1 100644
--- a/drivers/phy/exynos-simple-phy.c
+++ b/drivers/phy/exynos-simple-phy.c
@@ -64,11 +64,20 @@ static const u32 exynos4412_offsets[] = {
 	~0, /* end mark */
 };
 
+static const u32 exynos5250_offsets[] = {
+	0x0700, /* HDMI_PHY */
+	0x0718, /* ADC_PHY */
+	0x0724, /* SATA_PHY */
+	~0, /* end mark */
+};
+
 static const struct of_device_id exynos_phy_of_match[] = {
 	{ .compatible = "samsung,exynos4210-simple-phy",
 	  .data = exynos4210_offsets},
 	{ .compatible = "samsung,exynos4412-simple-phy",
 	  .data = exynos4412_offsets},
+	{ .compatible = "samsung,exynos5250-simple-phy",
+	  .data = exynos5250_offsets},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, exynos_phy_of_match);
-- 
1.7.9.5
