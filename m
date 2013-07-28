From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Sun, 28 Jul 2013 12:31:51 +0200
Message-ID: <51F4F317.1040001@linaro.org>
References: <0e7d01ce8840$82f79070$88e6b150$@org> <0eaf01ce8863$89d3c4e0$9d7b4ea0$@org> <51F4C3D1.2060901@linaro.org> <1877730.qZVs3NAG5h@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:32958 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753345Ab3G1Kbw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Jul 2013 06:31:52 -0400
Received: by mail-wg0-f51.google.com with SMTP id a12so276544wgh.18
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jul 2013 03:31:51 -0700 (PDT)
In-Reply-To: <1877730.qZVs3NAG5h@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

On 07/28/2013 11:22 AM, Tomasz Figa wrote:
> On Sunday 28 of July 2013 09:10:09 Daniel Lezcano wrote:
>> On 07/24/2013 01:47 PM, Kukjin Kim wrote:
>>> Amit Daniel Kachhap wrote:
>>>> This patch skips the deep C1(AFTR -Arm off top running) state for
>>>> exynos5440
>>>> soc as this soc does not support this state. All the cpu's only
>>>> allows the basic
>>>> C0 state.
>>>>
>>>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>>>> ---
>>>>
>>>>  arch/arm/mach-exynos/cpuidle.c |    2 +-
>>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
>>>> exynos/cpuidle.c
>>>> index 17a18ff..9a776a1 100644
>>>> --- a/arch/arm/mach-exynos/cpuidle.c
>>>> +++ b/arch/arm/mach-exynos/cpuidle.c
>>>> @@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void)
>>>>
>>>>  		device->cpu =3D cpu_id;
>>>>  	=09
>>>>  		/* Support IDLE only */
>>>>
>>>> -		if (cpu_id !=3D 0)
>>>> +		if (soc_is_exynos5440() || cpu_id !=3D 0)
>>>>
>>>>  			device->state_count =3D 1;
>>>>  	=09
>>>>  		ret =3D cpuidle_register_device(device);
>>>>
>>>> --
>>>> 1.7.1
>>>
>>> Applied, thanks.
>>
>> You shouldn't have. This patch means exynos5540 has no cpuidle drive=
r at
>> all. It should be fixed in the Kconfig to unselect CONFIG_CPU_IDLE f=
or
>> an exynos5540.
>=20
> To shed more light on this, let me add that you need to register a cp=
uidle=20
> driver only if you have more states than a simple WFI or you need som=
e=20
> crazy steps to enter WFI. Default setup falls back to generic ARM WFI=
=2E=20
> (Daniel, do we get the nice idle stats as provided by cpuidle core th=
en?)

Nope, but with one state, idle vs busy stats do the trick.

BTW, I am writing a tool to do some stats based on the idle events [1].
It is still at a very early development stage but we can get some
interesting informations.


> Anyway, Exynos cpuidle is using an initcall to initialize and we supp=
ort=20
> multiple Exynos SoCs in single zImage, so deselecting CONFIG_CPU_IDLE=
 is=20
> not an option.=20

Good point.

> Considering multiplatform requirements, the driver has to=20
> be modified to initialize only on supported platforms, either by:
>=20
>  a) dropping the initcall and calling the init function directly from=
=20
> arch/arm/mach-exynos
>=20
>  or
>=20
>  b) checking if machine we are running on is supported, which would m=
ean a=20
> long list of all Exynos SoCs that needs to be checked.
>=20
> An evolution of option a) is registering a platform device somewhere =
in=20
> arch/arm/mach-exynos and making exynos-cpuidle a platform driver.

Yes, I am favorable to this solution [2].

> The=20
> problem is that you must register a static platform device from arch =
code,=20
> because cpuidle is not a real hardware block that can be put into dev=
ice=20
> tree.

Thanks
  -- Daniel

[1] https://git.linaro.org/gitweb?p=3Dpeople/dlezcano/idlestat.git;a=3D=
summary
[2] http://patches.linaro.org/18368/

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
