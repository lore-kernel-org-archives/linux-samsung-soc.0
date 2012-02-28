From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 00/12] ARM: S3C24XX: create mach-s3c24xx/ for S3C24XX SoCs - WIP
Date: Tue, 28 Feb 2012 22:39:16 +0100
Message-ID: <201202282239.17107.heiko@sntech.de>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:33453 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752846Ab2B1VjW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Feb 2012 16:39:22 -0500
In-Reply-To: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Am Mittwoch 15 Februar 2012, 23:55:34 schrieb Kukjin Kim:
> This patch aims to make a one mach- directory for S3C24XX SoCs
> and now not finished yet such as moving cpufreq and merging
> plat-s3c24xx/. I think it will be done maybe in a week.
> 
> [PATCH 01/12] ARM: S3C24XX: remove unused spi gpio setup functions
> [PATCH 02/12] ARM: S3C24XX: move spi-s3c24xx platdata out of mach
> [PATCH 03/12] ARM: S3C24XX: Remove extern declaration of clk_msysclk
> [PATCH 04/12] ARM: S3C24XX: move common S3C2443 clock definitions to
> [PATCH 05/12] ARM: S3C2410: move s3c2410_baseclk_add to clock.h
> [PATCH 06/12] ARM: S3C24XX: change the ARCH_S3C2410 to ARCH_S3C24XX
> [PATCH 07/12] ARM: S3C2410: move mach-s3c2410/* into mach-s3c24xx/
> [PATCH 08/12] ARM: S3C2412: move mach-s3c2412/* into mach-s3c24xx/
> [PATCH 09/12] ARM: S3C2416: move mach-s3c2416/* into mach-s3c24xx/
> [PATCH 10/12] ARM: S3C2440: move mach-s3c2440/* into mach-s3c24xx/
> [PATCH 11/12] ARM: S3C2443: move mach-s3c2443/* into mach-s3c24xx/
could we move this forward please? :-)

As indicated by Olof's mail for tegra, we are near the 3.4 merge window and as 
is known everything must be in linux-next beforehand.

In my opinion it should also be possible to postpone the plat-s3c24xx cleanup 
for now and just bring this set on the road to reach 3.4.

Heiko
