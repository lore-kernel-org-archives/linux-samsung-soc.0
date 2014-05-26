From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM
Date: Mon, 26 May 2014 11:10:02 +0530
Message-ID: <CAKohponMVKg118YxGHohqcHGmnnZmU3G2-=EJqz+RD0hH5o4tA@mail.gmail.com>
References: <1400670752-673-1-git-send-email-t.figa@samsung.com>
	<1400858533-4327-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:57790 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535AbaEZFkD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 01:40:03 -0400
Received: by mail-ob0-f170.google.com with SMTP id uy5so7706686obc.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 22:40:02 -0700 (PDT)
In-Reply-To: <1400858533-4327-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 23 May 2014 20:52, Tomasz Figa <t.figa@samsung.com> wrote:
> Currently Exynos cpufreq drivers rely on globally mapped clock
> controller registers to configure frequency of CPU cores. This is
> obviously wrong and will be removed in near future, but to enable
> support for multi-platform builds without introducing a regression it
> needs to be worked around.
>
> This patch hacks the code to look for clock controller node in device
> tree and map its registers using of_iomap(), instead of relying on
> global mapping, so dependencies on platform headers are removed and the
> driver can compile again with multiplatform support.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/cpufreq/Kconfig.arm          |  6 ++---
>  drivers/cpufreq/exynos-cpufreq.c     |  2 --
>  drivers/cpufreq/exynos-cpufreq.h     | 30 ++++++++++++-------------
>  drivers/cpufreq/exynos4210-cpufreq.c | 39 +++++++++++++++++++++++++++-----
>  drivers/cpufreq/exynos4x12-cpufreq.c | 40 ++++++++++++++++++++++++++++-----
>  drivers/cpufreq/exynos5250-cpufreq.c | 43 +++++++++++++++++++++++++++++-------
>  6 files changed, 119 insertions(+), 41 deletions(-)

Looks fine..

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
