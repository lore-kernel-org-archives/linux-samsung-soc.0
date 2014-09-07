From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Sun, 07 Sep 2014 18:40:47 +0200
Message-ID: <540C8A8F.5010106@collabora.co.uk>
References: <20140905115704.GO13515@arm.com>	<20140905122232.GP13515@arm.com> <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com> <540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com> <540C83DE.10505@collabora.co.uk> <540C8577.2070907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:32911 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752509AbaIGQky (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Sep 2014 12:40:54 -0400
In-Reply-To: <540C8577.2070907@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will.deacon@arm.com>
Cc: Doug Anderson <dianders@chromium.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>

Hello Tomasz,

On 09/07/2014 06:19 PM, Tomasz Figa wrote:
> On 07.09.2014 18:12, Javier Martinez Canillas wrote:
>> Clocks is not an issue at least on this machine since the bootloader already
>> passes the clk_ignore_unused parameter to the kernel command line so in that
>> sense there isn't a regression comparing with older kernels. If possible I
>> would prefer to leave this way instead of adding quirks to the clock driver,
>> specially since there are proposed patches to have the display working using
>> the Exynos DRM driver on this machine.
> 
> Well, clk_ignore_unused seems a bit too coarse grained to me. Also
> forcing the user to add it in his bootloader (or any other way) is not
> really the best practice IMHO.
>

Fair enough.

> At least for next 3.17-rc I'd suggest fixing this up in respective clock
> driver and dropping the hack only after Exynos DRM patches are merged
> and confirmed working.
> 

Ok, I'll prepare a patch to add the CLK_IGNORE_UNUSED flag to the needed
clocks in drivers/clk/samsung/clk-exynos5250.c. That will be a more
fine-grained solution since the clk_ignore_unused kernel parameter won't be
needed.

> Best regards,
> Tomasz
> 

Best regards,
Javier
