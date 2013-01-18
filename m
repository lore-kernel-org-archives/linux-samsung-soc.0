From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [linux-pm] [PATCH] cpufreq: exynos: Show list of available
 frequencies
Date: Thu, 17 Jan 2013 20:35:17 -0800
Message-ID: <00e301cdf535$38f933a0$aaeb9ae0$@samsung.com>
References: <1357642258-32421-1-git-send-email-inderpal.singh@linaro.org>
 <CADGdYn6=fztS_Z9UeQiRyfE3FTAq+XfuPSrY=fT7LOgU498QXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CADGdYn6=fztS_Z9UeQiRyfE3FTAq+XfuPSrY=fT7LOgU498QXQ@mail.gmail.com>
Content-language: en-us
Sender: cpufreq-owner@vger.kernel.org
To: 'amit kachhap' <amit.kachhap@gmail.com>, 'Inderpal Singh' <inderpal.singh@linaro.org>
Cc: linux-pm@lists.linux-foundation.org, patches@linaro.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

amit kachhap wrote:
> 
> On Tue, Jan 8, 2013 at 2:50 AM, Inderpal Singh
> <inderpal.singh@linaro.org> wrote:
> > Add freq_attr attribute to show list of available frequencies.
> >
> > Signed-off-by: Donggeun Kim <dg77.kim@samsung.com>
> > Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> > Signed-off-by: KyungMin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> > ---
> >  drivers/cpufreq/exynos-cpufreq.c |   13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-
> cpufreq.c
> > index 7012ea8..bc1e833 100644
> > --- a/drivers/cpufreq/exynos-cpufreq.c
> > +++ b/drivers/cpufreq/exynos-cpufreq.c
> > @@ -244,13 +244,26 @@ static int exynos_cpufreq_cpu_init(struct
> cpufreq_policy *policy)
> >         return cpufreq_frequency_table_cpuinfo(policy, exynos_info-
> >freq_table);
> >  }
> >
> > +static int exynos_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> > +{
> > +       cpufreq_frequency_table_put_attr(policy->cpu);
> > +       return 0;
> > +}
> > +
> > +static struct freq_attr *exynos_cpufreq_attr[] = {
> > +       &cpufreq_freq_attr_scaling_available_freqs,
> > +       NULL,
> > +};
> > +
> 
> This change looks fine. I guess this was posted before also but could
> not go mainline.
> Reviewed-by: Amit Daniel Kachhap<amit.daniel@samsung.com>
> 
Looks OK to me, applied.

Thanks.

- Kukjin

