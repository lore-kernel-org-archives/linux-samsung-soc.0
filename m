From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback
 to the platform_data
Date: Mon, 12 May 2014 17:18:32 +0200
Message-ID: <5370E648.10006@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <1397212815-16068-19-git-send-email-daniel.lezcano@linaro.org> <201405091256.54755.arnd@arndb.de> <536CC3C6.6070804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:40364 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756540AbaELPSZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 11:18:25 -0400
Received: by mail-we0-f176.google.com with SMTP id q59so6858244wes.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 May 2014 08:18:24 -0700 (PDT)
In-Reply-To: <536CC3C6.6070804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>

On 05/09/2014 02:02 PM, Tomasz Figa wrote:
> Hi Arnd,
>
> On 09.05.2014 12:56, Arnd Bergmann wrote:
>> On Friday 11 April 2014, Daniel Lezcano wrote:
>>> No more dependency on the arch code. The platform_data field is use=
d to set the
>>> PM callback as the other cpuidle drivers.
>>>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>
>> This has just shown up in linux-next and broken randconfig builds.
>>
>>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/e=
xynos.c
>>> index fe8dac8..d22f0e4 100644
>>> --- a/arch/arm/mach-exynos/exynos.c
>>> +++ b/arch/arm/mach-exynos/exynos.c
>>> @@ -221,8 +221,9 @@ void exynos_restart(enum reboot_mode mode, cons=
t char *cmd)
>>>   }
>>>
>>>   static struct platform_device exynos_cpuidle =3D {
>>> -       .name           =3D "exynos_cpuidle",
>>> -       .id             =3D -1,
>>> +       .name              =3D "exynos_cpuidle",
>>> +       .dev.platform_data =3D exynos_enter_aftr,
>>> +       .id                =3D -1,
>>>   };
>>>
>>
>> This is wrong on many levels, can we please do this properly?
>>
>> * The exynos_enter_aftr function is compiled conditionally, so you c=
an't just
>>    reference it from generic code, or you get a link error.
>
> +1

That is true but still we have a link error without this patch. We=20
shouldn't register and declare this structure if CONFIG_PM /=20
CONFIG_CPU_IDLE are not set.

>> * 'static struct platform_device ...' has been deprecated for at lea=
st a decade,
>>    stop doing that. For any platform devices that get registered, th=
ere is
>>    platform_device_register_simple().
>
> +0.5
>
> The missing 0.5 is because you can't pass platform data using
> platform_device_register_simple(). There is
> platform_device_register_resndata(), though.
>
>> * There shouldn't need to be a platform_device to start with, this s=
hould all
>>    come from DT. We can't do this on arm64 anyway, so any code that =
may be
>>    shared between arm32 and arm64 should have proper abstractions.
>
> -1
>
> Exynos cpuidle is not a device on the SoC, so I don't think there is =
any
> way to represent it in DT. The only thing I could see this is matchin=
g
> root node with a central SoC driver that instantiates specific
> subdevices, such as cpufreq and cpuidle, but I don't see any availabl=
e
> infrastructure for this.

There is a RFC for defining generic idle states [1].

The idea behind using the platform driver framework is to unify the cod=
e=20
across the different drivers and separate the PM / cpuidle code.

By this way, we can move the different drivers to drivers/cpuidle and=20
store them in a single place. That make easier the tracking, the review=
=20
and the maintenance.

I am ok to by using platform_device_register_resndata() but I would=20
prefer to do that a bit later by converting the other drivers too. That=
=20
will be easier if we have them grouped in a single directory (this is=20
what does this patchset at the end).

As there are some more work based on this patchset and the link error=20
could be fixed as an independent patch, I would recommend to=20
re-integrate it in the tree as asked by Bartlomiej.

Thanks
   -- Daniel


[1] http://www.spinics.net/lists/arm-kernel/msg328747.html


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
