From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 2/6] ARM: common: vic: Fix invalid first IRQ number in OF-based registration
Date: Sun, 13 Jan 2013 02:10:54 +0100
Message-ID: <1358039458-31960-3-git-send-email-tomasz.figa@gmail.com>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:42768 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753781Ab3AMBLN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Jan 2013 20:11:13 -0500
Received: by mail-ea0-f169.google.com with SMTP id d13so11183eaa.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jan 2013 17:11:12 -0800 (PST)
In-Reply-To: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Tomasz Figa <tomasz.figa@gmail.com>

Without this patch, vic_of_init passed -1 as first IRQ number to
__vic_init (as signed int), then to vic_register (now as unsigned int
equals to 0xffffffff) and finally to irq_domain_add_simple (again as
unsigned 0xffffffff), which tries to allocate irq descriptors starting
from IRQ 0xffffffff, which obviously is bound to fail.

This patch corrects OF-based VIC registration by locating VICs in IRQ
address space starting from IRQ 32 and then placing one VIC after
another. This is similar to the solution used with GIC and allows to
maintain compatibility with legacy code using static IRQ numbers.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/common/vic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
index c2889da..8001994 100644
--- a/arch/arm/common/vic.c
+++ b/arch/arm/common/vic.c
@@ -421,9 +421,9 @@ int __init vic_of_init(struct device_node *node, struct device_node *parent)
 	of_property_read_u32(node, "wakeup-mask", &wakeup_mask);
 
 	/*
-	 * Passing -1 as first IRQ makes the simple domain allocate descriptors
+	 * Use IRQ numbers starting from 32 and placing each VIC after another
 	 */
-	__vic_init(regs, -1, interrupt_mask, wakeup_mask, node);
+	__vic_init(regs, 32 + (32 * vic_id), interrupt_mask, wakeup_mask, node);
 
 	return 0;
 }
-- 
1.8.1
