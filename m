From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/3] ARM: EXYNOS: Add support for GPIO on Exynos4x12
Date: Tue, 28 Aug 2012 20:28:30 +0530
Message-ID: <CAJuYYwTBeCczF7M=9pJzYUgGB3Xg1md2kRDKbYEU-ji-C1_hug@mail.gmail.com>
References: <4648723.rWnut7F0uJ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:57493 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751807Ab2H1O6c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 10:58:32 -0400
Received: by lagy9 with SMTP id y9so3346585lag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 07:58:30 -0700 (PDT)
In-Reply-To: <4648723.rWnut7F0uJ@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>

On 28 August 2012 15:31, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch series makes necessary preparations and adds support for GPIO on
> Exynos4x12 SoCs.
>
> Tomasz Figa (3):
>   ARM: EXYNOS: Use EXYNOS4210_GPEx instead of EXYNOS4_GPEx
>   gpio: samsung: Add support for Exynos4x12 SoCs
>   ARM: EXYNOS: Add support for FIMC cam port B GPIO setup on Exynos4x12
>
>  arch/arm/mach-exynos/include/mach/gpio.h   |   58 ++++--
>  arch/arm/mach-exynos/include/mach/irqs.h   |    6 -
>  arch/arm/mach-exynos/mach-nuri.c           |   16 +-
>  arch/arm/mach-exynos/mach-origen.c         |    6 +-
>  arch/arm/mach-exynos/mach-trats.c          |    4 +-
>  arch/arm/mach-exynos/mach-universal_c210.c |   32 ++--
>  arch/arm/mach-exynos/setup-fimc.c          |   21 ++-
>  drivers/gpio/gpio-samsung.c                |  351
> ++++++++++++++++++++++++----
>  8 files changed, 399 insertions(+), 95 deletions(-)
>
> --
> 1.7.8.6

Hopefully, we can get device tree support merged for Exynos4412 soon
and then switch over to using pinctrl driver. That can simplfy the
gpio/pinmux support for Exynos4 SoC's.

Thanks,
Thomas.
