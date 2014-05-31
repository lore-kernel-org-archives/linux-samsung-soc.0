From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/5] Samsung DT updates for 3.16
Date: Fri, 30 May 2014 21:39:58 -0700
Message-ID: <20140531043958.GB21917@quad.lixom.net>
References: <5388E31C.5070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:64057 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaEaEjq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 May 2014 00:39:46 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so2394721pbc.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 21:39:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5388E31C.5070903@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, May 31, 2014 at 04:59:24AM +0900, Kukjin Kim wrote:
> The following changes since commit 3c8977f17796f0b8816a1a283b0b80b71c83d416:
> 
>   ARM: dts: enable usb nodes for exynos4412-trats2 (2014-05-23
> 03:31:33 +0900)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-3
> 
> for you to fetch changes up to 345e9bf08276395bd6620dfab56d1b679136d2ce:
> 
>   ARM: dts: add secure firmware support for exynos5420-arndale-octa
> (2014-05-31 04:03:31 +0900)
> 
> ----------------------------------------------------------------
> Samsung 3rd DT updates for v3.16
> 
> - add dts files support for new SoCs
>   : exynos3250 SoC
>   : exynos5260 SoC and exynos5260-xyref5260 board
>   : exynos5410 SoC and exynos5410-smdk5410 board
>   : exynos5800 SoC and exynos5800-peach-pi board
> 
> - exynos4210-origen and exynos4412-origen
>   : enable RTC and WDT nodes
>   : use key code macros
> 
> - exynos5250-arndale
>   : use key code macros
> 
> - exynos5420-arndale-octa
>   : add secure firmware support
> 
> - exynos5440
>   : update watchdog node name

Much better! Thanks. Merged.


-Olof
