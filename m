From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 7/7] cpufreq: exynos: remove all exynos specific
 cpufreq driver support
Date: Mon, 26 May 2014 11:48:24 +0530
Message-ID: <CAKohpokP8Kwygi-DbUmEc8EkGYYkO8+NRUN4VDyJ3SXWXViN2Q@mail.gmail.com>
References: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
	<1400855260-6807-8-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:54751 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292AbaEZGSZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 02:18:25 -0400
Received: by mail-oa0-f45.google.com with SMTP id l6so7900629oag.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 23:18:24 -0700 (PDT)
In-Reply-To: <1400855260-6807-8-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

On 23 May 2014 19:57, Thomas Abraham <thomas.ab@samsung.com> wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
>
> Exynos4210, Exynos4x12 and Exynos5250 based platforms have switched over
> to use cpufreq-cpu0 driver for cpufreq functionality. So the Exynos
> specific cpufreq drivers for these platforms can be removed.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  drivers/cpufreq/Kconfig.arm          |   52 --------
>  drivers/cpufreq/Makefile             |    4 -
>  drivers/cpufreq/exynos-cpufreq.c     |  218 ----------------------------------
>  drivers/cpufreq/exynos-cpufreq.h     |   99 ---------------
>  drivers/cpufreq/exynos4210-cpufreq.c |  157 ------------------------
>  drivers/cpufreq/exynos4x12-cpufreq.c |  208 --------------------------------
>  drivers/cpufreq/exynos5250-cpufreq.c |  183 ----------------------------
>  7 files changed, 921 deletions(-)
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
>  delete mode 100644 drivers/cpufreq/exynos4210-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos5250-cpufreq.c

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
