From: Woody Wu <narkewoody@gmail.com>
Subject: Found a bug in samsung serial tty code
Date: Sun, 17 Apr 2016 15:52:44 +0800
Message-ID: <CAAsE_ud1FLGt=ufbYu9ppwKfbNVY4j4=Vb9=DMWGdmbpXrokaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:34915 "EHLO
	mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbcDQHwp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Apr 2016 03:52:45 -0400
Received: by mail-vk0-f67.google.com with SMTP id e185so19161117vkb.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Apr 2016 00:52:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

The function s3c24xx_serial_tx_empty() in tty/serial/samsung.c is wrong:

static unsigned int s3c24xx_serial_tx_empty(struct uart_port *port)
{
struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
unsigned long ufstat = rd_regl(port, S3C2410_UFSTAT);
unsigned long ufcon = rd_regl(port, S3C2410_UFCON);

if (ufcon & S3C2410_UFCON_FIFOMODE) {
if ((ufstat & info->tx_fifomask) != 0 ||
   (ufstat & info->tx_fifofull))
return 0;

return 1;
}

return s3c24xx_serial_txempty_nofifo(port);
}

In FIFO mode, checking only ufcon is not enough to determine that the
tx is really done, since there is still bits in shift register.  I
found this is true at least in S3C2416 UARTs.  I have to remove the
'return 1' above to fix the bug.   Can anyone give me a confirmation?
Thanks!


-- 
Life is the only flaw in an otherwise perfect nonexistence
    -- Schopenhauer

woody
public key at http://subkeys.pgp.net:11371 (narkewoody@gmail.com)
