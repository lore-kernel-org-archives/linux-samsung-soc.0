From: =?ks_c_5601-1987?B?seiw5sDP?= <ki0351.kim@samsung.com>
Subject: [PATCH] serial: samsung: Add support 4M baudrate for samsung serial
Date: Fri, 03 Feb 2012 17:06:09 +0900
Message-ID: <001b01cce24a$b01cb370$10561a50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39563 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407Ab2BCIGL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Feb 2012 03:06:11 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYT001J4560QRG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Feb 2012 17:06:10 +0900 (KST)
Received: from DOKI0351KIM04 ([12.23.119.96])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYT00LMA5696OE0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 03 Feb 2012 17:06:09 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, =?ks_c_5601-1987?B?J7HosObAzyc=?= <ki0351.kim@samsung.com>

At getting the baudrate, the max baudrate parameter value
is changed to 4M.
So samsung serial can support upto 4M baudrate.

Signed-off-by: Kyoungil Kim <ki0351.kim@samsung.com>
---
 drivers/tty/serial/samsung.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index a6abe0c..513096d 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -701,7 +701,7 @@ static void s3c24xx_serial_set_termios(struct uart_port *port,
 	 * Ask the core to calculate the divisor for us.
 	 */
 
-	baud = uart_get_baud_rate(port, termios, old, 0, 115200*8);
+	baud = uart_get_baud_rate(port, termios, old, 0, 4000000);
 	quot = s3c24xx_serial_getclk(ourport, baud, &clk, &clk_sel);
 	if (baud == 38400 && (port->flags & UPF_SPD_MASK) == UPF_SPD_CUST)
 		quot = port->custom_divisor;
-- 
1.7.1
