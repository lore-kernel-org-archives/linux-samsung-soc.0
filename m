From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v2 4/4] Documentation: dt-bindings: Describe SROMc configuration
Date: Tue, 27 Oct 2015 11:43:55 +0300
Message-ID: <0597acb74ea0e35f5dbe7236e582358e8177f8ff.1445935215.git.p.fedin@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29421 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754428AbbJ0IoG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 04:44:06 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWV00BNREXGFB60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 08:44:04 +0000 (GMT)
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
In-reply-to: <cover.1445935215.git.p.fedin@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

Add documentation for new properties, allowing bank configuration.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 .../bindings/arm/samsung/exynos-srom.txt           | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
index 33886d5..9e4a40b 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
@@ -5,8 +5,30 @@ Required properties:
 
 - reg: offset and length of the register set
 
-Example:
+Bank configurations can be defined in optional subnodes. Each subnode
+describes one bank and contains the following:
+
+Required properties:
+- bank : bank number (0 - 3)
+
+- srom-timing : array of 7 integers: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs
+
+Optional properties:
+- width : data width in bytes (1 or 2). If omitted, default of 1 is used.
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
