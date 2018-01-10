From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: dts: s5pv210: add interrupt-parent for ohci
Date: Wed, 10 Jan 2018 17:10:11 +0100
Message-ID: <20180110161045.4052684-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The ohci-hcd node has an interrupt number but no interrupt-parent,
leading to a warning with current dtc versions:

arch/arm/boot/dts/s5pv210-aquila.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-goni.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-smdkc110.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-smdkv210.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-torbreck.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000

As seen from the related exynos dts files, the ohci and ehci controllers
always share one interrupt number, and the number is the same here as
well, so setting the same interrupt-parent is the reasonable solution
here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/s5pv210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 247c0029659c..67358562a6ea 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -460,6 +460,7 @@
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0xec300000 0x100>;
 			interrupts = <23>;
+			interrupt-parent = <&vic1>;
 			clocks = <&clocks CLK_USB_HOST>;
 			clock-names = "usbhost";
 			#address-cells = <1>;
-- 
2.9.0
