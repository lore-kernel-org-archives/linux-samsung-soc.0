From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V3 15/17] ARM: exynos: cpuidle: Disable cpuidle for 5440
Date: Tue, 08 Apr 2014 15:21:45 +0200
Message-ID: <5343F7E9.3010304@linaro.org>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>	<1396959579-18268-16-git-send-email-daniel.lezcano@linaro.org> <CAP245DUmBVeZqBYDc3mopvs_h5AkcTgjG2eO7z5VAQnUDJJogQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:61111 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756449AbaDHNV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 09:21:29 -0400
Received: by mail-we0-f175.google.com with SMTP id q58so945400wes.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 06:21:27 -0700 (PDT)
In-Reply-To: <CAP245DUmBVeZqBYDc3mopvs_h5AkcTgjG2eO7z5VAQnUDJJogQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Lists LAKML <linux-arm-kernel@lists.infradead.org>

On 04/08/2014 02:51 PM, Amit Kucheria wrote:
> On Tue, Apr 8, 2014 at 5:49 PM, Daniel Lezcano
> <daniel.lezcano@linaro.org <mailto:daniel.lezcano@linaro.org>> wrote:
>
>     There is no point to register the cpuidle driver for the 5440 as =
it
>     has only
>     one WFI state which is the default idle function when the cpuidle
>     driver is
>     disabled.
>
>     By disabling cpuidle we prevent to enter to the governor computat=
ion for
>     nothing, thus saving a lot of processing time.
>
>     The only drawback is the statistic via sysfs on this state which =
is
>     lost but
>     it is meaningless and it could be retrieved from the ftrace easil=
y.
>
>
> So for the future, you'll only merge platform drivers that enable
> something more than WFI?

Well, I already picked up a driver with only WFI because I knew the nex=
t=20
idle states were in preparation. But adding a cpuidle driver just for=20
WFI is no sense and if, for a reason I missed, it is really needed, I=20
guess a generic WFI cpuidle driver for all platforms would be make much=
=20
more sense.

>     Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org
>     <mailto:daniel.lezcano@linaro.org>>
>
>
> In that case, Acked-by: Amit Kucheria <amit.kucheria@linaro.org
> <mailto:amit.kucheria@linaro.org>>
>
>     ---
>       arch/arm/mach-exynos/cpuidle.c |    5 -----
>       arch/arm/mach-exynos/exynos.c  |    3 +++
>       2 files changed, 3 insertions(+), 5 deletions(-)
>
>     diff --git a/arch/arm/mach-exynos/cpuidle.c
>     b/arch/arm/mach-exynos/cpuidle.c
>     index 4b94181..a1f111e 100644
>     --- a/arch/arm/mach-exynos/cpuidle.c
>     +++ b/arch/arm/mach-exynos/cpuidle.c
>     @@ -16,8 +16,6 @@
>       #include <asm/suspend.h>
>       #include <asm/cpuidle.h>
>
>     -#include <plat/cpu.h>
>     -
>       #include "common.h"
>
>       static int idle_finisher(unsigned long flags)
>     @@ -77,9 +75,6 @@ static int exynos_cpuidle_probe(struct
>     platform_device *pdev)
>       {
>              int ret;
>
>     -       if (soc_is_exynos5440())
>     -               exynos_idle_driver.state_count =3D 1;
>     -
>              ret =3D cpuidle_register(&exynos_idle_driver, NULL);
>              if (ret) {
>                      dev_err(&pdev->dev, "failed to register cpuidle
>     driver\n");
>     diff --git a/arch/arm/mach-exynos/exynos.c
>     b/arch/arm/mach-exynos/exynos.c
>     index b567361..fe8dac8 100644
>     --- a/arch/arm/mach-exynos/exynos.c
>     +++ b/arch/arm/mach-exynos/exynos.c
>     @@ -227,6 +227,9 @@ static struct platform_device exynos_cpuidle =
=3D {
>
>       void __init exynos_cpuidle_init(void)
>       {
>     +       if (soc_is_exynos5440())
>     +               return;
>     +
>              platform_device_register(&exynos_cpuidle);
>       }
>
>     --
>     1.7.9.5
>
>
>     _______________________________________________
>     linaro-kernel mailing list
>     linaro-kernel@lists.linaro.org <mailto:linaro-kernel@lists.linaro=
=2Eorg>
>     http://lists.linaro.org/mailman/listinfo/linaro-kernel
>
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
