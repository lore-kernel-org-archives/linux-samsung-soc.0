From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] EXYNOS: Initialize locking_frequency with
 initial frequency
Date: Mon, 13 Feb 2012 09:35:55 -0500
Message-ID: <20120213143555.GA1793@redhat.com>
References: <1327466713-29101-1-git-send-email-tushar.behera@linaro.org>
 <4F291D44.4040502@linaro.org>
 <4F334ECA.5000507@linaro.org>
 <4F38DDF0.6030609@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F38DDF0.6030609@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jc.lee@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 13, 2012 at 03:24:56PM +0530, Tushar Behera wrote:

 > >>> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
 > >>> index 5467879..7cfb516 100644
 > >>> --- a/drivers/cpufreq/exynos-cpufreq.c
 > >>> +++ b/drivers/cpufreq/exynos-cpufreq.c
 > >>> @@ -210,6 +210,8 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
 > >>>  
 > >>>  	cpufreq_frequency_table_get_attr(exynos_info->freq_table, policy->cpu);
 > >>>  
 > >>> +	locking_frequency = exynos_getspeed(0);
 > >>> +
 > >>>  	/* set the transition latency value */
 > >>>  	policy->cpuinfo.transition_latency = 100000;
 > 
 > Any concerns with this patch?

it's in my queue for applying to -next. I'll clear everything out today.

	Dave

 
