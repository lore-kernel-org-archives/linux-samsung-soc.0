From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 2/9] ARM: multi_v7_defconfig: Enable max77802 regulator,
 rtc and clock drivers
Date: Sat, 25 Jul 2015 11:01:34 +0900
Message-ID: <05ac01d0c67d$d581a740$8084f5c0$@kernel.org>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
 <1431618016-2087-3-git-send-email-javier.martinez@collabora.co.uk>
 <CABxcv=maAMu=+JcRfkErBHUdz+Y6CWg5S1qCg=YnRJc6TqPsVg@mail.gmail.com>
 <55A6FE07.7000604@samsung.com> <20150717164927.GA21691@localhost>
 <CABxcv=kXmFs7SfdbB9y5HzfxX3QPfpvSANmUKZGFnMRnB6Rv2A@mail.gmail.com>
 <CAOesGMjBgbsPZujB=kQgv-pUuFs3Qvufz1_1TsDVA0dYzs1Cdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32857 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbGYCBh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 22:01:37 -0400
In-reply-to: <CAOesGMjBgbsPZujB=kQgv-pUuFs3Qvufz1_1TsDVA0dYzs1Cdw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Javier Martinez Canillas' <javier@dowhile0.org>
Cc: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, 'Doug Anderson' <dianders@chromium.org>, 'Kukjin Kim' <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, 'Linux Kernel' <linux-kernel@vger.kernel.org>

Olof Johansson wrote:
> 
> Hi,
> 
Hi,

> On Fri, Jul 17, 2015 at 11:47 AM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> > Hello Olof,
> >
> > On Fri, Jul 17, 2015 at 6:49 PM, Olof Johansson <olof@lixom.net> wrote:
> >> On Thu, Jul 16, 2015 at 09:42:47AM +0900, Krzysztof Kozlowski wrote:
> >>> On 16.07.2015 00:38, Javier Martinez Canillas wrote:
> >>> > Hello,
> >>> >
> >>> > On Thu, May 14, 2015 at 5:40 PM, Javier Martinez Canillas
> >>> > <javier.martinez@collabora.co.uk> wrote:
> >>> >> The Maxim max77802 Power Management IC is used on many Exynos machines.
> >>> >> Besides a bunch of regulators, this chip has a Real-Time-Clock (RTC)
> >>> >> and 2-channel 32kHz clock outputs.
> >>> >>
> >>> >> Enable the kernel config options to have the drivers for these devices
> >>> >> built as a module.
> >>> >>
> >>> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> >>> >> ---
> >>> >>  arch/arm/configs/multi_v7_defconfig | 3 +++
> >>> >>  1 file changed, 3 insertions(+)
> >>> >>
> >>> >> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> >>> >> index 2349584b6e08..080120fe5580 100644
> >>> >> --- a/arch/arm/configs/multi_v7_defconfig
> >>> >> +++ b/arch/arm/configs/multi_v7_defconfig
> >>> >> @@ -373,6 +373,7 @@ CONFIG_POWER_RESET_SYSCON=y
> >>> >>  CONFIG_REGULATOR_MAX8907=y
> >>> >>  CONFIG_REGULATOR_MAX8973=y
> >>> >>  CONFIG_REGULATOR_MAX77686=y
> >>> >> +CONFIG_REGULATOR_MAX77802=m
> >>> >
> >>> > I noticed that the version that landed in 4.2-rc1 as commit
> >>> > f3caa529c6f5 ("ARM: multi_v7_defconfig: Enable max77802 regulator, rtc
> >>> > and clock drivers") doesn't include this symbol. I guess it was caused
> >>> > by a wrong resolved conflict? I'll post a patch to enable the
> >>> > regulator again.
> >>>
> >>> As you can see in mentioned mainline commit Kukjin removed it manually:
> >>> [kgene@kernel.org: removing useless REGULATOR_MAX77802 config]
> >>>
> >>> I wonder why?
> >>
> >> Seems odd. exynos_defconfig still enables it.
> >>
It has been removed when I did 'make savedefconfig' at that time maybe because
of dependency with other configs...

> > Yeah since it is needed for at least the Exynos5420 Peach Pit and
> > Exynos5800 Peach Pi Chromebooks that use this PMIC.
> >
> >> Javier or Krzysztof, please send an incremental fix to enable and I'll pick
> >> it up as a fix.
> >>
> >
> > I already posted an incremental patch [0] and Krzysztof is pushing it
> > through Kukjin for 4.3 [1].
> >
Yes. I'll send it out to arm-soc in this weekend.

> > I guess that's OK and there is no need to add it as a fix for the 4.2
> > -rc cycle since this is not really a regression. I mean, the max77802
> > regulator driver was never enabled for multi_v7_defconfig before.
> 
> Yeah, I came across those emails a little further down. :-) It's all
> good, we'll see it come in later.
> 
Thanks,
Kukjin
