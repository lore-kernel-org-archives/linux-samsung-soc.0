From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Use spin_lock_{irqsave,irqrestore} in
 clk_set_rate
Date: Mon, 17 Sep 2012 20:25:31 +0900
Message-ID: <051201cd94c7$25ea0970$71be1c50$%kim@samsung.com>
References: <1346998102-5317-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49916 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755837Ab2IQLZe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 07:25:34 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAH00MSKRQK5T80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 20:25:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAH005BJRQKQG30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 20:25:32 +0900 (KST)
In-reply-to: <1346998102-5317-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Tushar Behera wrote:
> 
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
> @@ -144,6 +144,7 @@ long clk_round_rate(struct clk *clk, unsigned long
> rate)
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
> --
> 1.7.4.1

Looks OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
