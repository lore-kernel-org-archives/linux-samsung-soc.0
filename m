From: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 13/13] ARM: dts: Use labels for overriding nodes in exynos4412-tiny4412
Date: Thu, 14 May 2015 19:12:20 +0900
Message-ID: <1431598340-3319-14-git-send-email-k.kozlowski.k@gmail.com>
References: <1431598340-3319-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431598340-3319-1-git-send-email-k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Usage of labels instead of full paths reduces possible mistakes when
overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412-tiny4412.dts | 54 +++++++++++++++----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index d46fd4c2aeaa..525684ca8dc0 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -56,33 +56,6 @@
 		};
 	};
 
-	rtc@10070000 {
-		status = "okay";
-	};
-
-	sdhci@12530000 {
-		bus-width = <4>;
-		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-		pinctrl-names = "default";
-		status = "okay";
-	};
-
-	serial@13800000 {
-		status = "okay";
-	};
-
-	serial@13810000 {
-		status = "okay";
-	};
-
-	serial@13820000 {
-		status = "okay";
-	};
-
-	serial@13830000 {
-		status = "okay";
-	};
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -95,3 +68,30 @@
 		};
 	};
 };
+
+&rtc {
+	status = "okay";
+};
+
+&sdhci_2 {
+	bus-width = <4>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&serial_1 {
+	status = "okay";
+};
+
+&serial_2 {
+	status = "okay";
+};
+
+&serial_3 {
+	status = "okay";
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
