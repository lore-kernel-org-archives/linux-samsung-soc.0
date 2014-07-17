From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH 0/3] Adds PMU and S2R support for exynos5800
Date: Thu, 17 Jul 2014 15:47:14 +0545
Message-ID: <CAGm_ybirYq5iLS-hY8G6W-mMh2pW4ZoieuGn5iBT-X4fbBEboA@mail.gmail.com>
References: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:56413 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755218AbaGQK25 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 06:28:57 -0400
Received: by mail-wi0-f181.google.com with SMTP id bs8so2866203wib.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2014 03:28:55 -0700 (PDT)
In-Reply-To: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sajjan.linux@gmail.com, Doug Anderson <dianders@chromium.org>, Vikas Sajjan <vikas.sajjan@samsung.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Jul 9, 2014 at 5:10 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Rebased on
> 1] Kukjin Kim's tree, for-next branch
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
> 2] My 5420 PMU Series :
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33675.html
>
> Tested on Exynos5800 based chromebook (peach-pi board) with help of
>  1] http://www.spinics.net/lists/linux-samsung-soc/msg33750.html (modified to support 5800)
>  2] http://www.spinics.net/lists/linux-samsung-soc/msg32923.html
>
> Below are steps followed to test S2R:
>         1. make multi_v7_defconfig
>         2  enable MCPM for 5420
>         3. enable S3C RTC
>         4. pass "no_console_suspend" in bootargs
>         5. echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state
>
> Vikas Sajjan (3):
>   arm: dts: Add pmu node for exynos5800 SoC
>   arm: exynos: Add exynos5800-pmu compatible entry
>   arm: exynos: Add PMU and S2R support for exynos5800 SoC
>
>  .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
>  arch/arm/boot/dts/exynos5800.dtsi                  |    4 ++++
>  arch/arm/mach-exynos/exynos.c                      |    1 +
>  arch/arm/mach-exynos/pm.c                          |    3 +++
>  arch/arm/mach-exynos/pmu.c                         |   22 ++++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h                    |    3 ++-
>  6 files changed, 33 insertions(+), 1 deletion(-)


any comments on this series..


>
> --
> 1.7.9.5
>
