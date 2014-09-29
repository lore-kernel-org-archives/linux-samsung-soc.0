From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCHv3 3/4] ARM: exynos: Add exynos3250 compatible to use
 generic cpufreq driver
Date: Mon, 29 Sep 2014 02:58:25 -0700
Message-ID: <CAKohpokXNEYZBqsKyJDMUCZA7BY_E0=G5eVmTx_cBKvAyoSi9w@mail.gmail.com>
References: <1411628707-8496-1-git-send-email-cw00.choi@samsung.com>
	<1411628707-8496-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:51525 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076AbaI2J60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 05:58:26 -0400
Received: by mail-qa0-f45.google.com with SMTP id w8so929927qac.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2014 02:58:25 -0700 (PDT)
In-Reply-To: <1411628707-8496-4-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 25 September 2014 00:05, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch add exynos3250 compatible string to exynos_cpufreq_matches
> for supporting generic cpufreq driver on Exynos3250.
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index 8923d37..1318d69 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -285,6 +285,7 @@ static const struct of_device_id exynos_cpufreq_matches[] = {
>         { .compatible = "samsung,exynos5420", .data = "arm-bL-cpufreq-dt" },
>         { .compatible = "samsung,exynos5250", .data = "cpufreq-cpu0" },
>         { .compatible = "samsung,exynos4210", .data = "cpufreq-cpu0" },
> +       { .compatible = "samsung,exynos3250", .data = "cpufreq-cpu0" },

cpufreq-cpu0 is renamed to cpufreq-dt now.
