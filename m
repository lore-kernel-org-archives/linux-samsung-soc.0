From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v4 11/14] clocksource: samsung-time: Use clk_prepare_enable
Date: Thu, 04 Apr 2013 18:37:08 +0200
Message-ID: <1365093431-30621-12-git-send-email-t.figa@samsung.com>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28340 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762468Ab3DDQj3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 12:39:29 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKQ005UKOXPDM60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Apr 2013 01:39:28 +0900 (KST)
In-reply-to: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, sameo@linux.intel.com, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>

This patch modifies the driver to use clk_prepare_enable instead of
clk_enable, as required to be compliant with Common Clock Framework.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung-time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/samsung-time.c b/drivers/clocksource/samsung-time.c
index e617d37..7674882 100644
--- a/drivers/clocksource/samsung-time.c
+++ b/drivers/clocksource/samsung-time.c
@@ -383,7 +383,7 @@ static void __init samsung_timer_resources(void)
 	if (IS_ERR(timerclk))
 		panic("failed to get timers clock for timer");
 
-	clk_enable(tin_source);
+	clk_prepare_enable(timerclk);
 
 	timer_source.tcnt_max = (1UL << pwm->variant.bits) - 1;
 	if (pwm->variant.bits == 16) {
-- 
1.8.1.5
