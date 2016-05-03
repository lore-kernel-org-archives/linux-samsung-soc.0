From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC PATCH 07/12] ARM: dts: exynos: Move common nodes to exynos5.dtsi
Date: Tue,  3 May 2016 19:52:24 +0200
Message-ID: <1462297949-13824-8-git-send-email-krzk@kernel.org>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1462297949-13824-1-git-send-email-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos5420 and Exynos5250 share some nodes: the PWM and syscon
(sysreg_system_controller). Move them to parent DTSI to avoid
duplication.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5.dtsi    | 12 ++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi | 19 +++++--------------
 arch/arm/boot/dts/exynos5420.dtsi | 19 +++++--------------
 3 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index d5c0f18a4223..fe901152f3ea 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -63,6 +63,11 @@
 		interrupts = <1 9 0xf04>;
 	};
 
+	sysreg_system_controller: syscon@10050000 {
+		compatible = "samsung,exynos5-sysreg", "syscon";
+		reg = <0x10050000 0x5000>;
+	};
+
 	serial_0: serial@12C00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
@@ -87,6 +92,13 @@
 		interrupts = <0 54 0>;
 	};
 
+	pwm: pwm@12DD0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x12DD0000 0x100>;
+		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+		#pwm-cells = <3>;
+	};
+
 	rtc: rtc@101E0000 {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index c7158b2fb213..6762faaf12a8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -235,11 +235,6 @@
 		interrupt-parent = <&gic>;
 	};
 
-	sysreg_system_controller: syscon@10050000 {
-		compatible = "samsung,exynos5-sysreg", "syscon";
-		reg = <0x10050000 0x5000>;
-	};
-
 	watchdog@101D0000 {
 		compatible = "samsung,exynos5250-wdt";
 		reg = <0x101D0000 0x100>;
@@ -662,15 +657,6 @@
 		samsung,pmureg-phandle = <&pmu_system_controller>;
 	};
 
-	pwm: pwm@12dd0000 {
-		compatible = "samsung,exynos4210-pwm";
-		reg = <0x12dd0000 0x100>;
-		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
-		#pwm-cells = <3>;
-		clocks = <&clock CLK_PWM>;
-		clock-names = "timers";
-	};
-
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1070,6 +1056,11 @@
 	iommus = <&sysmmu_fimd1>;
 };
 
+&pwm {
+	clocks = <&clock CLK_PWM>;
+	clock-names = "timers";
+};
+
 &rtc {
 	clocks = <&clock CLK_RTC>;
 	clock-names = "rtc";
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 4c8523471c65..f7322d87095f 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -542,15 +542,6 @@
 		status = "disabled";
 	};
 
-	pwm: pwm@12dd0000 {
-		compatible = "samsung,exynos4210-pwm";
-		reg = <0x12dd0000 0x100>;
-		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
-		#pwm-cells = <3>;
-		clocks = <&clock CLK_PWM>;
-		clock-names = "timers";
-	};
-
 	dp_phy: dp-video-phy {
 		compatible = "samsung,exynos5420-dp-video-phy";
 		samsung,pmu-syscon = <&pmu_system_controller>;
@@ -823,11 +814,6 @@
 		interrupt-parent = <&gic>;
 	};
 
-	sysreg_system_controller: syscon@10050000 {
-		compatible = "samsung,exynos5-sysreg", "syscon";
-		reg = <0x10050000 0x5000>;
-	};
-
 	tmu_cpu0: tmu@10060000 {
 		compatible = "samsung,exynos5420-tmu";
 		reg = <0x10060000 0x100>;
@@ -1207,6 +1193,11 @@
 	iommu-names = "m0", "m1";
 };
 
+&pwm {
+	clocks = <&clock CLK_PWM>;
+	clock-names = "timers";
+};
+
 &rtc {
 	clocks = <&clock CLK_RTC>;
 	clock-names = "rtc";
-- 
2.5.0
