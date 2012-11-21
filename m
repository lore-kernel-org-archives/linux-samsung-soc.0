From: Domenico Andreoli <cavokz@gmail.com>
Subject: [RESEND PATCH] S3C24XX: Fix console baud rate guessing
Date: Wed, 21 Nov 2012 01:43:09 +0100
Message-ID: <50ac2947.4969b40a.4ccc.ffff94b6@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:51472 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818Ab2KUBHV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 20:07:21 -0500
Received: by mail-wi0-f178.google.com with SMTP id hm6so1415722wib.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 17:07:20 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, woody <narkewoody@gmail.com>, linux-arm-kernel@lists.infradead.org

From: Domenico Andreoli <domenico.andreoli@linux.com>

Between v3.2 and v3.3 my S3C2440 board started to print garbage on the
console during boot. I nailed the problem down to the default UCON clock
selection, which with this commit has been switched from UCLK to PCLK.

commit c3310fbbeb9db6967900ed22eb3d0bd0bb0e892c
Author: Thomas Abraham <thomas.abraham@linaro.org>
Date:   Mon Oct 24 11:47:57 2011 +0200

    serial: samsung: remove all uses of get_clksrc and set_clksrc
    
    With clkdev based clock lookup support, the clock set and get operation
    using clock names communicated between the samsung uart driver and the
    SoC specific extension can be removed.
    
    In addition to that, for each platform specific extension, add the
    default clock selection, number of clock options for uart baud generator,
    clock selection bit mask and shift values which is required by the
    clkdev support in samsung uart driver.
    
    The default clock selection value 'def_clk_sel' specifies the default clock
    to be used as the source clock for baud rate generator in case the platform
    code does not specify the same.
    
    Cc: Ben Dooks <ben-linux@fluff.org>
    Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
    Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>


To restore previous functionality, usable console with no UCON nor baud
rate specified, I had to change the default UCON clock back to UCLK.

Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
---
 samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 7f04717..316b703 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1572,7 +1572,7 @@ static struct s3c24xx_serial_drv_data s3c2440_serial_drv_data = {
 		.tx_fifofull	= S3C2440_UFSTAT_TXFULL,
 		.tx_fifomask	= S3C2440_UFSTAT_TXMASK,
 		.tx_fifoshift	= S3C2440_UFSTAT_TXSHIFT,
-		.def_clk_sel	= S3C2410_UCON_CLKSEL2,
+		.def_clk_sel	= S3C2410_UCON_CLKSEL1,
 		.num_clks	= 4,
 		.clksel_mask	= S3C2412_UCON_CLKMASK,
 		.clksel_shift	= S3C2412_UCON_CLKSHIFT,
