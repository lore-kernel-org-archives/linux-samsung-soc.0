From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2 16/17] ARM: exynos: cpuidle: Move the driver to
 drivers/cpuidle directory
Date: Mon, 7 Apr 2014 15:21:37 +0530
Message-ID: <CAK9yfHzXk6ErtmNuT0Z-kMfUGT=GMmFugPR8J=-3SvPMagp6ZA@mail.gmail.com>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
	<1396618989-2897-17-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:40285 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753510AbaDGJvh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 05:51:37 -0400
Received: by mail-ob0-f177.google.com with SMTP id wo20so6073575obc.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2014 02:51:37 -0700 (PDT)
In-Reply-To: <1396618989-2897-17-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

Hi Daniel,

On 4 April 2014 19:13, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/mach-exynos/Makefile                      |    1 -
>  drivers/cpuidle/Kconfig.arm                        |    7 +++++++
>  drivers/cpuidle/Makefile                           |    1 +
>  .../cpuidle.c => drivers/cpuidle/cpuidle-exynos.c  |    0
>  4 files changed, 8 insertions(+), 1 deletion(-)
>  rename arch/arm/mach-exynos/cpuidle.c => drivers/cpuidle/cpuidle-exynos.c (100%)

This driver now references platform header file (plat/cpu.h) for some
Exynos5440 specific check
which is not good considering multiplatform support. Any plan to get
rid of this?

-- 
With warm regards,
Sachin
