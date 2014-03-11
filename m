From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/5] ARM: dts: exynos4x12: Add ADC's dt data to read raw data
Date: Tue, 11 Mar 2014 16:54:50 +0900
Message-ID: <1394524494-30641-2-git-send-email-cw00.choi@samsung.com>
References: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch add ADC(Analog to Digital Converter)'s dt data to get raw data
with IIO subsystem. Usually, ADC is used to check temperature, jack type, and
so on.

Register map
- <0x126C0000 0x100> : ADC register's base address
- <0x10020718 0x4> : ADC_PHY_CONTROL, TS-ADC control register address

Clock
- <&clock 326> : ADC clock (clock name :'tsadc')

Interrupt
- INTG10[3] : ADC for General ADC

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 5c412aa..5a3e551 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -80,6 +80,18 @@
 		};
 	};
 
+	adc: adc@126C0000 {
+		compatible = "samsung,exynos-adc-v1";
+		reg = <0x126C0000 0x100>, <0x10020718 0x4>;
+		interrupt-parent = <&combiner>;
+		interrupts = <10 3>;
+		clocks = <&clock 326>;
+		clock-names = "adc";
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		status = "disabled";
+	};
+
 	pinctrl_2: pinctrl@03860000 {
 		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x03860000 0x1000>;
-- 
1.8.0
