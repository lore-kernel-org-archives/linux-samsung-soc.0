From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v4 1/4] ARM: common: vic: Parse interrupt and resume masks from device tree
Date: Sat,  9 Mar 2013 21:29:32 +0100
Message-ID: <1362860975-18635-2-git-send-email-tomasz.figa@gmail.com>
References: <1362860975-18635-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:65170 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263Ab3CIU3r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 15:29:47 -0500
Received: by mail-wg0-f51.google.com with SMTP id 8so3791239wgl.30
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Mar 2013 12:29:45 -0800 (PST)
In-Reply-To: <1362860975-18635-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>

This patch extends vic_of_init to parse valid interrupt sources
and resume sources masks from device tree.

If mask values are not specified in device tree, all sources
are assumed to be valid, as before this patch.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 Documentation/devicetree/bindings/arm/vic.txt | 6 ++++++
 drivers/irqchip/irq-vic.c                     | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/vic.txt b/Documentation/devicetree/bindings/arm/vic.txt
index 266716b..bb7137c 100644
--- a/Documentation/devicetree/bindings/arm/vic.txt
+++ b/Documentation/devicetree/bindings/arm/vic.txt
@@ -18,6 +18,9 @@ Required properties:
 Optional properties:
 
 - interrupts : Interrupt source for parent controllers if the VIC is nested.
+- interrupt-mask : Bit mask of valid interrupt sources (defaults to all valid)
+- wakeup-mask : Bit mask of interrupt sources that can wake up the system
+  (defaults to all allowed)
 
 Example:
 
@@ -26,4 +29,7 @@ Example:
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		reg = <0x60000 0x1000>;
+
+		interrupt-mask = <0xffffff7f>;
+		wakeup-mask = <0x0000ff7f>;
 	};
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index 3cf97aa..61602df 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -468,6 +468,8 @@ void __init vic_init(void __iomem *base, unsigned int irq_start,
 int __init vic_of_init(struct device_node *node, struct device_node *parent)
 {
 	void __iomem *regs;
+	u32 interrupt_mask = ~0;
+	u32 wakeup_mask = ~0;
 
 	if (WARN(parent, "non-root VICs are not supported"))
 		return -EINVAL;
@@ -476,10 +478,13 @@ int __init vic_of_init(struct device_node *node, struct device_node *parent)
 	if (WARN_ON(!regs))
 		return -EIO;
 
+	of_property_read_u32(node, "interrupt-mask", &interrupt_mask);
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
1.8.1.5
