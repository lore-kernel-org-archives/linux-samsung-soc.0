From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v5 02/20] clocksource: samsung_pwm_timer: Correct definition of AUTORELOAD bit
Date: Mon, 22 Jul 2013 22:54:33 +0200
Message-ID: <3872385.JQ2jXzack4@flatron>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f43.google.com ([209.85.214.43]:48499 "EHLO
	mail-bk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755913Ab3GVUyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 16:54:39 -0400
In-Reply-To: <1374278673-25615-4-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

PWM channel 4 has its autoreload bit located at different position. This
patch fixes the driver to account for that.

This fixes a problem with the clocksource hanging after it overflows because
it is not reloaded any more.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Changes since v4:
 - made the new definition more readable.

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 3fa5b07..89947c3 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -47,7 +47,11 @@
 #define TCON_START(chan)		(1 << (4 * (chan) + 0))
 #define TCON_MANUALUPDATE(chan)		(1 << (4 * (chan) + 1))
 #define TCON_INVERT(chan)		(1 << (4 * (chan) + 2))
-#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
+#define _TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
+#define _TCON_AUTORELOAD4(chan)		(1 << (4 * (chan) + 2))
+/* Position of autoreload bit of channel 4 (5 in TCON reg.) is different. */
+#define TCON_AUTORELOAD(chan)		\
+	((chan < 5) ? _TCON_AUTORELOAD(chan) : _TCON_AUTORELOAD4(chan))
 
 DEFINE_SPINLOCK(samsung_pwm_lock);
 EXPORT_SYMBOL(samsung_pwm_lock);
-- 
1.8.3.2
