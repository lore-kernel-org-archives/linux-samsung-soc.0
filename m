From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v4 06/13] ARM: dts: exynos4: Use labels for overriding nodes in Exynos4212
Date: Mon, 11 May 2015 22:42:46 +0900
Message-ID: <1431351773-2031-7-git-send-email-k.kozlowski.k@gmail.com>
References: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:34437 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932173AbbEKNol (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 09:44:41 -0400
In-Reply-To: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Usage of labels instead of full paths reduces possible mistakes when
overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos4212.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 5be03288f1ee..d9c8efeef208 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -41,12 +41,12 @@
 			reg = <0xA01>;
 		};
 	};
+};
 
-	combiner: interrupt-controller@10440000 {
-		samsung,combiner-nr = <18>;
-	};
+&combiner {
+	samsung,combiner-nr = <18>;
+};
 
-	gic: interrupt-controller@10490000 {
-		cpu-offset = <0x8000>;
-	};
+&gic {
+	cpu-offset = <0x8000>;
 };
-- 
2.1.4
