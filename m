From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 1/7] ARM: dts: exynos: Add missing memory node for Exynos5440 boards
Date: Thu,  1 Sep 2016 11:06:50 +0200
Message-ID: <1472720817-20362-2-git-send-email-javier@osg.samsung.com>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The skeleton.dtsi file was removed in ARM64 for different reasons as
explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").

These also applies to ARM and it will also allow to get rid of the
following DTC warnings in the future:

"Node /memory has a reg or ranges property, but no unit name"

But these boards don't have a memory node defined, so removing the
skeleton.dtsi inclusion in exynos5440.dtsi will cause a change in
the compiled DTB. Add a dummy memory node so the compiled DTB does
not change if the skeleton.dtsi is removed from exynos5440.dtsi.

Eventually the correct starting addresses and sizes should be used
but I didn't find that information.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v2:
- Add a fixme to specify that the correct memory values should be set.
  (Bartlomiej Zolnierkiewicz)
- Fix commit message (Krzysztof Kozlowski).

 arch/arm/boot/dts/exynos5440-sd5v1.dts    | 6 ++++++
 arch/arm/boot/dts/exynos5440-ssdk5440.dts | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
index a98501bab6fc..afd21a41e05b 100644
--- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -20,6 +20,12 @@
 		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
+	/* FIXME: set reg property with correct start address and size */
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
 	fixed-rate-clocks {
 		xtal {
 			compatible = "samsung,clock-xtal";
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index 6a0d802e87c8..bdb3bf622e2f 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -21,6 +21,12 @@
 		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
+	/* FIXME: set reg property with correct start address and size */
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
 	fixed-rate-clocks {
 		xtal {
 			compatible = "samsung,clock-xtal";
-- 
2.7.4
