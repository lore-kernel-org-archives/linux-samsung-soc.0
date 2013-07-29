From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Mon, 29 Jul 2013 10:16:14 +0530
Message-ID: <CADGdYn761S+rDe=GaypFwAYdtQxFZRv0W=jmX9-KomogK5T7ww@mail.gmail.com>
References: <0e7d01ce8840$82f79070$88e6b150$@org>
	<0eaf01ce8863$89d3c4e0$9d7b4ea0$@org>
	<51F4C3D1.2060901@linaro.org>
	<1877730.qZVs3NAG5h@flatron>
	<51F4F317.1040001@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:37852 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754299Ab3G2EqP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 00:46:15 -0400
Received: by mail-oa0-f47.google.com with SMTP id m6so5090859oag.20
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jul 2013 21:46:14 -0700 (PDT)
In-Reply-To: <51F4F317.1040001@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>

Hi Daniel/Tomasz,

=46rom the discussion I can conclude that SOC check is needed in the
cpuidle driver for deeper C states. Only the question is where to
insert this.
Also to perform the SOC there can be 2 ways like
1) each SOC check 4120, 4412, 5250 etc (long list)
2) negate the nonsupporting SOC's like 5440 (small list like current pa=
tch)
Any opinion?
 As Bartlomiej suggested that this patch conflicts with Daniel's
earlier patch http://marc.info/?l=3Dlinux-arm-kernel&m=3D13746793571251=
3&w=3D2
So I can re-base my patch on top of this one if needed.

Thanks,
Amit Daniel

On Sun, Jul 28, 2013 at 4:01 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 07/28/2013 11:22 AM, Tomasz Figa wrote:
>> On Sunday 28 of July 2013 09:10:09 Daniel Lezcano wrote:
>>> On 07/24/2013 01:47 PM, Kukjin Kim wrote:
>>>> Amit Daniel Kachhap wrote:
>>>>> This patch skips the deep C1(AFTR -Arm off top running) state for
>>>>> exynos5440
>>>>> soc as this soc does not support this state. All the cpu's only
>>>>> allows the basic
>>>>> C0 state.
>>>>>
>>>>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>>>>> ---
>>>>>
>>>>>  arch/arm/mach-exynos/cpuidle.c |    2 +-
>>>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
>>>>> exynos/cpuidle.c
>>>>> index 17a18ff..9a776a1 100644
>>>>> --- a/arch/arm/mach-exynos/cpuidle.c
>>>>> +++ b/arch/arm/mach-exynos/cpuidle.c
>>>>> @@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void)
>>>>>
>>>>>            device->cpu =3D cpu_id;
>>>>>
>>>>>            /* Support IDLE only */
>>>>>
>>>>> -          if (cpu_id !=3D 0)
>>>>> +          if (soc_is_exynos5440() || cpu_id !=3D 0)
>>>>>
>>>>>                    device->state_count =3D 1;
>>>>>
>>>>>            ret =3D cpuidle_register_device(device);
>>>>>
>>>>> --
>>>>> 1.7.1
>>>>
>>>> Applied, thanks.
>>>
>>> You shouldn't have. This patch means exynos5540 has no cpuidle driv=
er at
>>> all. It should be fixed in the Kconfig to unselect CONFIG_CPU_IDLE =
for
>>> an exynos5540.
>>
>> To shed more light on this, let me add that you need to register a c=
puidle
>> driver only if you have more states than a simple WFI or you need so=
me
>> crazy steps to enter WFI. Default setup falls back to generic ARM WF=
I.
>> (Daniel, do we get the nice idle stats as provided by cpuidle core t=
hen?)
>
> Nope, but with one state, idle vs busy stats do the trick.
>
> BTW, I am writing a tool to do some stats based on the idle events [1=
].
> It is still at a very early development stage but we can get some
> interesting informations.
>
>
>> Anyway, Exynos cpuidle is using an initcall to initialize and we sup=
port
>> multiple Exynos SoCs in single zImage, so deselecting CONFIG_CPU_IDL=
E is
>> not an option.
>
> Good point.
>
>> Considering multiplatform requirements, the driver has to
>> be modified to initialize only on supported platforms, either by:
>>
>>  a) dropping the initcall and calling the init function directly fro=
m
>> arch/arm/mach-exynos
>>
>>  or
>>
>>  b) checking if machine we are running on is supported, which would =
mean a
>> long list of all Exynos SoCs that needs to be checked.
>>
>> An evolution of option a) is registering a platform device somewhere=
 in
>> arch/arm/mach-exynos and making exynos-cpuidle a platform driver.
>
> Yes, I am favorable to this solution [2].
>
>> The
>> problem is that you must register a static platform device from arch=
 code,
>> because cpuidle is not a real hardware block that can be put into de=
vice
>> tree.
>
> Thanks
>   -- Daniel
>
> [1] https://git.linaro.org/gitweb?p=3Dpeople/dlezcano/idlestat.git;a=3D=
summary
> [2] http://patches.linaro.org/18368/
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software f=
or ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
