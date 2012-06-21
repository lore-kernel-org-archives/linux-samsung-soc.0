From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Remove unusued variable 'running'
Date: Thu, 21 Jun 2012 09:18:11 +0900
Message-ID: <037e01cd4f43$57b6bfd0$07243f70$%kim@samsung.com>
References: <1335564802-31937-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9057 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758647Ab2FUASX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 20:18:23 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5X0094DY65QN60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:18:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5X008MPY6B0E60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:18:11 +0900 (KST)
In-reply-to: <1335564802-31937-1-git-send-email-jhbird.choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jhbird.choi@gmail.com, linux-samsung-soc@vger.kernel.org
Cc: 'Jonghwan Choi' <jhbird.choi@samsung.com>

jhbird.choi@gmail.com wrote:
> 
> From: Jonghwan Choi <jhbird.choi@samsung.com>
> 
> This variable is indeed no longer in use.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  arch/arm/plat-samsung/pwm.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
> index c559d84..d358305 100644
> --- a/arch/arm/plat-samsung/pwm.c
> +++ b/arch/arm/plat-samsung/pwm.c
> @@ -36,7 +36,6 @@ struct pwm_device {
>  	unsigned int		 duty_ns;
> 
>  	unsigned char		 tcon_base;
> -	unsigned char		 running;
>  	unsigned char		 use_count;
>  	unsigned char		 pwm_id;
>  };
> @@ -116,7 +115,6 @@ int pwm_enable(struct pwm_device *pwm)
> 
>  	local_irq_restore(flags);
> 
> -	pwm->running = 1;
>  	return 0;
>  }
> 
> @@ -134,8 +132,6 @@ void pwm_disable(struct pwm_device *pwm)
>  	__raw_writel(tcon, S3C2410_TCON);
> 
>  	local_irq_restore(flags);
> -
> -	pwm->running = 0;
>  }
> 
>  EXPORT_SYMBOL(pwm_disable);
> --
> 1.7.0.4

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
