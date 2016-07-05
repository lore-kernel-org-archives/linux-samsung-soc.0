From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/4] mfd: Add DT bindings documentation for Samsung Exynos
 LPASS
Date: Tue, 05 Jul 2016 19:13:05 +0200
Message-ID: <1467738785-31410-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds documentation of the DT bindings for the Samsung
Exynos SoC Low Power Audio Subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

There were few rather significant additions since v3 and I had to drop tags:
 Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
 Acked-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Changes since v3:
 - moved to Documentation/devicetree/bindings/mfd,
 - added #address-cells, #size-cells, ranges as required
   properties,
 - added description of the IP block subnodes and links
   to their binding's documentation.

Changes since v2:
 - none.
---
 .../bindings/mfd/samsung,exynos5433-lpass.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt

diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
new file mode 100644
index 0000000..7e97c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
@@ -0,0 +1,21 @@
+
+Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
+
+Required properties:
+
+ - compatible : "samsung,exynos5433-lpass"
+ - reg : should contain the LPASS top SFR region location and size
+ - samsung,pmu-syscon : the phandle to the Power Management Unit node
+ - #address-cells: should be 1
+ - #size-cells: should be 1
+ - ranges: must be present
+
+Each IP block of the Low Power Audio Subsystem should be specified
+as an optional sub-node. For "samsung,exynos5433-lpass" compatible
+this includes: UART, SLIMBUS, PCM, I2S, DMAC, Timers 0...4, WDT 0...1
+devices.
+
+Bindings of the sub-nodes are described in:
+ Documentation/devicetree/bindings/serial/samsung_uart.txt
+ Documentation/devicetree/bindings/sound/samsung-i2s.txt
+ Documentation/devicetree/bindings/dma/arm-pl330.txt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
