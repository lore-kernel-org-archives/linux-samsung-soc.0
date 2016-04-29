From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT PATCH 2/3] ARM: dts: exynos: Provide regulator for usb3503 on
 Odroid to fix device detection
Date: Fri, 29 Apr 2016 12:59:50 +0200
Message-ID: <1461927591-7864-3-git-send-email-k.kozlowski@samsung.com>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, hverkuil@xs4all.nl, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Odroid U3 (Exynos4412-based) board if USB was initialized by
bootloader (in U-Boot "usb start" before tftpboot), the HUB after
successful probing was not visible in the system ("lsusb"). Connected
devices were not visible neither.

The USB3503 takes optional regulator so provide one - buck8 on Odroid
U3.

Additionally switch the control of buck8 to GPIO mode. It is faster than
I2C/register mode and it is the easiest way to disable it (regulator
state is a logical OR state of GPIO and register value).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index d73aa6c58fe3..5308a955ede4 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -74,6 +74,7 @@
 	regulator-name = "BUCK8_P3V3";
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
+	maxim,ena-gpios = <&gpa1 1 GPIO_ACTIVE_HIGH>;
 };
 
 /* VDDQ for MSHC (eMMC card) */
@@ -98,6 +99,7 @@
 	clock-names = "refclk";
 	clocks = <&pmu_system_controller 0>;
 	refclk-frequency = <24000000>;
+	vdd33-supply = <&buck8_reg>;
 };
 
 &ehci {
-- 
1.9.1
