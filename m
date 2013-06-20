From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 01/10] Samsung cleanup-1 for v3.11
Date: Thu, 20 Jun 2013 17:30:37 +0200
Message-ID: <201306201730.38049.arnd@arndb.de>
References: <51C0BC37.7090604@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:61730 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756558Ab3FTPbH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 11:31:07 -0400
In-Reply-To: <51C0BC37.7090604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> 
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>    Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/samsung-cleanup-1
> 
> for you to fetch changes up to db3824e6bf0b0f421b0d43f08d905935e826a965:
> 
>    ARM: SAMSUNG: Remove unused plat/regs-watchdog.h header (2013-06-19 
> 03:13:18 +0900)
> 
> ----------------------------------------------------------------
> - Consolidate uncompress subroutines and s5p64x0-uncompress
> - Cleanup watchdog support on Samsung to support multiplatform
> 
> ----------------------------------------------------------------
> Tomasz Figa (7):
>        ARM: S5P64X0: Use common uncompress.h part for plat-samsung
>        watchdog: s3c2410_wdt: Use local register definitions
>        ARM: SAMSUNG: Use local definitions of watchdog registers
>        ARM: SAMSUNG: Add watchdog reset driver
>        ARM: SAMSUNG: Let platforms use the new watchdog reset driver
>        ARM: SAMSUNG: Remove legacy watchdog reset code
>        ARM: SAMSUNG: Remove unused plat/regs-watchdog.h header
> 
> Tushar Behera (1):
>        ARM: SAMSUNG: Consolidate uncompress subroutine

I've had to apply this patch on top to get s5p to build cleanly again.
It's part of next/cleanup now as well.

	Arnd

>From 854f1c88e6ab7c8a12a49913e8b1648f96af0701 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jun 2013 17:27:13 +0200
Subject: [PATCH] ARM: s5p64x0: avoid build warning for uncompress.h

Commit 5336539 "ARM: S5P64X0: Use common uncompress.h part
for plat-samsung" was missing a type cast, this brings
it in line with the other samsung platforms.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm/mach-s5p64x0/include/mach/uncompress.h b/arch/arm/mach-s5p64x0/include/mach/uncompress.h
index bc04bd5..bbcc3f6 100644
--- a/arch/arm/mach-s5p64x0/include/mach/uncompress.h
+++ b/arch/arm/mach-s5p64x0/include/mach/uncompress.h
@@ -23,9 +23,9 @@ static void arch_detect_cpu(void)
 	chipid = *(const volatile unsigned int __force *) 0xE0100118;
 
 	if ((chipid & 0xff000) == 0x50000)
-		uart_base = S5P6450_PA_UART(CONFIG_S3C_LOWLEVEL_UART_PORT);
+		uart_base = (volatile u8 *)S5P6450_PA_UART(CONFIG_S3C_LOWLEVEL_UART_PORT);
 	else
-		uart_base = S5P6440_PA_UART(CONFIG_S3C_LOWLEVEL_UART_PORT);
+		uart_base = (volatile u8 *)S5P6440_PA_UART(CONFIG_S3C_LOWLEVEL_UART_PORT);
 
 	fifo_mask = S3C2440_UFSTAT_TXMASK;
 	fifo_max = 63 << S3C2440_UFSTAT_TXSHIFT;
