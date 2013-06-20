From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 03/10] Samsung EXYNOS DT-2 for v3.11
Date: Thu, 20 Jun 2013 22:20:36 +0200
Message-ID: <201306202220.36975.arnd@arndb.de>
References: <51C0BC48.8030805@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:55565 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965473Ab3FTUUn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 16:20:43 -0400
In-Reply-To: <51C0BC48.8030805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> The following changes since commit a38089057fa450944f2e2d07885d76fd727c8d16:
> 
>    ARM: dts: add ohci and ehci controller nodes for EXYNOS5440 
> (2013-06-12 04:58:34 +0900)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/exynos-dt-2
> 
> for you to fetch changes up to 5f13269130d6798571ffbd9d84dbef0950984c5b:
> 
>    ARM: dts: Set BUCK7 as always on for Origen board (2013-06-19 
> 00:41:56 +0900)
> 
> ----------------------------------------------------------------
> 2nd exynos dt update based on tags/exynos-dt-1
> - enable RTC on exynos5250 snow and Arndale boards
> - add support LCD and PWM for exynos4210 Origen board
> - update bootargs to support 8GiB for exynos5440 SSDK5440 and SD5v1 boards
> - enable spi and add opp level for exynos5440
> - add example doc for samsung-pinctrl dt bindings

Pulled into next/dt, thanks!

	Arnd
