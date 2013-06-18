From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 31/38] cpufreq: exynos4x12: Remove check for SOC_EXYNOS4412
Date: Tue, 18 Jun 2013 08:48:41 +0530
Message-ID: <CAKohpomufhbjafoekVcW8HZkMHTp7Ew-wHJQ45TrCg6tBExVqQ@mail.gmail.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
	<1371486863-12398-32-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33327 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753803Ab3FRDSl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 23:18:41 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so4007735obc.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 20:18:41 -0700 (PDT)
In-Reply-To: <1371486863-12398-32-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On 17 June 2013 22:04, Tomasz Figa <t.figa@samsung.com> wrote:
> Since SOC_EXYNOS4412 Kconfig symbol has been removed, it is enough to
> check for SOC_EXYNOS4212 for both SoCs from Exynos4x12 series.
>
> Cc: linux-pm@vger.kernel.org
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/cpufreq/Kconfig.arm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good. You want it to get via samsung tree or cpufreq? I think
all cpufreq related patches should go through cpufreq unless there
is a real dependency on samsung tree.
