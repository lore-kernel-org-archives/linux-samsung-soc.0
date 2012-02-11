From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] serial: samsung: disable irq before calling free_irq
Date: Sat, 11 Feb 2012 12:12:33 +0900
Message-ID: <018301cce86a$ff609980$fe21cc80$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13039 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753467Ab2BKDMf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 22:12:35 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ7006OFKWX8U80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 12:12:33 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ700BDQKWXKL00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 12:12:33 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: gregkh@suse.de, kgene.kim@samsung.com

From: Kisang Lee <kisang80.lee@samsung.com>

Pending UART irq may trigger spurious handling and may lead to
softlockup. This patch will fix following softlockup.

Signed-off-by: Kisang Lee <kisang80.lee@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 drivers/tty/serial/samsung.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index c55e5fb..9067299 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -425,15 +425,19 @@ static void s3c24xx_serial_shutdown(struct uart_port *port)
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
 
 	if (ourport->tx_claimed) {
-		if (!s3c24xx_serial_has_interrupt_mask(port))
+		if (!s3c24xx_serial_has_interrupt_mask(port)) {
+			disable_irq(ourport->tx_irq);
 			free_irq(ourport->tx_irq, ourport);
+		}
 		tx_enabled(port) = 0;
 		ourport->tx_claimed = 0;
 	}
 
 	if (ourport->rx_claimed) {
-		if (!s3c24xx_serial_has_interrupt_mask(port))
+		if (!s3c24xx_serial_has_interrupt_mask(port)) {
+			disable_irq(ourport->rx_irq);
 			free_irq(ourport->rx_irq, ourport);
+		}
 		ourport->rx_claimed = 0;
 		rx_enabled(port) = 0;
 	}
-- 
1.7.1
