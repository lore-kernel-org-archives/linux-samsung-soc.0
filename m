From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback
 to the platform_data
Date: Wed, 21 May 2014 09:15:34 +0200
Message-ID: <537C5296.7050801@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <1397212815-16068-19-git-send-email-daniel.lezcano@linaro.org> <201405091256.54755.arnd@arndb.de> <536CC3C6.6070804@samsung.com> <5370E648.10006@linaro.org> <5374CA34.1030405@samsung.com> <5375262C.10805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:46354 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883AbaEUHPW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 03:15:22 -0400
Received: by mail-wi0-f176.google.com with SMTP id n15so7127975wiw.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 00:15:21 -0700 (PDT)
In-Reply-To: <5375262C.10805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, Mark Rutland <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linaro-kernel@lists.linaro.org

On 05/15/2014 10:40 PM, Kukjin Kim wrote:

[ ... ]

>>>> Exynos cpuidle is not a device on the SoC, so I don't think there =
is
>>>> any
>>>> way to represent it in DT. The only thing I could see this is matc=
hing
>>>> root node with a central SoC driver that instantiates specific
>>>> subdevices, such as cpufreq and cpuidle, but I don't see any avail=
able
>>>> infrastructure for this.
>>>
>>> There is a RFC for defining generic idle states [1].
>>>
>>> The idea behind using the platform driver framework is to unify the=
 code
>>> across the different drivers and separate the PM / cpuidle code.
>>>
>>> By this way, we can move the different drivers to drivers/cpuidle a=
nd
>>> store them in a single place. That make easier the tracking, the re=
view
>>> and the maintenance.
>>>
>>> I am ok to by using platform_device_register_resndata() but I would
>>> prefer to do that a bit later by converting the other drivers too. =
That
>>> will be easier if we have them grouped in a single directory (this =
is
>>> what does this patchset at the end).
>>>
>>> As there are some more work based on this patchset and the link err=
or
>>> could be fixed as an independent patch, I would recommend to
>>> re-integrate it in the tree as asked by Bartlomiej.
>>
>> In general, it would be nice to have everything done properly, but I=
'd
>> consider Daniel's series as a huge improvement already and a nice
>> intermediate step towards further clean-up.
>>
>> So based on the comments quoted above, instead of stalling the
>> development, I'd suggest to accept this series and then move forward=
=2E
>>
> I'm fine.
>
> Arnd, how about you?
>
> - Kukjin

Arnd ?


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
