From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/2] Documentation: DT: Exynos: Bind SRAM though DT
Date: Tue,  6 May 2014 13:40:24 +0530
Message-ID: <1399363824-23543-2-git-send-email-sachin.kamat@linaro.org>
References: <1399363824-23543-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399363824-23543-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add SRAM binding documentation.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
No changes since v1.
---
 .../devicetree/bindings/arm/exynos/smp-sram.txt    |   38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/exynos/smp-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/exynos/smp-sram.txt b/Documentation/devicetree/bindings/arm/exynos/smp-sram.txt
new file mode 100644
index 000000000000..c9ff2f58f9b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/exynos/smp-sram.txt
@@ -0,0 +1,38 @@
+Samsung Exynos SRAM for SMP bringup:
+------------------------------------
+
+Samsung SMP-capable Exynos SoCs use part of the SRAM for the bringup
+of the secondary cores. Once the core gets powered up it executes the
+code that is residing at some specific location of the SRAM.
+
+Therefore reserved section sub-nodes have to be added to the mmio-sram
+declaration. These nodes are of two types depending upon secure or
+non-secure execution environment.
+
+Required sub-node properties:
+- compatible : depending upon boot mode, should be
+		"samsung,exynos4210-sram" : for Secure SYSRAM
+		"samsung,exynos4210-sram-ns" : for Non-secure SYSRAM
+
+The rest of the properties should follow the generic mmio-sram discription
+found in ../../misc/sram.txt
+
+Example:
+
+	sram@02020000 {
+		compatible = "mmio-sram";
+		reg = <0x02020000 0x54000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x02020000 0x54000>;
+
+		smp-sram@0 {
+			compatible = "samsung,exynos4210-sram";
+			reg = <0x0 0x1000>;
+		};
+
+		smp-sram@53000 {
+			compatible = "samsung,exynos4210-sram-ns";
+			reg = <0x53000 0x1000>;
+		};
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
