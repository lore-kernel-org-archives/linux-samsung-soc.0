From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 2/4] ARM: dts: Add usb2phy to Exynos 5250
Date: Wed, 30 Apr 2014 14:25:08 +0530
Message-ID: <1398848110-6152-3-git-send-email-gautam.vivek@samsung.com>
References: <1398848110-6152-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398848110-6152-1-git-send-email-gautam.vivek@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, k.debski@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, kishon@ti.com, stern@rowland.harvard.edu, Vivek Gautam <gautam.vivek@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Kamil Debski <k.debski@samsung.com>

Add support to PHY of USB2 of the Exynos 5250 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
[gautam.vivek@samsung.com: Split the usb phy entries from
syscon entries from earlier patch: dts: Add usb2phy to Exynos 5250]
[gautam.vivek@samsung.com: Added phy entry for OHCI also along with EHCI]
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---

Changes from v7:
None

 arch/arm/boot/dts/exynos5250.dtsi |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 70f0cd5..51e554c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -563,6 +563,14 @@
 
 		clocks = <&clock CLK_USB2>;
 		clock-names = "usbhost";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&usb2_phy_gen 1>;
+			phy-names = "host";
+			status = "ok";
+		};
 	};
 
 	usb@12120000 {
@@ -572,6 +580,14 @@
 
 		clocks = <&clock CLK_USB2>;
 		clock-names = "usbhost";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&usb2_phy_gen 1>;
+			phy-names = "host";
+			status = "ok";
+		};
 	};
 
 	usb2_phy: usbphy@12130000 {
@@ -589,6 +605,16 @@
 		};
 	};
 
+	usb2_phy_gen: phy@12130000 {
+		compatible = "samsung,exynos5250-usb2-phy";
+		reg = <0x12130000 0x100>;
+		clocks = <&clock CLK_USB2>, <&clock CLK_FIN_PLL>;
+		clock-names = "phy", "ref";
+		#phy-cells = <1>;
+		samsung,sysreg-phandle = <&sysreg_system_controller>;
+		samsung,pmureg-phandle = <&pmu_system_controller>;
+	};
+
 	pwm: pwm@12dd0000 {
 		compatible = "samsung,exynos4210-pwm";
 		reg = <0x12dd0000 0x100>;
-- 
1.7.10.4
