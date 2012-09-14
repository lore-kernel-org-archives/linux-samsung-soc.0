From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Use spin_lock_{irqsave,irqrestore} in clk_set_rate
Date: Fri, 14 Sep 2012 10:32:20 +0530
Message-ID: <5052BA5C.2040900@linaro.org>
References: <1346998102-5317-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53744 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab2INFC1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 01:02:27 -0400
Received: by pbbrr13 with SMTP id rr13so5051425pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Sep 2012 22:02:27 -0700 (PDT)
In-Reply-To: <1346998102-5317-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Ping !

On 09/07/2012 11:38 AM, Tushar Behera wrote:
> The spinlock clocks_lock can be held during ISR, hence it is not safe to
> hold that lock with disabling interrupts.
> 
> It fixes following potential deadlock.
> 
> =========================================================
> [ INFO: possible irq lock inversion dependency detected ]
> 3.6.0-rc4+ #2 Not tainted
> ---------------------------------------------------------
> swapper/0/1 just changed the state of lock:
>  (&(&host->lock)->rlock){-.....}, at: [<c027fb0d>] sdhci_irq+0x15/0x564
> but this lock took another, HARDIRQ-unsafe lock in the past:
>  (clocks_lock){+.+...}
> 
> and interrupts could create inverse lock ordering between them.
> 
> other info that might help us debug this:
>  Possible interrupt unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(clocks_lock);
>                                local_irq_disable();
>                                lock(&(&host->lock)->rlock);
>                                lock(clocks_lock);
>   <Interrupt>
>     lock(&(&host->lock)->rlock);
> 
>  *** DEADLOCK ***
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/plat-samsung/clock.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
> index 65c5eca..9b71719 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -144,6 +144,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>  
>  int clk_set_rate(struct clk *clk, unsigned long rate)
>  {
> +	unsigned long flags;
>  	int ret;
>  
>  	if (IS_ERR(clk))
> @@ -159,9 +160,9 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
>  	if (clk->ops == NULL || clk->ops->set_rate == NULL)
>  		return -EINVAL;
>  
> -	spin_lock(&clocks_lock);
> +	spin_lock_irqsave(&clocks_lock, flags);
>  	ret = (clk->ops->set_rate)(clk, rate);
> -	spin_unlock(&clocks_lock);
> +	spin_unlock_irqrestore(&clocks_lock, flags);
>  
>  	return ret;
>  }
> 


-- 
Tushar Behera
