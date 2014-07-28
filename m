From: Doug Anderson <dianders@chromium.org>
Subject: Re: kgene's for-next branch broken, and boot regressions
Date: Sun, 27 Jul 2014 20:30:27 -0700
Message-ID: <CAD=FV=Vw-cPW2B1RZHjMbO9SqmQ-=AVv_XqV-NEmNMPagWv93g@mail.gmail.com>
References: <53D46D2F.3000202@suse.de>
	<009b01cfa9fb$157617a0$406246e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:49060 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862AbaG1Da1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 23:30:27 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so10545569vcb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2014 20:30:27 -0700 (PDT)
In-Reply-To: <009b01cfa9fb$157617a0$406246e0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>

Kukjin,

On Sun, Jul 27, 2014 at 5:30 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Oops, I always use my script to check kernel build like follow...
>
> $ mt
> building exynos_defconfig done
> building s3c2410_defconfig done
> building s3c6400_defconfig done
> building s5pv210_defconfig done
>
> but seems it couldn't detect the breakage from dtb :(

Could you add a "make dtbs" in there?

Is there any chance you could get a boot farm on this, or somehow try
to piggyback on Olof's or Kevin's boot farms (assuming they are
willing to build/boot your branch on relevant hardware)?

-Doug
