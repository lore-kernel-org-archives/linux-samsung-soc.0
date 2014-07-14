From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/3] serial: samsung: correct the case and default order in
 switch
Date: Mon, 14 Jul 2014 17:07:17 +0530
Message-ID: <1405337838-30335-3-git-send-email-ch.naveen@samsung.com>
References: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38377 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754477AbaGNLlF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:41:05 -0400
In-reply-to: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, ben-linux@fluff.org, cpgs@samsung.com

The cases should comes before default in a switch.

Even if we want the case and default to share same code.
Its good to define the case first followed by default.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: gregkh@linuxfoundation.org
---
 drivers/tty/serial/samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index e49a945..d98f93d 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1542,8 +1542,8 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 		case S3C2410_LCON_CS7:
 			*bits = 7;
 			break;
-		default:
 		case S3C2410_LCON_CS8:
+		default:
 			*bits = 8;
 			break;
 		}
-- 
1.7.9.5
