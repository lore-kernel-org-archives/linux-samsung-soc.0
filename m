From: Jaecheol Lee <jc.lee@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix on default of s3c24xx_uart_devs
Date: Tue,  5 Oct 2010 21:28:56 +0900
Message-ID: <1286281736-29821-1-git-send-email-jc.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47836 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850Ab0JEMjV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 08:39:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Jaecheol Lee <jc.lee@samsung.com>

This patch adds default dev->bus, platform_bus_type of s3c24xx_uart_devs.
If there is no default dev->bus, we cannot get the proper clock 'id' from
clk_get() in the console_initcall().
This problem occurs when only defined 'uclk1' as uart clock.

Reported-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
---
 arch/arm/plat-samsung/dev-uart.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/dev-uart.c b/arch/arm/plat-samsung/dev-uart.c
index 3776cd9..519e1bc 100644
--- a/arch/arm/plat-samsung/dev-uart.c
+++ b/arch/arm/plat-samsung/dev-uart.c
@@ -19,18 +19,22 @@
 
 static struct platform_device s3c24xx_uart_device0 = {
 	.id		= 0,
+	.dev		= { .bus = &platform_bus_type },
 };
 
 static struct platform_device s3c24xx_uart_device1 = {
 	.id		= 1,
+	.dev		= { .bus = &platform_bus_type },
 };
 
 static struct platform_device s3c24xx_uart_device2 = {
 	.id		= 2,
+	.dev		= { .bus = &platform_bus_type },
 };
 
 static struct platform_device s3c24xx_uart_device3 = {
 	.id		= 3,
+	.dev		= { .bus = &platform_bus_type },
 };
 
 struct platform_device *s3c24xx_uart_src[4] = {
-- 
1.6.2.5
