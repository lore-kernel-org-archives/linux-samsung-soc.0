From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 08/13] clocksource: samsung_pwm_timer: Correct programming
 of clock events
Date: Tue, 23 Apr 2013 17:46:29 +0200
Message-ID: <1366731994-7478-9-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53515 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756636Ab3DWPsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 11:48:53 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLP001JST9G7M20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Apr 2013 00:48:52 +0900 (KST)
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

In current code, the tick count value programmed to the hardware is
always decremented by one. This is reasonable for periodic mode, since
there is one extra tick between 0 and COUNT (after reloading), but it
makes oneshot events happen 1 tick earlier than requested, because the
interrupt is triggered on transition from 1 to 0.

This patch removes the decrementation from PWM channel setup code and
moves it instead to periodic timer setup, to make both periodic and
oneshot modes work correctly.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index cb86615..92b2f13 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -138,8 +138,6 @@ static void samsung_time_setup(unsigned int channel, unsigned long tcnt)
 
 	tcon = __raw_readl(pwm.base + REG_TCON);
 
-	tcnt--;
-
 	tcon &= ~(TCON_START(tcon_chan) | TCON_AUTORELOAD(tcon_chan));
 	tcon |= TCON_MANUALUPDATE(tcon_chan);
 
@@ -187,7 +185,7 @@ static int samsung_set_next_event(unsigned long cycles,
 static void samsung_timer_resume(void)
 {
 	/* event timer restart */
-	samsung_time_setup(pwm.event_id, pwm.clock_count_per_tick);
+	samsung_time_setup(pwm.event_id, pwm.clock_count_per_tick - 1);
 	samsung_time_start(pwm.event_id, true);
 
 	/* source timer restart */
@@ -202,7 +200,7 @@ static void samsung_set_mode(enum clock_event_mode mode,
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
-		samsung_time_setup(pwm.event_id, pwm.clock_count_per_tick);
+		samsung_time_setup(pwm.event_id, pwm.clock_count_per_tick - 1);
 		samsung_time_start(pwm.event_id, true);
 		break;
 
-- 
1.8.2.1
