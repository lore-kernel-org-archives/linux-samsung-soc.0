From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 2/4] ARM: dts: exynos: Add SCU device node to exynos4.dtsi
Date: Fri, 04 Nov 2016 09:09:22 +0530
Message-ID: <1478230764-13748-3-git-send-email-pankaj.dubey@samsung.com>
References: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59106 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933216AbcKDDgj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 23:36:39 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG301B3OM0UEWB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2016 12:36:37 +0900 (KST)
In-reply-to: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Exynos4 like other Cortex-A9 SoC's has a Snoop Control Unit(SCU)
and its SFR are used during SMP boot and S2R. Add SCU node to the device tree.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5f034eb..6865ca9 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -78,6 +78,11 @@
 		reg = <0x10000000 0x100>;
 	};
 
+	scu: snoop-control-unit@10500000 {
+		compatible = "arm,cortex-a9-scu";
+		reg = <0x10500000 0x2000>;
+	};
+
 	memory-controller@12570000 {
 		compatible = "samsung,exynos4210-srom";
 		reg = <0x12570000 0x14>;
-- 
2.7.4
