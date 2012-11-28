From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 1/3] ARM: dts: Add device tree node for G2D controller on
 Exynos5
Date: Wed, 28 Nov 2012 19:59:47 +0530
Message-ID: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41853 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755057Ab2K1OHf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Nov 2012 09:07:35 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME7004FOB8MMI11@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Nov 2012 23:07:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME700GC9B6YQ860@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Nov 2012 23:07:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: thomas.abraham@linaro.org

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 581e57a..6d50c15 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -613,4 +613,10 @@
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 	};
+
+	g2d: g2d {
+		compatible = "samsung,exynos-g2d-41";
+		reg = <0x10850000 0x1000>;
+		interrupts = <0 91 0>;
+	};
 };
-- 
1.7.1
