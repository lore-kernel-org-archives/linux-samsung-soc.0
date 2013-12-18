From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 08/11] cpufreq: exynos: move definitions for
 exynos-cpufreq into drivers/cpufreq/
Date: Wed, 18 Dec 2013 10:09:27 +0530
Message-ID: <CAOh2x=mp=Ft0YK5PfRDGH_VVjbUS8ps+PhbmH6Z31wwA1rYRag@mail.gmail.com>
References: <116601cefb1e$84396e30$8cac4a90$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:42138 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752168Ab3LREj2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 23:39:28 -0500
Received: by mail-ve0-f170.google.com with SMTP id oy12so5052932veb.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2013 20:39:27 -0800 (PST)
In-Reply-To: <116601cefb1e$84396e30$8cac4a90$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Tue, Dec 17, 2013 at 5:22 PM,  <kgene@kernel.org> wrote:
> From: Kukjin Kim <kgene.kim@samsung.com>
>
> This moves regarding exynos-cpufreq definitions into drivers/cpufreq/
> exynos-cpufreq.h because they are used only for the cpufreq driver.
>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/regs-clock.h |   21 ---------------------
>  drivers/cpufreq/exynos-cpufreq.h               |   22
> ++++++++++++++++++++++
>  drivers/cpufreq/exynos4210-cpufreq.c           |    2 --
>  drivers/cpufreq/exynos4x12-cpufreq.c           |    2 --
>  drivers/cpufreq/exynos5250-cpufreq.c           |    1 -
>  5 files changed, 22 insertions(+), 26 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
