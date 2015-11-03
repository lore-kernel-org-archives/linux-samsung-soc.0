From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 20/22] clocksource/drivers/exynos_mct: Fix Kconfig and add
 COMPILE_TEST option
Date: Tue, 3 Nov 2015 12:08:53 +0100
Message-ID: <563895C5.9000502@linaro.org>
References: <1446469011-22710-1-git-send-email-daniel.lezcano@linaro.org>
 <563806E7.6010105@samsung.com> <563872E2.10001@linaro.org>
 <9713489.TbNNoNQg5A@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35431 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736AbbKCLI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2015 06:08:57 -0500
Received: by wmll128 with SMTP id l128so83806336wml.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Nov 2015 03:08:56 -0800 (PST)
In-Reply-To: <9713489.TbNNoNQg5A@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, tglx@linutronix.de, john.stultz@linaro.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, "moderated list:ARM SUB-ARCHITECT..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>

On 11/03/2015 11:02 AM, Arnd Bergmann wrote:
> On Tuesday 03 November 2015 09:40:02 Daniel Lezcano wrote:
>> On 11/03/2015 01:59 AM, Krzysztof Kozlowski wrote:
>>> On 03.11.2015 09:30, Krzysztof Kozlowski wrote:
>>>> On 02.11.2015 21:56, Daniel Lezcano wrote:
>>>>> Let the platform's Kconfig to select the clock instead of having =
a reverse
>>>>> dependency from the driver to the platform options.
>>>>
>>>> Selecting user-visible symbols is rather discouraged so why not
>>>> something like this:
>>>>
>>>> -       def_bool y if ARCH_EXYNOS
>>>> -       depends on !ARM64
>>>> +       bool "Exynos multi core timer driver"
>>>> +       depends on ARCH_EXYNOS || (COMPILE_TEST && ARM)
>>>
>>> Nope, that was wrong as we loose auto-select on Exynos. Instead:
>>> -       def_bool y if ARCH_EXYNOS
>>> -       depends on !ARM64
>>> +       bool "Exynos multi core timer driver" if ARM
>>> +       depends on ARCH_EXYNOS || COMPILE_TEST
>>> +       default y if ARCH_EXYNOS
>>>
>>> This way we avoid select (which is a reverse dependency for the dri=
ver),
>>> have it auto-selectable and compile tested on arm.
>>
>> I think you misunderstood the patch I sent.
>>
>> It does two things:
>>
>> 1. Follow the thumb of rule of the current Kconfig format
>>
>>      - The timer driver is selected by the platform (exynos in this =
case)
>>      - User can't select the driver in the menuconfig
>>      - There is no dependency on the platform except for compilation=
 test
>>
>> 2. Add the COMPILE_TEST
>>
>>      - User can select the driver for compilation testing. This is f=
or
>> allyesconfig when doing compilation test coverage (exynos timer coul=
d be
>> compiled on other platform). As the delay code is not portable, we h=
ave
>> to restrict the compilation on the ARM platform, this is why there i=
s
>> the dependency on ARM.
>>
>> I am currently looking at splitting the delay code in order to preve=
nt
>> this restriction on this driver and some others drivers.
>
> I suspect this will come up again in the future. The problem is
> really that drivers/clocksource has different rules from almost
> everything else, by requiring the platform to 'select' the driver.
>
> The second version that Krzysztof posted is how we handle this in
> other driver subsystems, and I would generally prefer it to do this
> consistently for everything, but John Stultz has in the past argued
> strongly for using 'select' in all clocksource drivers. The reason
> is that for each platform we know in advance which driver we want,
> and there is never a need for the user to have to select the right
> one.

Yes, and I second John in this.



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
