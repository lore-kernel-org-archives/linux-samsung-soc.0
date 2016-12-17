From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/8] soc: samsung: add exynos chipid driver support
Date: Sat, 17 Dec 2016 14:03:43 +0200
Message-ID: <20161217120343.GA16051@kozik-lap>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com>
 <20161216173703.GA3746@kozik-lap>
 <CAGcde9FBGcNpYbei0PsyHjt3_HVmm=x8oYkS-F7t0Rca6fpDAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35409 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752314AbcLQMDy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 17 Dec 2016 07:03:54 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so10068663wme.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Dec 2016 04:03:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAGcde9FBGcNpYbei0PsyHjt3_HVmm=x8oYkS-F7t0Rca6fpDAQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, geert+renesas@glider.be, Linus Walleij <linus.walleij@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Sat, Dec 17, 2016 at 09:36:59AM +0530, Pankaj Dubey wrote:
> Hi Krzysztof,
> 
> On 16 December 2016 at 23:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Sat, Dec 10, 2016 at 06:38:36PM +0530, Pankaj Dubey wrote:
> >> Exynos SoCs have Chipid, for identification of product IDs and SoC revisions.
> >> This patch intends to provide initialization code for all these functionalities,
> >> at the same time it provides some sysfs entries for accessing these information
> >> to user-space.
> >>
> >> This driver uses existing binding for exynos-chipid.
> >>
> >> CC: Grant Likely <grant.likely@linaro.org>
> >> CC: Rob Herring <robh+dt@kernel.org>
> >> CC: Linus Walleij <linus.walleij@linaro.org>
> >> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> >> [m.szyprowski: for suggestion and code snippet of product_id_to_soc_id]
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>  drivers/soc/samsung/Kconfig         |   5 ++
> >>  drivers/soc/samsung/Makefile        |   1 +
> >>  drivers/soc/samsung/exynos-chipid.c | 116 ++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 122 insertions(+)
> >>  create mode 100644 drivers/soc/samsung/exynos-chipid.c
> >>
> >> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> >> index 2455339..f9ab858 100644
> >> --- a/drivers/soc/samsung/Kconfig
> >> +++ b/drivers/soc/samsung/Kconfig
> >> @@ -14,4 +14,9 @@ config EXYNOS_PM_DOMAINS
> >>       bool "Exynos PM domains" if COMPILE_TEST
> >>       depends on PM_GENERIC_DOMAINS || COMPILE_TEST
> >>
> >> +config EXYNOS_CHIPID
> >> +     bool "Exynos Chipid controller driver" if COMPILE_TEST
> >> +     depends on (ARM && ARCH_EXYNOS) || ((ARM || ARM64) && COMPILE_TEST)
> >
> > 1. Why this can be compile tested only on ARM architectures?
> 
> Well I just used dependency same as EXYNOS_PMU, but I can see it will
> be enabled for compile test on ARM64 isn't it?

I don't remember the PMU case... maybe it used clocks or something. Here
there are no arch-specific build dependencies.

> 
> > 2. Don't you need also SOC_BUS?
> 
> CHIPID needs SoC_BUS and for the same reason it is selecting SOC_BUS
> in the next line.
> If we mark it as a dependency (under depends on), even then we need to
> select this either
> under same EXYNOS_CHIPID config or ARCH_EXYNOS config.

Ah, I missed that line... Argh, sorry for noise.

Best regards,
Krzysztof
