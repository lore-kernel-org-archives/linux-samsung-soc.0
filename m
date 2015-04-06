From: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/11] ARM: dts: Use phandle notation for overriding nodes in Exynos4412
Date: Mon,  6 Apr 2015 22:28:19 +0200
Message-ID: <1428352102-12855-9-git-send-email-k.kozlowski.k@gmail.com>
References: <1428352102-12855-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428352102-12855-1-git-send-email-k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The phandle notation reduces possible mistakes when overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 68ad43b391ae..b78ada70bd05 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -54,19 +54,19 @@
 		};
 	};
 
-	combiner: interrupt-controller@10440000 {
-		samsung,combiner-nr = <20>;
-	};
-
 	pmu {
 		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
 	};
+};
 
-	gic: interrupt-controller@10490000 {
-		cpu-offset = <0x4000>;
-	};
+&pmu_system_controller {
+	compatible = "samsung,exynos4412-pmu", "syscon";
+};
 
-	pmu_system_controller: system-controller@10020000 {
-		compatible = "samsung,exynos4412-pmu", "syscon";
-	};
+&combiner {
+	samsung,combiner-nr = <20>;
+};
+
+&gic {
+	cpu-offset = <0x4000>;
 };
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
