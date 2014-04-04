From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 16/17] ARM: exynos: cpuidle: Move the driver to
 drivers/cpuidle directory
Date: Fri, 4 Apr 2014 14:37:19 +0530
Message-ID: <CAKohpo=GFWgVgroFzBJEpCV6H1dkdirFzmO8tTpuM5U8mXgmAw@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-17-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:33035 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751713AbaDDJHT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:07:19 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so3210521oag.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:07:19 -0700 (PDT)
In-Reply-To: <1396597683-6969-17-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:18, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:

Maybe a few lines here on why this is important..

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/Makefile                      |    1 -
>  drivers/cpuidle/Kconfig.arm                        |    7 +++++++
>  drivers/cpuidle/Makefile                           |    1 +
>  .../cpuidle.c => drivers/cpuidle/cpuidle-exynos.c  |    0
>  4 files changed, 8 insertions(+), 1 deletion(-)
>  rename arch/arm/mach-exynos/cpuidle.c => drivers/cpuidle/cpuidle-exynos.c (100%)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
