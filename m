From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH v6 4/8] dts: Add usb2phy to Exynos 5250
Date: Wed, 29 Jan 2014 18:29:30 +0100
Message-ID: <1391016574-25237-5-git-send-email-k.debski@samsung.com>
References: <1391016574-25237-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1391016574-25237-1-git-send-email-k.debski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, k.debski@samsung.com, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu
List-Id: linux-samsung-soc@vger.kernel.org

Add support to PHY of USB2 of the Exynos 5250 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index c4480a1..efeaf87 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -163,6 +163,11 @@
 		interrupts = <0 47 0>;
 	};
 
+	sys_syscon: syscon@10040000 {
+		compatible = "samsung,exynos5250-sys", "syscon";
+		reg = <0x10050000 0x5000>;
+	};
+
 	pmu_syscon: syscon@10040000 {
 		compatible = "samsung,exynos5250-pmu", "syscon";
 		reg = <0x10040000 0x5000>;
@@ -505,6 +510,14 @@
 
 		clocks = <&clock 285>;
 		clock-names = "usbhost";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&usb2_phy_new 1>;
+			phy-names = "host";
+			status = "ok";
+		};
 	};
 
 	usb@12120000 {
@@ -531,6 +544,17 @@
 		};
 	};
 
+	usb2_phy_new: phy@12130000 {
+		compatible = "samsung,exynos5250-usb2-phy";
+		reg = <0x12130000 0x100>;
+		clocks = <&clock 285>, <&clock 1>, <&clock 1>, <&clock 1>,
+								<&clock 1>;
+		clock-names = "phy", "device", "host", "hsic0", "hsic1";
+		#phy-cells = <1>;
+		samsung,sysreg-phandle = <&sys_syscon>;
+		samsung,pmureg-phandle = <&pmu_syscon>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
