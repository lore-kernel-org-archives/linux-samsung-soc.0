From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v3 1/4] Documentation: dt-bindings: Describe SROMc configuration
Date: Wed, 28 Oct 2015 10:57:35 +0300
Message-ID: <046d990092dc85cf50db9082fc894d93a3ece7c0.1446018918.git.p.fedin@samsung.com>
References: <cover.1446018918.git.p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13007 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752330AbbJ1H5p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 03:57:45 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX000W17G75S40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 07:57:43 +0000 (GMT)
In-reply-to: <cover.1446018918.git.p.fedin@samsung.com>
In-reply-to: <cover.1446018918.git.p.fedin@samsung.com>
References: <cover.1446018918.git.p.fedin@samsung.com>
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
