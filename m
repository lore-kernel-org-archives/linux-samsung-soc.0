From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v8 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Thu, 12 Nov 2015 16:12:04 +0300
Message-ID: <e9e18ab5aa7a147aaa63d1900ad52174413e86d9.1447333689.git.p.fedin@samsung.com>
References: <cover.1447333689.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <cover.1447333689.git.p.fedin@samsung.com>
In-reply-to: <cover.1447333689.git.p.fedin@samsung.com>
References: <cover.1447333689.git.p.fedin@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add documentation for new subnode properties, allowing bank configuration.
Based on u-boot implementation, but heavily reworked.

Also, fix size of SROMc mapping in the example.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 .../bindings/arm/samsung/exynos-srom.txt           | 73 +++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
index 33886d5..07c8507 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
@@ -5,8 +5,77 @@ Required properties:
 
 - reg: offset and length of the register set
 
-Example:
+Optional properties:
+The SROM controller can be used to attach external peripherals. In this case
+extra properties, describing the bus behind it, should be specified as below:
+
+- #address-cells: Must be set to 2 to allow device address translation.
+		  Address is specified as (bank#, offset).
+
+- #size-cells: Must be set to 1 to allow device size passing
+
+- ranges: Must be set up to reflect the memory layout with four integer values
+	  per bank:
+		<bank-number> 0 <parent address of bank> <size>
+
+Sub-nodes:
+The actual device nodes should be added as subnodes to the SROMc node. These
+subnodes, except regular device specification, should contain the following
+properties, describing configuration of the relevant SROM bank:
+
+Required properties:
+- reg: bank number, base address (relative to start of the bank) and size of
+       the memory mapped for the device. Note that base address will be
+       typically 0 as this is the start of the bank.
+
+- samsung,srom-timing : array of 6 integers, specifying bank timings in the
+                        following order: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs.
+                        Each value is specified in cycles and has the following
+                        meaning and valid range:
+                        Tacp : Page mode access cycle at Page mode (0 - 15)
+                        Tcah : Address holding time after CSn (0 - 15)
+                        Tcoh : Chip selection hold on OEn (0 - 15)
+                        Tacc : Access cycle (0 - 31, the actual time is N + 1)
+                        Tcos : Chip selection set-up before OEn (0 - 15)
+                        Tacs : Address set-up before CSn (0 - 15)
+
+Optional properties:
+- reg-io-width : data width in bytes (1 or 2). If omitted, default of 1 is used.
+
+- samsung,srom-page-mode : page mode configuration for the bank:
+			   0 - normal (one data)
+			   1 - four data
+			   If omitted, default of 0 is used.
+
+Example: basic definition, no banks are configured
+	sromc@12570000 {
+		compatible = "samsung,exynos-srom";
+		reg = <0x12570000 0x14>;
+	};
+
+Example: SROMc with SMSC911x ethernet chip on bank 3
 	sromc@12570000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0x04000000 0x20000   // Bank0
+			  1 0 0x05000000 0x20000   // Bank1
+			  2 0 0x06000000 0x20000   // Bank2
+			  3 0 0x07000000 0x20000>; // Bank3
+
 		compatible = "samsung,exynos-srom";
-		reg = <0x12570000 0x10>;
+		reg = <0x12570000 0x14>;
+
+		ethernet@3 {
+			compatible = "smsc,lan9115";
+			reg = <3 0 0x10000>;	   // Bank 3, offset = 0
+			phy-mode = "mii";
+			interrupt-parent = <&gpx0>;
+			interrupts = <5 8>;
+			reg-io-width = <2>;
+			smsc,irq-push-pull;
+			smsc,force-internal-phy;
+
+			samsung,srom-page-mode = <1>;
+			samsung,srom-timing = <9 12 1 9 1 1>;
+		};
 	};
-- 
2.4.4
