From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/3] cpufreq: s3c: remove last use of resume_clocks callback
Date: Thu, 29 Jan 2015 08:53:31 +0530
Message-ID: <CAKohpo=v7SLii7ykqWfpf0ZAzCF6Oi9_ARVNmTu9u4j9poXafA@mail.gmail.com>
References: <1422451015-390439-1-git-send-email-arnd@arndb.de>
	<1422451015-390439-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:38317 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761476AbbA2DXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jan 2015 22:23:32 -0500
Received: by mail-oi0-f41.google.com with SMTP id z81so22818142oif.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2015 19:23:31 -0800 (PST)
In-Reply-To: <1422451015-390439-3-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>

On 28 January 2015 at 18:46, Arnd Bergmann <arnd@arndb.de> wrote:
> Commit 32726d2d550 ("ARM: SAMSUNG: Remove legacy clock code")
> already removed the callback pointer, but there was one remaining
> user:
>
> drivers/cpufreq/s3c24xx-cpufreq.c: In function 's3c_cpufreq_resume_clocks':
> drivers/cpufreq/s3c24xx-cpufreq.c:149:14: error: 'struct s3c_cpufreq_info' has no member named 'resume_clocks'
>   cpu_cur.info->resume_clocks();
>               ^
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 32726d2d550 ("ARM: SAMSUNG: Remove legacy clock code")
> Cc: stable@vger.kernel.org # v3.17+
> ---
>  drivers/cpufreq/s3c24xx-cpufreq.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
> index bd340a1ca87d..733aa5153e74 100644
> --- a/drivers/cpufreq/s3c24xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c24xx-cpufreq.c
> @@ -144,11 +144,6 @@ static void s3c_cpufreq_setfvco(struct s3c_cpufreq_config *cfg)
>         (cfg->info->set_fvco)(cfg);
>  }
>
> -static inline void s3c_cpufreq_resume_clocks(void)
> -{
> -       cpu_cur.info->resume_clocks();
> -}
> -
>  static inline void s3c_cpufreq_updateclk(struct clk *clk,
>                                          unsigned int freq)
>  {
> @@ -417,9 +412,6 @@ static int s3c_cpufreq_resume(struct cpufreq_policy *policy)
>
>         last_target = ~0;       /* invalidate last_target setting */
>
> -       /* first, find out what speed we resumed at. */
> -       s3c_cpufreq_resume_clocks();
> -
>         /* whilst we will be called later on, we try and re-set the
>          * cpu frequencies as soon as possible so that we do not end
>          * up resuming devices and then immediately having to re-set

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
