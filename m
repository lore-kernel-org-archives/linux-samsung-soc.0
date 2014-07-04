From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 04/19] serial: samsung: Remove support for legacy clock code
Date: Fri, 04 Jul 2014 19:48:04 +0200
Message-ID: <1404496099-26708-5-git-send-email-t.figa@samsung.com>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14618 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759402AbaGDRtB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 13:49:01 -0400
In-reply-to: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

All Samsung platforms are now using the Common Clock Framework and the
legacy clock code is being removed, so remove related dead code from
samsung-serial driver as well.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:SERIAL DRIVERS)
Cc: Jiri Slaby <jslaby@suse.cz> (supporter:TTY LAYER)
Cc: linux-serial@vger.kernel.org (open list:SERIAL DRIVERS)
---
 drivers/tty/serial/samsung.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 36c7747..cae8ebd 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -47,10 +47,6 @@
 
 #include <asm/irq.h>
 
-#ifdef CONFIG_SAMSUNG_CLOCK
-#include <plat/clock.h>
-#endif
-
 #include "samsung.h"
 
 #if	defined(CONFIG_SERIAL_SAMSUNG_DEBUG) &&	\
-- 
1.9.3
