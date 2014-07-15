From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: config: update multi_v7_defconfig
Date: Tue, 15 Jul 2014 08:59:45 -0700
Message-ID: <CAD=FV=UFknqF_Mt7ArytFq4KdDsGDa+JR2KZzX9Xn+if-_Vw4g@mail.gmail.com>
References: <1405411346-12471-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:52221 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753930AbaGOP7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 11:59:46 -0400
Received: by mail-vc0-f179.google.com with SMTP id id10so10566502vcb.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 08:59:45 -0700 (PDT)
In-Reply-To: <1405411346-12471-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olofj@chromium.org>, "cpgs ." <cpgs@samsung.com>

Naveen,

On Tue, Jul 15, 2014 at 1:02 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Enabled S3C24XX I2C driver and MAX77686 PMIC MFD and Voltage
> regulator drivers used on Exynos5250 based Snow board.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> By enabling the symbols to compile S3C24XX I2C driver, MAX77686 PMIC
> under MFD and REGULATOR.
>
> http://arm-soc.lixom.net/bootlogs/next/next-20140711/snow-multi_v7_defconfig.html
> The warnings by cpufreq on Snow board are fixed.
>
> Booted and verified on  on Exynos5420 based Snow board
>
>  arch/arm/configs/multi_v7_defconfig |    3 +++
>  1 file changed, 3 insertions(+)

Is there a reason not to add more of the max77686 configs?

+CONFIG_RTC_DRV_MAX77686=y
+CONFIG_COMMON_CLK_MAX77686=y

I also seems like it would be nice to reconcile this with Sacin's
latest patch.  For starters I notice that you're missing:
  CONFIG_EXYNOS5420_MCPM=y

I'll leave it up to you to look for other things that might be
missing.  If some of the things in exynos5_defconfig can't go into the
multi-config, please explain.

-Doug
