From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Mon, 29 Jul 2013 10:33:28 +0200
Message-ID: <13615299.reg39gbbhi@flatron>
References: <0e7d01ce8840$82f79070$88e6b150$@org> <51F4F317.1040001@linaro.org> <CADGdYn761S+rDe=GaypFwAYdtQxFZRv0W=jmX9-KomogK5T7ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:49926 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877Ab3G2Idd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 04:33:33 -0400
Received: by mail-bk0-f51.google.com with SMTP id ji1so1865894bkc.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 01:33:32 -0700 (PDT)
In-Reply-To: <CADGdYn761S+rDe=GaypFwAYdtQxFZRv0W=jmX9-KomogK5T7ww@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: amit daniel kachhap <amit.daniel@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>

On Monday 29 of July 2013 10:16:14 amit daniel kachhap wrote:
> Hi Daniel/Tomasz,
>=20
> From the discussion I can conclude that SOC check is needed in the
> cpuidle driver for deeper C states.

A check is needed for the whole cpuidle driver, so it registers only on=
=20
Exynos SoCs which support deeper C states.

> Only the question is where to
> insert this.

Exynos doesn't support multiplatform yet, but we must make sure that an=
y=20
code being added is multiplatform-aware. So initcall is not a good idea=
=2E I=20
would put this somewhere on Exynos-specific initialization path, i.e.=20
something that would not called for all platforms compiled in (in case =
of=20
multiplatform).

As I discussed with Daniel, this should be using a traditional=20
platform_driver model, with the difference that it can't be registered=20
from device tree, but rather statically in mach code.

=46or example, you can add an exynos_register_cpuidle() function in=20
arch/arm/mach-exynos/common.c, which registers such platform device and=
=20
always call it from exynos4_dt_machine_init() in mach-exynos4-dt.c. In=20
mach-exynos5-dt.c you could make this conditional and check if=20
!soc_is_exynos5440().

Best regards,
Tomasz

> Also to perform the SOC there can be 2 ways like
> 1) each SOC check 4120, 4412, 5250 etc (long list)
> 2) negate the nonsupporting SOC's like 5440 (small list like current
> patch) Any opinion?
>  As Bartlomiej suggested that this patch conflicts with Daniel's
> earlier patch http://marc.info/?l=3Dlinux-arm-kernel&m=3D137467935712=
513&w=3D2
> So I can re-base my patch on top of this one if needed.
>=20
> Thanks,
> Amit Daniel
>=20
> On Sun, Jul 28, 2013 at 4:01 PM, Daniel Lezcano
>=20
> <daniel.lezcano@linaro.org> wrote:
> > On 07/28/2013 11:22 AM, Tomasz Figa wrote:
> >> On Sunday 28 of July 2013 09:10:09 Daniel Lezcano wrote:
> >>> On 07/24/2013 01:47 PM, Kukjin Kim wrote:
> >>>> Amit Daniel Kachhap wrote:
> >>>>> This patch skips the deep C1(AFTR -Arm off top running) state f=
or
> >>>>> exynos5440
> >>>>> soc as this soc does not support this state. All the cpu's only
> >>>>> allows the basic
> >>>>> C0 state.
> >>>>>=20
> >>>>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> >>>>> ---
> >>>>>=20
> >>>>>  arch/arm/mach-exynos/cpuidle.c |    2 +-
> >>>>>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>>>>=20
> >>>>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
> >>>>> exynos/cpuidle.c
> >>>>> index 17a18ff..9a776a1 100644
> >>>>> --- a/arch/arm/mach-exynos/cpuidle.c
> >>>>> +++ b/arch/arm/mach-exynos/cpuidle.c
> >>>>> @@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void=
)
> >>>>>=20
> >>>>>            device->cpu =3D cpu_id;
> >>>>>           =20
> >>>>>            /* Support IDLE only */
> >>>>>=20
> >>>>> -          if (cpu_id !=3D 0)
> >>>>> +          if (soc_is_exynos5440() || cpu_id !=3D 0)
> >>>>>=20
> >>>>>                    device->state_count =3D 1;
> >>>>>           =20
> >>>>>            ret =3D cpuidle_register_device(device);
> >>>>>=20
> >>>>> --
> >>>>> 1.7.1
> >>>>=20
> >>>> Applied, thanks.
> >>>=20
> >>> You shouldn't have. This patch means exynos5540 has no cpuidle
> >>> driver at all. It should be fixed in the Kconfig to unselect
> >>> CONFIG_CPU_IDLE for an exynos5540.
> >>=20
> >> To shed more light on this, let me add that you need to register a
> >> cpuidle driver only if you have more states than a simple WFI or y=
ou
> >> need some crazy steps to enter WFI. Default setup falls back to
> >> generic ARM WFI. (Daniel, do we get the nice idle stats as provide=
d
> >> by cpuidle core then?)>=20
> > Nope, but with one state, idle vs busy stats do the trick.
> >=20
> > BTW, I am writing a tool to do some stats based on the idle events
> > [1].
> > It is still at a very early development stage but we can get some
> > interesting informations.
> >=20
> >> Anyway, Exynos cpuidle is using an initcall to initialize and we
> >> support multiple Exynos SoCs in single zImage, so deselecting
> >> CONFIG_CPU_IDLE is not an option.
> >=20
> > Good point.
> >=20
> >> Considering multiplatform requirements, the driver has to
> >>=20
> >> be modified to initialize only on supported platforms, either by:
> >>  a) dropping the initcall and calling the init function directly f=
rom
> >>=20
> >> arch/arm/mach-exynos
> >>=20
> >>  or
> >> =20
> >>  b) checking if machine we are running on is supported, which woul=
d
> >>  mean a>>=20
> >> long list of all Exynos SoCs that needs to be checked.
> >>=20
> >> An evolution of option a) is registering a platform device somewhe=
re
> >> in
> >> arch/arm/mach-exynos and making exynos-cpuidle a platform driver.
> >=20
> > Yes, I am favorable to this solution [2].
> >=20
> >> The
> >> problem is that you must register a static platform device from ar=
ch
> >> code, because cpuidle is not a real hardware block that can be put
> >> into device tree.
> >=20
> > Thanks
> >=20
> >   -- Daniel
> >=20
> > [1]
> > https://git.linaro.org/gitweb?p=3Dpeople/dlezcano/idlestat.git;a=3D=
summar
> > y [2] http://patches.linaro.org/18368/
> >=20
> > --
> >=20
> >  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software=
 for ARM
> >  SoCs
> >=20
> > Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> > <http://twitter.com/#!/linaroorg> Twitter |
> > <http://www.linaro.org/linaro-blog/> Blog
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in the body of a message to
> > majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
