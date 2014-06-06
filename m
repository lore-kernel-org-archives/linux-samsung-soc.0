From: Doug Anderson <dianders@google.com>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 10:17:00 -0700
Message-ID: <CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com>
References: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com>
	<539145B4.5000200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:36342 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbaFFRRC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 13:17:02 -0400
Received: by mail-ve0-f178.google.com with SMTP id sa20so3568479veb.37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 10:17:00 -0700 (PDT)
In-Reply-To: <539145B4.5000200@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, "Turquette, Mike" <mturquette@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arun Kumar <arun.kk@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sonny Rao <sonnyrao@chromium.org>

Tushar,

On Thu, Jun 5, 2014 at 9:38 PM, Tushar Behera <trblinux@gmail.com> wrote:
> On 06/06/2014 06:38 AM, Doug Anderson wrote:
>> Hi,
>>
>> When I try to boot linuxnext on my exynos5420-peach-pit chromebook I
>> have problems bringing up extra CPUs:
>>
>> 1. They don't come up
>>
>
> [ ... ]
>
>> [    1.125030] CPU1: failed to boot: -38
>> [    2.130043] CPU2: failed to boot: -38
>> [    3.135059] CPU3: failed to boot: -38
>>
>
> With following config modifications over exynos_defconfig, I can see 4
> big cores coming up.
>
> CONFIG_MCPM=y
> CONFIG_EXYNOS5420_MCPM=y

Thanks!  OK, that certainly changes the behavior for me!  ...but it
doesn't work.

I also got a response from some folks that I pinged off-list.
Apparently our U-Boot doesn't set things up like the upstream kernel
expects (ugh!), so to get things booting you need the magic commands
in U-Boot:

mw.l 02073028 0  # Clear EXYNOS_START_FLAG
mw.l 10d25000 3  # Enable CCI from U-Boot

Once you do that then all 8 CPUs can come up!


Can someone at Samsung come up with a reasonable solution about how we
should solve this in a way that everyone can be happy with?  I haven't
really been involved with MCPM stuff, so I'm not sure why what landed
upstream is different than what we have in our kernel.

I guess worst case we can require that anyone running an upstream
kernel simply needs a "fixed" U-Boot, but that's always a bit of a
hassle.  We might have to go there eventually anyway given that our L2
cache timings in U-Boot are wrong (again!) and it's unlikely that
upstream will take some weird hack in the kernel to fix them...

-Doug


P.S. We also really need to do something about the configs.  There are
no exynos configs upstream that have any useful set of options (that I
know of).  ...and useful options don't seem to get selected
automatically...
