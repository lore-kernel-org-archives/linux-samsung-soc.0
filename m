From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 02/10] Samsung EXYNOS arch for v3.11
Date: Thu, 20 Jun 2013 21:51:34 +0200
Message-ID: <201306202151.34934.arnd@arndb.de>
References: <51C0BC3F.2060002@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:56418 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161110Ab3FTTwJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 15:52:09 -0400
In-Reply-To: <51C0BC3F.2060002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>    Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/exynos-arch-2
> 
> for you to fetch changes up to b5f3c75a75d31039c6de3ab38d074b43c60462f7:
> 
>    ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor 
> (2013-06-19 03:41:38 +0900)
> 
> ----------------------------------------------------------------
> arch/arm/mach-exynos update
> - enable XHCI on exynos5
> - enable Pinctrl on exynos4 and exynos5
> - calling scu_enable() is only available on Cortex-A9

Pulled into next/soc, thanks!

	ARnd
