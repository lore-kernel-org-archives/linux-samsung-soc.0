From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [GIT PULL 00/10] Samsung 2nd pull-request for v3.11
Date: Wed, 19 Jun 2013 08:39:52 +0530
Message-ID: <CAK9yfHx--0dKDzdpBz3o_V_j+D+4f_N576rwuuVcJbMROtx=mQ@mail.gmail.com>
References: <51C0BC2D.80705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:36486 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933836Ab3FSDJw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 23:09:52 -0400
Received: by mail-oa0-f42.google.com with SMTP id n12so6014536oag.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 20:09:52 -0700 (PDT)
In-Reply-To: <51C0BC2D.80705@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Kukjin,

On 19 June 2013 01:29, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof
>
> This is 2nd pull-request for Samsung stuff for v3.11.
>
> This is including following branches.
> v3.11-next/cleanup-samsung
> v3.11-next/exynos-arch-2
> v3.11-next/exynos-dt-2
> v3.11-next/s3c24xx-dt-2
> v3.11-next/dt-n-clk-audio
> v3.11-next/remove-nondt-exynos-3
> v3.11-next/s3c24xx-pinctrl-2
> v3.11-next/soc-exynos5420
> v3.11-next/samsung-defconfig
> v3.11-next/non-critical-fixes
>
> Just note, for remove-nondt-exynos-3 branch, small merge conflict will be
> happened. I added my resolution in the pull-request.
>
> If any problems, please kindly let me know.
>
> Thanks,
> - Kukjin

[snip]
>
> Sachin Kamat (3):
>       ARM: dts: Add PWM related pinctrl entries for exynos4210
>       ARM: dts: Add LCD related pinctrl entries for exynos4210
>       ARM: dts: Add FIMD node to Origen4210 board

I dont see my following patch in this pull request which you said you
had applied.
https://patchwork.kernel.org/patch/2469891/


-- 
With warm regards,
Sachin
