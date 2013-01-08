From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: EXYNOS: skip the clock initialization for exynos5440
Date: Tue, 8 Jan 2013 09:39:36 -0800
Message-ID: <CAOesGMj09LC5uX8=r_xEMGk5qGK3PNHB-DCL1Q3oNV8n4aF6Dw@mail.gmail.com>
References: <1356996838-21796-1-git-send-email-kgene.kim@samsung.com>
	<CAOesGMjaaGtGh8SOJVUWU+nJ2kJ9ZfhA=ieutmZRuNYu=2W2gw@mail.gmail.com>
	<097801cdedc6$8eb22700$ac167500$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:60406 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756777Ab3AHRjp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jan 2013 12:39:45 -0500
Received: by mail-ie0-f180.google.com with SMTP id c10so844366ieb.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jan 2013 09:39:45 -0800 (PST)
In-Reply-To: <097801cdedc6$8eb22700$ac167500$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Tue, Jan 8, 2013 at 9:35 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> Hi,
>>
>> On Mon, Dec 31, 2012 at 3:33 PM, Kukjin Kim <kgene.kim@samsung.com>
>> wrote:
>> > Since exynos5440 can support only common clk stuff, so this
>> > patch skips legacy exynos5 clock initialization.
>> >
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> >  arch/arm/mach-exynos/common.c |    7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-
>> exynos/common.c
>> > index d6d0dc6..1a89824 100644
>> > --- a/arch/arm/mach-exynos/common.c
>> > +++ b/arch/arm/mach-exynos/common.c
>> > @@ -424,11 +424,18 @@ static void __init exynos5_init_clocks(int xtal)
>> >  {
>> >         printk(KERN_DEBUG "%s: initializing clocks\n", __func__);
>> >
>> > +       /* EXYNOS5440 can support only common clock framework */
>> > +
>> > +       if (soc_is_exynos5440())
>> > +               return;
>> > +
>> > +#ifdef CONFIG_SOC_EXYNOS5250
>>
>> Why are you adding an ifdef here, when the return above will take care
>> of returning early for 5440?
>>
> Without this, compilation error should be happened when we builds only for
> exynos5440 without selection exynos5250, because you know, current
> exynos5440 stuff cannot support legacy exynos5 clock. Of course, the ifdef
> will be going away when we support common clock on all of exynos stuff, but
> it's v3.9 not v3.8 so I think, we need this for now.
> Note, exynos5440 is working fine on current mainline + v3.8-samsung-fixes-2
> without any configuration clock stuff in kernel because hardware initial
> value is ok.

Why is there a need to have a config option for 5250 and 5440? They
are similar enough that there shouldn't be much overhead to just have
a EXYNOS5 option that includes both. It's how some of the other SoCs
handle this (OMAP and Tegra, for example).

That would reduce the amount of ifdefs in your code as well, for cases
like these. I think it's a good idea -- especially since these parts
are used in bigger systems where saving the last 2k of code/data isn't
as critical. Having easy-to-maintain code is worth more in most of
those cases.

So, I'll pull the branch but please consider removing the config
options in 3.9, and not adding new ones for future similar parts if at
all possible.

Thanks!

-Olof
