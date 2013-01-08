From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos: Show list of available frequencies
Date: Tue, 8 Jan 2013 16:30:45 +0530
Message-ID: <CAG17yqSKUDtAWvUnMFgavvmZABekrD_MkXK4Myk57X82Xu6RfA@mail.gmail.com>
References: <1357642258-32421-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1357642258-32421-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@lists.linux-foundation.org
Cc: rjw@sisk.pl, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, dg77.kim@samsung.com, MyungJoo Ham <myungjoo.ham@samsung.com>, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

+CC:
dg77.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com

On 8 January 2013 16:20, Inderpal Singh <inderpal.singh@linaro.org> wrote:
> Add freq_attr attribute to show list of available frequencies.
>
> Signed-off-by: Donggeun Kim <dg77.kim@samsung.com>
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: KyungMin Park <kyungmin.park@samsung.com>
> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
>  drivers/cpufreq/exynos-cpufreq.c |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
> index 7012ea8..bc1e833 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -244,13 +244,26 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
>         return cpufreq_frequency_table_cpuinfo(policy, exynos_info->freq_table);
>  }
>
> +static int exynos_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> +{
> +       cpufreq_frequency_table_put_attr(policy->cpu);
> +       return 0;
> +}
> +
> +static struct freq_attr *exynos_cpufreq_attr[] = {
> +       &cpufreq_freq_attr_scaling_available_freqs,
> +       NULL,
> +};
> +
>  static struct cpufreq_driver exynos_driver = {
>         .flags          = CPUFREQ_STICKY,
>         .verify         = exynos_verify_speed,
>         .target         = exynos_target,
>         .get            = exynos_getspeed,
>         .init           = exynos_cpufreq_cpu_init,
> +       .exit           = exynos_cpufreq_cpu_exit,
>         .name           = "exynos_cpufreq",
> +       .attr           = exynos_cpufreq_attr,
>  #ifdef CONFIG_PM
>         .suspend        = exynos_cpufreq_suspend,
>         .resume         = exynos_cpufreq_resume,
> --
> 1.7.9.5
>
