From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH 2/4] ARM: dts: exynos: specify snps,dwmac in compatible string for gmac
Date: Wed, 23 Nov 2016 15:24:51 +0100
Message-ID: <1479911091-19812-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:56858 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756519AbcKWOZe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 09:25:34 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Niklas Cassel <niklass@axis.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Niklas Cassel <niklas.cassel@axis.com>

devicetree binding for stmmac states:
- compatible: Should be "snps,dwmac-<ip_version>", "snps,dwmac"
	For backwards compatibility: "st,spear600-gmac" is also supported.

No functional change intended.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 arch/arm/boot/dts/exynos5440.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 97c9f0e38526..2a2e570bbee6 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -197,7 +197,7 @@
 	};
 
 	gmac: ethernet@00230000 {
-		compatible = "snps,dwmac-3.70a";
+		compatible = "snps,dwmac-3.70a", "snps,dwmac";
 		reg = <0x00230000 0x8000>;
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 31 4>;
-- 
2.1.4
