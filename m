From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 00/12] ARM: S3C24XX: create mach-s3c24xx/ for S3C24XX SoCs - WIP
Date: Thu, 16 Feb 2012 07:55:34 +0900
Message-ID: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:60162 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472Ab2BOWzz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Feb 2012 17:55:55 -0500
Received: by daed14 with SMTP id d14so1335535dae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Feb 2012 14:55:55 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch aims to make a one mach- directory for S3C24XX SoCs
and now not finished yet such as moving cpufreq and merging
plat-s3c24xx/. I think it will be done maybe in a week.

[PATCH 01/12] ARM: S3C24XX: remove unused spi gpio setup functions
[PATCH 02/12] ARM: S3C24XX: move spi-s3c24xx platdata out of mach
[PATCH 03/12] ARM: S3C24XX: Remove extern declaration of clk_msysclk
[PATCH 04/12] ARM: S3C24XX: move common S3C2443 clock definitions to
[PATCH 05/12] ARM: S3C2410: move s3c2410_baseclk_add to clock.h
[PATCH 06/12] ARM: S3C24XX: change the ARCH_S3C2410 to ARCH_S3C24XX
[PATCH 07/12] ARM: S3C2410: move mach-s3c2410/* into mach-s3c24xx/
[PATCH 08/12] ARM: S3C2412: move mach-s3c2412/* into mach-s3c24xx/
[PATCH 09/12] ARM: S3C2416: move mach-s3c2416/* into mach-s3c24xx/
[PATCH 10/12] ARM: S3C2440: move mach-s3c2440/* into mach-s3c24xx/
[PATCH 11/12] ARM: S3C2443: move mach-s3c2443/* into mach-s3c24xx/
