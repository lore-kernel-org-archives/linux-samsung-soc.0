From: Alexey Klimov <klimov.linux@gmail.com>
Subject: [RFC PATCH 2/3] documentation: dt: mct: add desc of optional
 property use-cp15-phys-counter
Date: Tue, 28 Jul 2015 00:28:44 +0300
Message-ID: <1438032524.17734.48.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:36409 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754525AbbG0V2r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 17:28:47 -0400
Received: by lagw2 with SMTP id w2so57068720lag.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2015 14:28:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org, dianders@chromium.org, chirantan@chromium.org
Cc: klimov.linux@gmail.com, t.dakhran@gmail.com, k.kozlowski@samsung.com, kgene@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, yury.norov@gmail.com

Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.txt       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
index 167d5da..c7f6354 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
@@ -36,6 +36,16 @@ Required properties:
   interrupt might be specified, meaning that all local timers use the same
   per processor interrupt.
 
+Optional properties:
+
+- use-cp15-phys-counter : set to advise mct clocksource driver to use ARM
+  arch timer 64-bit counter as main counter. Access to this coprocessor
+  counter is faster than access to same counter in mct mmio region.
+  It was discovered that mct and ARM arch timer are same underlying hardware
+  on some SoCs.
+  Only supported for Exynos5-based 32-bit systems which follow the ARMv7
+  architecture.
+
 Example 1: In this example, the IP contains two local timers, using separate
 	   interrupts, so two local timer interrupts have been specified,
 	   in addition to four global timer interrupts.
-- 
2.1.4
