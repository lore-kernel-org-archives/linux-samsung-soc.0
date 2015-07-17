From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/9] ARM: multi_v7_defconfig: Enable max77802 regulator,
 rtc and clock drivers
Date: Fri, 17 Jul 2015 09:49:27 -0700
Message-ID: <20150717164927.GA21691@localhost>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
 <1431618016-2087-3-git-send-email-javier.martinez@collabora.co.uk>
 <CABxcv=maAMu=+JcRfkErBHUdz+Y6CWg5S1qCg=YnRJc6TqPsVg@mail.gmail.com>
 <55A6FE07.7000604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:34584 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755233AbbGQRaP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jul 2015 13:30:15 -0400
Received: by pdbbh15 with SMTP id bh15so19370280pdb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2015 10:30:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55A6FE07.7000604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Jul 16, 2015 at 09:42:47AM +0900, Krzysztof Kozlowski wrote:
> On 16.07.2015 00:38, Javier Martinez Canillas wrote:
> > Hello,
> > 
> > On Thu, May 14, 2015 at 5:40 PM, Javier Martinez Canillas
> > <javier.martinez@collabora.co.uk> wrote:
> >> The Maxim max77802 Power Management IC is used on many Exynos machines.
> >> Besides a bunch of regulators, this chip has a Real-Time-Clock (RTC)
> >> and 2-channel 32kHz clock outputs.
> >>
> >> Enable the kernel config options to have the drivers for these devices
> >> built as a module.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> >> ---
> >>  arch/arm/configs/multi_v7_defconfig | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> >> index 2349584b6e08..080120fe5580 100644
> >> --- a/arch/arm/configs/multi_v7_defconfig
> >> +++ b/arch/arm/configs/multi_v7_defconfig
> >> @@ -373,6 +373,7 @@ CONFIG_POWER_RESET_SYSCON=y
> >>  CONFIG_REGULATOR_MAX8907=y
> >>  CONFIG_REGULATOR_MAX8973=y
> >>  CONFIG_REGULATOR_MAX77686=y
> >> +CONFIG_REGULATOR_MAX77802=m
> > 
> > I noticed that the version that landed in 4.2-rc1 as commit
> > f3caa529c6f5 ("ARM: multi_v7_defconfig: Enable max77802 regulator, rtc
> > and clock drivers") doesn't include this symbol. I guess it was caused
> > by a wrong resolved conflict? I'll post a patch to enable the
> > regulator again.
> 
> As you can see in mentioned mainline commit Kukjin removed it manually:
> [kgene@kernel.org: removing useless REGULATOR_MAX77802 config]
> 
> I wonder why?

Seems odd. exynos_defconfig still enables it.

Javier or Krzysztof, please send an incremental fix to enable and I'll pick
it up as a fix.


-Olof
