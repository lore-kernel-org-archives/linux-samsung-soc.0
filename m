From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH 4/4] Documentation: dt-bindings: Describe SROMc configuration
Date: Mon, 26 Oct 2015 14:47:44 +0300
Message-ID: <7ac097efc649bac4e9f2b991baaa969ce4cbc3ef.1445859834.git.p.fedin@samsung.com>
References: <cover.1445859834.git.p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29655 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753563AbbJZLrw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 07:47:52 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT009TDSRRAE10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 11:47:52 +0000 (GMT)
In-reply-to: <cover.1445859834.git.p.fedin@samsung.com>
In-reply-to: <cover.1445859834.git.p.fedin@samsung.com>
References: <cover.1445859834.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Pankaj Dubey <pankaj.dubey@samsung.com>

Add documentation for new properties, allowing bank configuration.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 .../devicetree/bindings/arm/samsung/exynos-srom.txt   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
index 33886d5..73750da 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
@@ -5,8 +5,25 @@ Required properties:
 
 - reg: offset and length of the register set
 
-Example:
+Bank configurations can be defined as an optional subnodes. They can have the
+following properties:
+- bank : bank number (0 - 3)
+- width : data width in bytes (1 or 2). If omitted, default of 1 is used.
+- srom-timing : array of 7 integers: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs
+
+Example: basic definition, no banks are configured
+	sromc@12570000 {
+		compatible = "samsung,exynos-srom";
+		reg = <0x12570000 0x10>;
+	};
+
+Example: SROMc with bank3 configuration
 	sromc@12570000 {
 		compatible = "samsung,exynos-srom";
 		reg = <0x12570000 0x10>;
+		bank@3 {
+			bank = <3>;
+			width = <2>;
+			srom-timing = <1 9 12 1 9 1 1>;
+		};
 	};
-- 
2.4.4
