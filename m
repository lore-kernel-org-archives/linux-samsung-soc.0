From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback
 to the platform_data
Date: Wed, 21 May 2014 11:02:29 +0200
Message-ID: <537C6BA5.5080909@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <5375262C.10805@samsung.com> <537C5296.7050801@linaro.org> <11675203.TylGKV1VBZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:58702 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984AbaEUJCS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 05:02:18 -0400
Received: by mail-wg0-f49.google.com with SMTP id m15so1709462wgh.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 02:02:16 -0700 (PDT)
In-Reply-To: <11675203.TylGKV1VBZ@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linaro-kernel@lists.linaro.org
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, rjw@rjwysocki.net, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On 05/21/2014 10:10 AM, Arnd Bergmann wrote:
> On Wednesday 21 May 2014 09:15:34 Daniel Lezcano wrote:
>> On 05/15/2014 10:40 PM, Kukjin Kim wrote:
>>
>> [ ... ]
>>
>>>>>> Exynos cpuidle is not a device on the SoC, so I don't think ther=
e is
>>>>>> any
>>>>>> way to represent it in DT. The only thing I could see this is ma=
tching
>>>>>> root node with a central SoC driver that instantiates specific
>>>>>> subdevices, such as cpufreq and cpuidle, but I don't see any ava=
ilable
>>>>>> infrastructure for this.
>>>>>
>>>>> There is a RFC for defining generic idle states [1].
>>>>>
>>>>> The idea behind using the platform driver framework is to unify t=
he code
>>>>> across the different drivers and separate the PM / cpuidle code.
>>>>>
>>>>> By this way, we can move the different drivers to drivers/cpuidle=
 and
>>>>> store them in a single place. That make easier the tracking, the =
review
>>>>> and the maintenance.
>
> Yes, that would be great. I only looked briefly at the series now, do=
esn't
> that require the use of psci?

No, because PSCI is for some specific platform (eg. calxeda), all the=20
other drivers are legacy and manually handling the PM via some low leve=
l=20
callbacks. This is why all drivers were implemented all over the place=20
making so difficult to maintain them. Little by little, we split the PM=
=20
callbacks from the idle algorithm so reducing the platform dependency=20
with the generic code.

The PSCI implements such PM callbacks in the firmware directly and are=20
accessed through an API. PSCI is, let's say some kindof nextgen cpuidle=
=2E=20
It is similar than mwait on Intel. But if a new platform does not have=20
such firmware, then the cpuidle driver will have the legacy format.

> That's not a bad idea of course, but it
> doesn't solve the problem I raised here.
>
>>>>> I am ok to by using platform_device_register_resndata() but I wou=
ld
>>>>> prefer to do that a bit later by converting the other drivers too=
=2E That
>>>>> will be easier if we have them grouped in a single directory (thi=
s is
>>>>> what does this patchset at the end).
>>>>>
>>>>> As there are some more work based on this patchset and the link e=
rror
>>>>> could be fixed as an independent patch, I would recommend to
>>>>> re-integrate it in the tree as asked by Bartlomiej.
>>>>
>>>> In general, it would be nice to have everything done properly, but=
 I'd
>>>> consider Daniel's series as a huge improvement already and a nice
>>>> intermediate step towards further clean-up.
>>>>
>>>> So based on the comments quoted above, instead of stalling the
>>>> development, I'd suggest to accept this series and then move forwa=
rd.
>>>>
>>> I'm fine.
>>>
>>> Arnd, how about you?
>>>
>>> - Kukjin
>>
>> Arnd ?
>
> Sorry for the delay.

No problem.

> Yes, let's do it this way once more, but please
> come up with something better for the future that doesn't tie the
> cpuidle method to the root compatible string as this does.

ok.

Thanks

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
