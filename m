From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [GIT PULL 4/5] Samsung exynos_mct update for v3.17
Date: Mon, 21 Jul 2014 10:47:39 +0200
Message-ID: <53CCD3AB.7040205@linaro.org>
References: <53C9C164.9030404@samsung.com> <20140719220623.GF15676@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:41650 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753036AbaGUIrl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 04:47:41 -0400
Received: by mail-we0-f170.google.com with SMTP id w62so7253345wes.29
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 01:47:40 -0700 (PDT)
In-Reply-To: <20140719220623.GF15676@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, tglx@linutronix.de

On 07/20/2014 12:06 AM, Olof Johansson wrote:
> On Sat, Jul 19, 2014 at 09:52:52AM +0900, Kukjin Kim wrote:
>> Note that this is also based on 3.16-rc5 because of dependency with
>> previous samsung fixes including exynos_mct already merged in
>> mainline during -rc.
>>
>> The following changes since commit 1795cd9b3a91d4b5473c97f491d638924=
42212ab:
>>
>>    Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
>>
>> are available in the git repository at:
>>
>
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t
>> tags/exynos-mct
>>
>> for you to fetch changes up to 1a631118c1d085fe162f3b6d44f710c72206e=
f2d:
>>
>>    clocksource: exynos_mct: Only use 32-bits where possible
>> (2014-07-19 03:07:52 +0900)
>>
>> ----------------------------------------------------------------
>> exynos_mct update for v3.17
>> - only use 32-bit access for performance benefits on exynos
>>    32-bit system and this means ARCH timer should be supported
>>    on exynos 64-bit system instead of current MCT.
>> - use readl_relaxed/writel_relaxed to consistently use the
>>    proper functions in exynos_mct.
>
> There's no reason for these to go through arm-soc, is there? They sho=
uld
> go through the clocksource tree (Daniel Lezcano / Thomas Gleixner). T=
hey
> also lack acks from them if they for some reason need to go through a=
rm-soc.

Yes, that's right. Furthermore I have been discussing with Doug about=20
these patches before.

Kukjin, is there any dependency on these patches ?

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
