From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Use EXYNOS4210_GPEx instead of EXYNOS4_GPEx
Date: Tue, 28 Aug 2012 20:18:50 +0530
Message-ID: <CAJuYYwQWzUaAhBqzf--kVN39GnhsYJMzH6ew6yDf-JCFaA--cQ@mail.gmail.com>
References: <4648723.rWnut7F0uJ@amdc1227>
	<14029212.D3MKvQZpbq@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:46262 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752188Ab2H1Osw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 10:48:52 -0400
Received: by lbbgj3 with SMTP id gj3so3307736lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 07:48:50 -0700 (PDT)
In-Reply-To: <14029212.D3MKvQZpbq@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 28 August 2012 15:36, Tomasz Figa <t.figa@samsung.com> wrote:
> The GPEx gpios are specific to Exynos4210 and do not exist on Exynos4x12.
> Redefine them to use the exact SoC name.
>
> Based on "ARM: EXYYNOS: Use EXYNOS4210_GPEx instead of EXYNOS4_GPEx" by
> Joonyoung Shim, see:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-May/100738.html
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/gpio.h   | 32 +++++++++++++++---------------
>  arch/arm/mach-exynos/mach-nuri.c           | 16 +++++++--------
>  arch/arm/mach-exynos/mach-origen.c         |  6 +++---
>  arch/arm/mach-exynos/mach-trats.c          |  4 ++--
>  arch/arm/mach-exynos/mach-universal_c210.c | 32 +++++++++++++++---------------
>  arch/arm/mach-exynos/setup-fimc.c          |  4 ++--
>  drivers/gpio/gpio-samsung.c                | 20 +++++++++----------
>  7 files changed, 57 insertions(+), 57 deletions(-)

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

[...]
