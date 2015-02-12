From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 6/8] arm64: dts: exynos: Add RTC and ADC dt node for
 Exynos5433 SoC
Date: Thu, 12 Feb 2015 15:55:56 +0900
Message-ID: <1423724158-23632-7-git-send-email-cw00.choi@samsung.com>
References: <1423724158-23632-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1423724158-23632-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, jh80.chung@samsung.com, arnd@arndb.de, cw00.choi@samsung.com, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, a.kesavan@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, devicetree@vger.kernel.org, kgene@kernel.org, sangbae90.lee@samsung.com, olof@lixom.net, chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds RTC (Real Time Clock) dt node for Exynos5433 SoC and adds
ADC dt node for Exynos5433 SoC. The c1b501564c98a94b4(iio: adc: exynos_adc:
Add support for exynos7) commit supports the ADC for Exynos7. Exynos5433's ADC
IP is the same with Exynos7's ADC IP. Exynos5433 has a little different from
ADCv2 on ADC_CON2 register. Exynos5433 don't contain OSEL/ESEL /HIGHF of ADC_CON2.

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0168786..8e9ca8d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -852,6 +852,24 @@
 			clocks = <&xxti>;
 		};
 
+		rtc: rtc@10590000 {
+			compatible = "samsung,exynos3250-rtc";
+			reg = <0x10590000 0x100>;
+			interrupts = <0 385 0>, <0 386 0>;
+			status = "disabled";
+		};
+
+		adc: adc@14d10000 {
+			compatible = "samsung,exynos7-adc";
+			reg = <0x14d10000 0x100>;
+			interrupts = <0 438 0>;
+			clock-names = "adc";
+			clocks = <&cmu_peric CLK_PCLK_ADCIF>;
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+			status = "disabled";
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <1 13 0xff04>,
-- 
1.8.5.5
