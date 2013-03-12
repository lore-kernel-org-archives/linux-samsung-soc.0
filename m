From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 6/7] ARM: SAMSUNG: use clk_prepare_enable in samsung-time
Date: Tue, 12 Mar 2013 01:45:20 +0100
Message-ID: <201303120145.21072.heiko@sntech.de>
References: <201303120141.31262.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:40467 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754446Ab3CLApX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 20:45:23 -0400
In-Reply-To: <201303120141.31262.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

The common clock framework expects clocks to be prepared
before they are enabled.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/samsung-time.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/samsung-time.c b/arch/arm/plat-samsung/samsung-time.c
index f899cbc..6ebb851 100644
--- a/arch/arm/plat-samsung/samsung-time.c
+++ b/arch/arm/plat-samsung/samsung-time.c
@@ -355,7 +355,7 @@ static void __init samsung_timer_resources(void)
 	if (IS_ERR(timerclk))
 		panic("failed to get timers clock for timer");
 
-	clk_enable(timerclk);
+	clk_prepare_enable(timerclk);
 
 	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
 	s3c_device_timer[event_id].id = event_id;
@@ -369,7 +369,7 @@ static void __init samsung_timer_resources(void)
 	if (IS_ERR(tdiv_event))
 		panic("failed to get pwm-tdiv clock for event timer");
 
-	clk_enable(tin_event);
+	clk_prepare_enable(tin_event);
 
 	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
 	s3c_device_timer[source_id].id = source_id;
@@ -383,7 +383,7 @@ static void __init samsung_timer_resources(void)
 	if (IS_ERR(tdiv_source))
 		panic("failed to get pwm-tdiv clock for source timer");
 
-	clk_enable(tin_source);
+	clk_prepare_enable(tin_source);
 }
 
 void __init samsung_timer_init(void)
-- 
1.7.2.3
