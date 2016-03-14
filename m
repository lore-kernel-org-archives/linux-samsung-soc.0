From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 07/10] ARM: dts: Add thermal zone and cpufreq node for
 exynos3250-artik5 module
Date: Mon, 14 Mar 2016 11:04:13 +0900
Message-ID: <1457921056-21257-9-git-send-email-cw00.choi@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch enables the CPU frequency scaling for exynos3250-artik5 module
and adds the thernal zones with cpu cooling device to prevent the overheat
temperature.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 75b291c10cdc..877e4827df83 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -31,6 +31,25 @@
 		compatible = "samsung,secure-firmware";
 		reg = <0x0205F000 0x1000>;
 	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			cooling-maps {
+				map0 {
+					/* Corresponds to 500MHz */
+					cooling-device = <&cpu0 5 5>;
+				};
+				map1 {
+					/* Corresponds to 200MHz */
+					cooling-device = <&cpu0 8 8>;
+				};
+			};
+		};
+	};
+};
+
+&cpu0 {
+	cpu0-supply = <&buck2_reg>;
 };
 
 &i2c_0 {
@@ -296,6 +315,10 @@
 	status = "okay";
 };
 
+&tmu {
+	status = "okay";
+};
+
 &xusbxti {
 	clock-frequency = <24000000>;
 };
-- 
1.9.1
