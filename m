From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: s5pv210: Fix onenand's unit address format warning
Date: Wed,  9 Jan 2019 14:43:03 +0100
Message-ID: <1547041383-16924-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

According to Devicetree specification, the unit-address must match the
first address specified in the reg property of the node.  Fix the DTC
warning onenand node:

    arch/arm/boot/dts/s5pv210.dtsi:81.29-93.5:
        Warning (simple_bus_reg): /soc/onenand@b0000000: simple-bus unit address format error, expected "b0600000"

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

The remaining warning is wrong clock-controller subnode of fimc camera.
    arch/arm/boot/dts/s5pv210.dtsi:578.32-580.6: Warning (simple_bus_reg): /soc/camera/clock-controller: missing or empty reg/ranges property
The subnode in my understanding does not follow bindings and the driver.
The driver with current s5pv210.dtsi will not register a clock provider... but
I do not have a device to confirm this.
---
 arch/arm/boot/dts/s5pv210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index cc22c9db80d2..26ea5c66d8ce 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -78,7 +78,7 @@
 			};
 		};
 
-		onenand: onenand@b0000000 {
+		onenand: onenand@b0600000 {
 			compatible = "samsung,s5pv210-onenand";
 			reg = <0xb0600000 0x2000>,
 				<0xb0000000 0x20000>,
-- 
2.7.4
