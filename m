From: Olof Johansson <olof@lixom.net>
Subject: Re: kgene's for-next branch broken, and boot regressions
Date: Sun, 27 Jul 2014 20:44:39 -0700
Message-ID: <CAOesGMibn1VpDKGSTQXNcDrn7QswW+Zwm5nHRFYreYmPpSAtCg@mail.gmail.com>
References: <53D46D2F.3000202@suse.de>
	<009b01cfa9fb$157617a0$406246e0$@samsung.com>
	<CAD=FV=Vw-cPW2B1RZHjMbO9SqmQ-=AVv_XqV-NEmNMPagWv93g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:42815 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825AbaG1Dok (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 23:44:40 -0400
Received: by mail-vc0-f182.google.com with SMTP id hy4so10657751vcb.27
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2014 20:44:39 -0700 (PDT)
In-Reply-To: <CAD=FV=Vw-cPW2B1RZHjMbO9SqmQ-=AVv_XqV-NEmNMPagWv93g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>

On Sun, Jul 27, 2014 at 8:30 PM, Doug Anderson <dianders@chromium.org> wrote:
> Kukjin,
>
> On Sun, Jul 27, 2014 at 5:30 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> Oops, I always use my script to check kernel build like follow...
>>
>> $ mt
>> building exynos_defconfig done
>> building s3c2410_defconfig done
>> building s3c6400_defconfig done
>> building s5pv210_defconfig done
>>
>> but seems it couldn't detect the breakage from dtb :(
>
> Could you add a "make dtbs" in there?
>
> Is there any chance you could get a boot farm on this, or somehow try
> to piggyback on Olof's or Kevin's boot farms (assuming they are
> willing to build/boot your branch on relevant hardware)?

I boot -next on the farm, and it had found the 5410 issues, which I
forwarded on to some of the relevant parties (but maybe not all). I
don't have any 5410 hardware so I couldn't bisect the problem and
narrow it down to a single patch. Hardware currently in there is 4412
(ODROID-U3), 5250 (Arndale and Snow), 5420 and 5800 (Pit/Pi). I have a
6410-based board that I have not yet hooked up.

I also boot arm-soc's for-next branch, so as soon as we merge
something in I'll notice breakage, if it's somehow masked by other
parts of linux-next (i.e. dependent but not described driver changes,
etc).


-Olof
