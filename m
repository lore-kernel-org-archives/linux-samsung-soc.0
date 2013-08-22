From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks from device tree
Date: Fri, 23 Aug 2013 01:22:32 +0200
Message-ID: <1500724.07LRpFtgcx@flatron>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <1377120111-25601-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1377120111-25601-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-gpio@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch extends vic_of_init to parse valid interrupt sources
and resume sources masks from device tree.

If mask values are not specified in device tree, all sources
are assumed to be valid, as before this patch.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 Documentation/devicetree/bindings/arm/vic.txt | 6 ++++++
 drivers/irqchip/irq-vic.c                     | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

Changes since v7:
 - Renamed interrupt-mask property to valid-mask, for consistency with
   bindings of other interrupt controllers.

diff --git a/Documentation/devicetree/bindings/arm/vic.txt b/Documentation/devicetree/bindings/arm/vic.txt
index 266716b..3379666 100644
--- a/Documentation/devicetree/bindings/arm/vic.txt
+++ b/Documentation/devicetree/bindings/arm/vic.txt
@@ -18,6 +18,9 @@ Required properties:
 Optional properties:
 
 - interrupts : Interrupt source for parent controllers if the VIC is nested.
+- valid-mask : Bit mask of valid interrupt sources (defaults to all valid)
+- wakeup-mask : Bit mask of interrupt sources that can wake up the system
+  (defaults to all allowed)
 
 Example:
 
@@ -26,4 +29,7 @@ Example:
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		reg = <0x60000 0x1000>;
+
+		valid-mask = <0xffffff7f>;
+		wakeup-mask = <0x0000ff7f>;
 	};
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index 2bbb004..6437b18 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -469,6 +469,8 @@ void __init vic_init(void __iomem *base, unsigned int irq_start,
 int __init vic_of_init(struct device_node *node, struct device_node *parent)
 {
 	void __iomem *regs;
+	u32 interrupt_mask = ~0;
+	u32 wakeup_mask = ~0;
 
 	if (WARN(parent, "non-root VICs are not supported"))
 		return -EINVAL;
@@ -477,10 +479,13 @@ int __init vic_of_init(struct device_node *node, struct device_node *parent)
 	if (WARN_ON(!regs))
 		return -EIO;
 
+	of_property_read_u32(node, "valid-mask", &interrupt_mask);
+	of_property_read_u32(node, "wakeup-mask", &wakeup_mask);
+
 	/*
 	 * Passing 0 as first IRQ makes the simple domain allocate descriptors
 	 */
-	__vic_init(regs, 0, ~0, ~0, node);
+	__vic_init(regs, 0, interrupt_mask, wakeup_mask, node);
 
 	return 0;
 }
-- 
1.8.3.2


