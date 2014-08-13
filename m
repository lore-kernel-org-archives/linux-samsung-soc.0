From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Fix build with PM_SLEEP=n and
 ARM_EXYNOS_CPUIDLE=n
Date: Wed, 13 Aug 2014 08:40:47 +0200
Message-ID: <2126575.mQYDXuNU1Q@amdc1032>
References: <1407856317-2457-1-git-send-email-b.zolnierkie@samsung.com>
 <1407856317-2457-2-git-send-email-b.zolnierkie@samsung.com>
 <53EA7DC8.6040801@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50220 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705AbaHMGkx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Aug 2014 02:40:53 -0400
In-reply-to: <53EA7DC8.6040801@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


Hi,

On Tuesday, August 12, 2014 10:49:12 PM Daniel Lezcano wrote:
> On 08/12/2014 05:11 PM, Bartlomiej Zolnierkiewicz wrote:
> > Fix building of exynos_defconfig with disabled CONFIG_PM_SLEEP by
> > adding checking whether Exynos cpuidle support is enabled before
> > accessing exynos_enter_aftr.
> >
> > The build error message:
> > arch/arm/mach-exynos/built-in.o:(.data+0x74): undefined reference to `exynos_enter_aftr'
> > make: *** [vmlinux] Error 1
>  >
> > This patch has been tested on Exynos4210 based Origen board.
> >
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >   arch/arm/mach-exynos/exynos.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> > index 6a24e11..d57f136 100644
> > --- a/arch/arm/mach-exynos/exynos.c
> > +++ b/arch/arm/mach-exynos/exynos.c
> > @@ -161,7 +161,9 @@ static void exynos_restart(enum reboot_mode mode, const char *cmd)
> >
> >   static struct platform_device exynos_cpuidle = {
> >   	.name              = "exynos_cpuidle",
> > +#ifdef CONFIG_ARM_EXYNOS_CPUIDLE
> >   	.dev.platform_data = exynos_enter_aftr,
> > +#endif
> >   	.id                = -1,
> >   };
> 
> This patch does not address the real issue of the compilation error. The 
> cpuidle driver needs the exynos_enter_aftr function in order to work 
> correctly. Hence the Makefile should be fixed in order to compile pm.o 
> if cpuidle or pm_sleep are set.

Please take a look at patch #3.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
