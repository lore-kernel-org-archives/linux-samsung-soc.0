From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [2/3] rtc: rtc-s3c: Add spin_lock_irq in s3c_rtc_setaie
Date: Sat, 2 May 2015 16:00:25 +0200
Message-ID: <20150502140025.GL12076@piout.net>
References: <1289865774-31073-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:32782 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751159AbbEBOA1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 May 2015 10:00:27 -0400
Content-Disposition: inline
In-Reply-To: <1289865774-31073-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Wan ZongShun <mcuos.com@gmail.com>

Hi Kukjin,

On 16/11/2010 at 09:02:53 +0900, Kukjin Kim wrote :
> This patch adds spin_lock_irq() and spin_unlock_irq() during
> alarm interrupt configuration to avoid interrupt missing.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Wan ZongShun <mcuos.com@gmail.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

This patch never made it in the mainline, is it still necessary?

> ---
>  drivers/rtc/rtc-s3c.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index e2636ff..bb88027 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -82,12 +82,14 @@ static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
>  
>  	pr_debug("%s: aie=%d\n", __func__, enabled);
>  
> +	spin_lock_irq(&s3c_rtc_pie_lock);
>  	tmp = readb(s3c_rtc_base + S3C2410_RTCALM) & ~S3C2410_RTCALM_ALMEN;
>  
>  	if (enabled)
>  		tmp |= S3C2410_RTCALM_ALMEN;
>  
>  	writeb(tmp, s3c_rtc_base + S3C2410_RTCALM);
> +	spin_unlock_irq(&s3c_rtc_pie_lock);
>  
>  	return 0;
>  }

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
