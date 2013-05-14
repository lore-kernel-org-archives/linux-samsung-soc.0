From: George Joseph <george.jp@samsung.com>
Subject: [RFC PATCH 3/3] ARM: dts: Add documentation for Samsung JPEG driver
 bindings
Date: Tue, 14 May 2013 17:23:40 +0530
Message-ID: <1368532420-21555-4-git-send-email-george.jp@samsung.com>
References: <1368532420-21555-1-git-send-email-george.jp@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1368532420-21555-1-git-send-email-george.jp@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, a.hajda@samsung.com, ym.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

Added documentation for Samsung JPEG driver DT bindings.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: George Joseph Palathingal <george.jp@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org
---
 .../devicetree/bindings/media/samsung-s5p-jpeg.txt |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/samsung-s5p-jpeg.txt

diff --git a/Documentation/devicetree/bindings/media/samsung-s5p-jpeg.txt b/Documentation/devicetree/bindings/media/samsung-s5p-jpeg.txt
new file mode 100644
index 0000000..e44c4da
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung-s5p-jpeg.txt
@@ -0,0 +1,21 @@
+Samsung S5P/EXYNOS SoC series JPEG codec
+
+Required properties:
+
+- compatible	: "samsung,<soc_name>-jpeg", must be one of:
+		  "samsung,s5pv210-jpeg", "samsung,exynos4212-jpeg";
+- reg		: address and length of the JPEG codec register set;
+- interrupts	: should contain the JPEG codec interrupt; format of the
+		  interrupt specifier depends on the interrupt controller;
+- clocks	: jpeg clock specifier, as covered by common clock bindings.
+- clock-names	: must contain "jpeg" entry.
+
+Example:
+
+jpeg@11840000 {
+	compatible = "samsung,s5pv210-jpeg";
+	reg = <0x11840000 0x3FF>;
+	interrupts = <0 88 0>;
+	clocks = <&clock 262>;
+	clock-names = "jpeg";
+};
-- 
1.7.9.5
