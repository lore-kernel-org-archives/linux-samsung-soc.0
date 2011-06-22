From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 5/6] S5PV210: Adjust udelay prior to voltage
	scaling down
Date: Wed, 22 Jun 2011 14:42:26 +0100
Message-ID: <20110622134226.GJ23666@sirena.org.uk>
References: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com> <1308730065-24737-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1308730065-24737-6-git-send-email-kgene.kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davej@redhat.com, Todd Poynor <toddpoynor@google.com>, Jonghwan Choi <jhbird.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 22, 2011 at 05:07:44PM +0900, Kukjin Kim wrote:
> From: Todd Poynor <toddpoynor@google.com>
> 
> Voltage scaling accesses the MAX8998 regulators over bit-banged I2C
> with lots of udelays.  In the case of decreasing CPU speed, the
> number of loops per us for udelay needs to be adjusted prior to
> decreasing voltage to avoid delaying for up to 10X too long.

This changelog is very specific to a particular board but actually it's
not at all board specific - we should watch out for this with other
cpufreq drivers as I bet there's more with the same issue.  The S3C64xx
driver is affected for example, I'll send a patch shortly.

> 
> Signed-off-by: Todd Poynor <toddpoynor@google.com>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index e9b9b7f..78c88a0 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -471,6 +471,8 @@ static int s5pv210_target(struct cpufreq_policy *policy,
>  		}
>  	}
>  
> +	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> +
>  	if (freqs.new < freqs.old) {
>  		/* Voltage down: will be implemented */
>  		if (!IS_ERR(arm_regulator) &&
> @@ -483,7 +485,6 @@ static int s5pv210_target(struct cpufreq_policy *policy,
>  		}
>  	}
>  
> -	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
>  
>  	printk(KERN_DEBUG "Perf changed[L%d]\n", index);
>  
> -- 
> 1.7.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."
