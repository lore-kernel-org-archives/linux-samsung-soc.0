From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 2/6] serial: samsung: Fix unintended usage of uart port 0 as
 console
Date: Sat, 19 Mar 2011 13:20:15 +0530
Message-ID: <1300521019-13612-3-git-send-email-thomas.ab@samsung.com>
References: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42603 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753965Ab1CSHwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Mar 2011 03:52:01 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIA004RROINUD50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:51:59 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIA00APIOIIEL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:52:00 +0900 (KST)
In-reply-to: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

In s3c24xx_serial_console_setup function, if the uart port that is
being setup as a console has not been initialized, an error can be
returned instead of using uart port 0 as the default console port.
The uart port that was intended to be used as a console could be
initialized at a later point during boot and then registered as a
console. This will avoid using uart port 0 as a unintended console
port.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/tty/serial/samsung.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 2335eda..1586440 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1417,10 +1417,8 @@ s3c24xx_serial_console_setup(struct console *co, char *options)
 
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
