From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: S3C2412: SoC has the fractional baud rate register
Date: Fri, 29 Jan 2010 04:14:16 +0000
Message-ID: <1264738459-1972-4-git-send-email-ben-linux@fluff.org>
References: <1264738459-1972-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:37379 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756661Ab0A2EOU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 23:14:20 -0500
In-Reply-To: <1264738459-1972-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Michel Pollet <buserror@gmail.com>, Ben Dooks <ben-linux@fluff.org>

From: Michel Pollet <buserror@gmail.com>

The S3C2412 has a fractional baud rate register, this patch adds the
corresponding flag to the UART definition to allow generation of more
precise baud rates for the various clock combinations.

Signed-off-by: Michel Pollet <buserror@gmail.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/serial/s3c2412.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/serial/s3c2412.c b/drivers/serial/s3c2412.c
index ce75e28..1700b1a 100644
--- a/drivers/serial/s3c2412.c
+++ b/drivers/serial/s3c2412.c
@@ -102,6 +102,7 @@ static struct s3c24xx_uart_info s3c2412_uart_inf = {
 	.name		= "Samsung S3C2412 UART",
 	.type		= PORT_S3C2412,
 	.fifosize	= 64,
+	.has_divslot	= 1,
 	.rx_fifomask	= S3C2440_UFSTAT_RXMASK,
 	.rx_fifoshift	= S3C2440_UFSTAT_RXSHIFT,
 	.rx_fifofull	= S3C2440_UFSTAT_RXFULL,
-- 
1.6.0.4
