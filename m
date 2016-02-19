From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2] serial: samsung: drop the spinlock around uart_write_wakeup
Date: Fri, 19 Feb 2016 10:45:37 +0530
Message-ID: <1455858937-2380-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:34480 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbcBSFPw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Feb 2016 00:15:52 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Peter Hurley <peter@hurleysoftware.com>
Cc: linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

From: Anand Moon <linux.amoon@gmail.com>

drop the spin_unlock/lock around uart_write_wakeup to protect
write wakeup for uart port.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
changes logs: drop the previous approch of spin_unlock_irqrestore/save
---
 drivers/tty/serial/samsung.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index d72cd73..0cb70a9 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -758,11 +758,8 @@ static irqreturn_t s3c24xx_serial_tx_chars(int irq, void *id)
 		goto out;
 	}
 
-	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS) {
-		spin_unlock(&port->lock);
+	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
-		spin_lock(&port->lock);
-	}
 
 	if (uart_circ_empty(xmit))
 		s3c24xx_serial_stop_tx(port);
-- 
1.9.1
