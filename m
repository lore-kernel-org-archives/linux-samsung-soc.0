From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 13/24] ARM: s5pv310: update clock source registration
Date: Mon, 13 Dec 2010 19:19:24 +0000
Message-ID: <E1PSDvg-0008D8-6F@rmk-PC.arm.linux.org.uk>
References: <20101213191437.GN8665@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:35322 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752470Ab0LMTTk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Dec 2010 14:19:40 -0500
In-Reply-To: <20101213191437.GN8665@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

In d7e81c2 (clocksource: Add clocksource_register_hz/khz interface) new
interfaces were added which simplify (and optimize) the selection of the
divisor shift/mult constants.  Switch over to using this new interface.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/mach-s5pv310/time.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s5pv310/time.c b/arch/arm/mach-s5pv310/time.c
index 01b012a..b262d46 100644
--- a/arch/arm/mach-s5pv310/time.c
+++ b/arch/arm/mach-s5pv310/time.c
@@ -211,7 +211,6 @@ struct clocksource pwm_clocksource = {
 	.rating		= 250,
 	.read		= s5pv310_pwm4_read,
 	.mask		= CLOCKSOURCE_MASK(32),
-	.shift		= 20,
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS ,
 };
 
@@ -230,10 +229,7 @@ static void __init s5pv310_clocksource_init(void)
 	s5pv310_pwm_init(4, ~0);
 	s5pv310_pwm_start(4, 1);
 
-	pwm_clocksource.mult =
-		clocksource_khz2mult(clock_rate/1000, pwm_clocksource.shift);
-
-	if (clocksource_register(&pwm_clocksource))
+	if (clocksource_register_hz(&pwm_clocksource, clock_rate))
 		panic("%s: can't register clocksource\n", pwm_clocksource.name);
 }
 
-- 
1.6.2.5
