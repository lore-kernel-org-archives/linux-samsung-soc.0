From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Sun, 07 Sep 2014 18:12:14 +0200
Message-ID: <540C83DE.10505@collabora.co.uk>
References: <20140905115704.GO13515@arm.com>	<20140905122232.GP13515@arm.com> <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com> <540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:32885 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752538AbaIGQMU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Sep 2014 12:12:20 -0400
In-Reply-To: <540C7F5B.6070307@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will.deacon@arm.com>
Cc: Doug Anderson <dianders@chromium.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>

Hello Tomasz,

On 09/07/2014 05:52 PM, Tomasz Figa wrote:
> 
> So I believe we've got a process issue here. If you don't have normal
> support for display hardware, but you want to keep the display
> operational thanks to bootloader already initializing it, you should not
> add anything to the kernel which breaks it, until full support comes in.
> 
> This means that respective regulators should be either always-on or not
> listed at all (I'd favor the former)

So that means that do you think that the workaround patch I shared on the
previous email could be considered as a correct solution? In that case I can
post it as a proper patch.

> somehow enabled at boot-up or completely ignored, including all their
> parents capable of being gated.
>

AFAIU from the thread I mentioned before, Nvidia folks proposed the same to
fix the simplefb issue on sunxi, to avoid the clocks in question being turned
off at boot by modifying the sunxi clock driver.

> Now with regulators this is pretty straightforward, but with clocks I
> believe it's an open issue. AFAIR we've discussed this on MLs some time
> ago (at least I remember Doug commenting on that topic) and kind of
> concluded that SoC clock drivers could include lists of clocks to be
> enabled at boot-up (as a HACK to enable things like simplefb until
> proper support for respective features are added).
>
> I believe this would be the proper solution for $subject.
> 

Clocks is not an issue at least on this machine since the bootloader already
passes the clk_ignore_unused parameter to the kernel command line so in that
sense there isn't a regression comparing with older kernels. If possible I
would prefer to leave this way instead of adding quirks to the clock driver,
specially since there are proposed patches to have the display working using
the Exynos DRM driver on this machine.

> Best regards,
> Tomasz
> 

Best regards,
Javier
