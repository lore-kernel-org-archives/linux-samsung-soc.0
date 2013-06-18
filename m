From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH] clocksource: samsung_pwm: Correct definition of AUTORELOAD bit
Date: Tue, 18 Jun 2013 19:41:07 +0200
Message-ID: <1371577267-2860-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:51417 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322Ab3FRRln (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 13:41:43 -0400
Received: by mail-bk0-f52.google.com with SMTP id d7so1896699bkh.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 10:41:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

PWM channel 4 (logically channel 5 in TCON register) has its autoreload
bit located at different position. This patch fixes the driver to account
for this.

This fixes a problem with clocksource hanging after it overflows because
it is not reloaded any more.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 2977043..6af178f 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -47,7 +47,8 @@
 #define TCON_START(chan)		(1 << (4 * (chan) + 0))
 #define TCON_MANUALUPDATE(chan)		(1 << (4 * (chan) + 1))
 #define TCON_INVERT(chan)		(1 << (4 * (chan) + 2))
-#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
+#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) \
+						+ (((chan) < 5) ? 3 : 2)))
 
 DEFINE_SPINLOCK(samsung_pwm_lock);
 EXPORT_SYMBOL(samsung_pwm_lock);
-- 
1.8.2.1
