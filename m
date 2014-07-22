From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [GIT PULL 4/5] Samsung exynos_mct update for v3.17
Date: Tue, 22 Jul 2014 19:32:16 +0200
Message-ID: <53CEA020.309@linaro.org>
References: <53C9C164.9030404@samsung.com> <20140719220623.GF15676@quad.lixom.net> <53CCD3AB.7040205@linaro.org> <01b601cfa59c$12c2c7f0$384857d0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:46634 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752620AbaGVRcT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 13:32:19 -0400
Received: by mail-wi0-f169.google.com with SMTP id n3so6299903wiv.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jul 2014 10:32:18 -0700 (PDT)
In-Reply-To: <01b601cfa59c$12c2c7f0$384857d0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Doug Anderson' <dianders@chromium.org>, tglx@linutronix.de

On 07/22/2014 12:59 PM, Kukjin Kim wrote:
> Daniel Lezcano wrote:
>>
>> On 07/20/2014 12:06 AM, Olof Johansson wrote:
>>> On Sat, Jul 19, 2014 at 09:52:52AM +0900, Kukjin Kim wrote:
>>>> Note that this is also based on 3.16-rc5 because of dependency wit=
h
>>>> previous samsung fixes including exynos_mct already merged in
>>>> mainline during -rc.
>>>>
>>>> The following changes since commit 1795cd9b3a91d4b5473c97f491d6389=
2442212ab:
>>>>
>>>>     Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
>>>>
>>>> are available in the git repository at:
>>>>
>>>
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.=
git
>>>> tags/exynos-mct
>>>>
>>>> for you to fetch changes up to 1a631118c1d085fe162f3b6d44f710c7220=
6ef2d:
>>>>
>>>>     clocksource: exynos_mct: Only use 32-bits where possible
>>>> (2014-07-19 03:07:52 +0900)
>>>>
>>>> ----------------------------------------------------------------
>>>> exynos_mct update for v3.17
>>>> - only use 32-bit access for performance benefits on exynos
>>>>     32-bit system and this means ARCH timer should be supported
>>>>     on exynos 64-bit system instead of current MCT.
>>>> - use readl_relaxed/writel_relaxed to consistently use the
>>>>     proper functions in exynos_mct.
>>>
>>> There's no reason for these to go through arm-soc, is there? They s=
hould
>>> go through the clocksource tree (Daniel Lezcano / Thomas Gleixner).=
 They
>>> also lack acks from them if they for some reason need to go through=
 arm-soc.
>>
> Olof, you're right. The branch has no dependency with arm-soc so I ag=
reed.
>
>> Yes, that's right. Furthermore I have been discussing with Doug abou=
t
>> these patches before.
>>
>> Kukjin, is there any dependency on these patches ?
>>
> Yeah, Daniel, it should be handled in the clocksource tree so how sho=
uld I do
> for it?

I can pull your branch v3.17-next/mct-exynos and you drop the merge fro=
m=20
this branch in your master ?



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
