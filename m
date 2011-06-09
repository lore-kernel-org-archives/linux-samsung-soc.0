From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 1/9] serial: samsung: Fix unintended usage of uart port 0 as
 console
Date: Thu, 09 Jun 2011 10:08:36 +0530
Message-ID: <1307594324-11053-2-git-send-email-thomas.ab@samsung.com>
References: <1307594324-11053-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19695 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917Ab1FIEaH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 00:30:07 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMI00HA69T5PQN0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jun 2011 13:30:07 +0900 (KST)
Received: from localhost.localdomain (unknown [107.108.73.37])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMI006H19TUPU60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jun 2011 13:30:06 +0900 (KST)
In-reply-to: <1307594324-11053-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

In s3c24xx_serial_console_setup function, if the uart port that is
being setup as a console has not been initialized, an error can be
returned instead of using uart port 0 as the default console port.
The uart port that was intended to be used as a console could be
initialized at a later point during boot and then registered as a
console. This will avoid using uart port 0 as a unintended console
port.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/tty/serial/samsung.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index f66f648..014c1c3 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1416,10 +1416,8 @@ s3c24xx_serial_console_setup(struct console *co, char *options)
 
 	/* is the port configured? */
 
-	if (port->mapbase == 0x0) {
-		co->index = 0;
-		port = &s3c24xx_serial_ports[co->index].port;
-	}
+	if (port->mapbase == 0x0)
+		return -ENODEV;
 
 	cons_uart = port;
 
-- 
1.6.6.rc2
