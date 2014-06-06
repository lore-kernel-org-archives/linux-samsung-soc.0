From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 23:06:51 +0530
Message-ID: <CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com>
References: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com>
	<539145B4.5000200@gmail.com>
	<CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:38724 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803AbaFFRgw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 13:36:52 -0400
Received: by mail-qa0-f43.google.com with SMTP id m5so4369320qaj.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 10:36:51 -0700 (PDT)
In-Reply-To: <CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Tushar Behera <trblinux@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Kevin Hilman <khilman@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Arun Kumar <arun.kk@samsung.com>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Doug,

The first change in the kernel (clearing an iRAM location) is needed
because of an unnecessary change that we are carrying in the Chrome
U-boot. There is no reason for us to have the workaround in the
mainline kernel. Rather, we should remove the check from our u-boot.
However AFAIR a clean-up patch that I had posted internally was not
accepted as we had frozen the SPL at the time.

The second change is to enable snoops for boot cluster. Internally, we
were disabling the snoops for both the clusters at power off and
enabling it in power_up_setup and power_up. However, I dropped the
approach due to problems pointed out by Nicolas here
http://www.spinics.net/lists/arm-kernel/msg324091.html related to
cpuidle. Hence, we turn it on at the u-boot.

Regards,
Abhilash

On Fri, Jun 6, 2014 at 10:47 PM, Doug Anderson <dianders@google.com> wrote:
> Tushar,
>
> On Thu, Jun 5, 2014 at 9:38 PM, Tushar Behera <trblinux@gmail.com> wrote:
>> On 06/06/2014 06:38 AM, Doug Anderson wrote:
>>> Hi,
>>>
>>> When I try to boot linuxnext on my exynos5420-peach-pit chromebook I
>>> have problems bringing up extra CPUs:
>>>
>>> 1. They don't come up
>>>
>>
>> [ ... ]
>>
>>> [    1.125030] CPU1: failed to boot: -38
>>> [    2.130043] CPU2: failed to boot: -38
>>> [    3.135059] CPU3: failed to boot: -38
>>>
>>
>> With following config modifications over exynos_defconfig, I can see 4
>> big cores coming up.
>>
>> CONFIG_MCPM=y
>> CONFIG_EXYNOS5420_MCPM=y
>
> Thanks!  OK, that certainly changes the behavior for me!  ...but it
> doesn't work.
>
> I also got a response from some folks that I pinged off-list.
> Apparently our U-Boot doesn't set things up like the upstream kernel
> expects (ugh!), so to get things booting you need the magic commands
> in U-Boot:
>
> mw.l 02073028 0  # Clear EXYNOS_START_FLAG
> mw.l 10d25000 3  # Enable CCI from U-Boot
>
> Once you do that then all 8 CPUs can come up!
>
>
> Can someone at Samsung come up with a reasonable solution about how we
> should solve this in a way that everyone can be happy with?  I haven't
> really been involved with MCPM stuff, so I'm not sure why what landed
> upstream is different than what we have in our kernel.
>
> I guess worst case we can require that anyone running an upstream
> kernel simply needs a "fixed" U-Boot, but that's always a bit of a
> hassle.  We might have to go there eventually anyway given that our L2
> cache timings in U-Boot are wrong (again!) and it's unlikely that
> upstream will take some weird hack in the kernel to fix them...
>
> -Doug
>
>
> P.S. We also really need to do something about the configs.  There are
> no exynos configs upstream that have any useful set of options (that I
> know of).  ...and useful options don't seem to get selected
> automatically...
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
