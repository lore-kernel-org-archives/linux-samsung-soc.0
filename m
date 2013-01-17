From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: S3C24XX: Fix warnings in irq-s3c2416.c
Date: Wed, 16 Jan 2013 16:06:07 -0800
Message-ID: <0c0101cdf446$738f9490$5aaebdb0$@samsung.com>
References: <1357816660-18224-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65039 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754485Ab3AQAG1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jan 2013 19:06:27 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGQ00H28TM6U930@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 09:06:25 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGQ00EBRTMKW7B0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 09:06:25 +0900 (KST)
In-reply-to: <1357816660-18224-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Fixes the following warnings:
> arch/arm/mach-s3c24xx/irq-s3c2416.c:226:17: warning:
> symbol 's3c2416_irq_second' was not declared. Should it be static?
> arch/arm/mach-s3c24xx/irq-s3c2416.c:332:5: warning:
> symbol 's3c2416_irq_suspend' was not declared. Should it be static?
> arch/arm/mach-s3c24xx/irq-s3c2416.c:339:6: warning:
> symbol 's3c2416_irq_resume' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-s3c24xx/irq-s3c2416.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/irq-s3c2416.c b/arch/arm/mach-
> s3c24xx/irq-s3c2416.c
> index ff141b0..f282670 100644
> --- a/arch/arm/mach-s3c24xx/irq-s3c2416.c
> +++ b/arch/arm/mach-s3c24xx/irq-s3c2416.c
> @@ -223,7 +223,7 @@ static void s3c2416_irq_unmask_second(struct
> irq_data *data)
>  	__raw_writel(mask, S3C2416_INTMSK2);
>  }
> 
> -struct irq_chip s3c2416_irq_second = {
> +static struct irq_chip s3c2416_irq_second = {
>  	.irq_ack	= s3c2416_irq_ack_second,
>  	.irq_mask	= s3c2416_irq_mask_second,
>  	.irq_unmask	= s3c2416_irq_unmask_second,
> @@ -329,14 +329,14 @@ static struct sleep_save irq_save[] = {
>  	SAVE_ITEM(S3C2416_INTMSK2),
>  };
> 
> -int s3c2416_irq_suspend(void)
> +static int s3c2416_irq_suspend(void)
>  {
>  	s3c_pm_do_save(irq_save, ARRAY_SIZE(irq_save));
> 
>  	return 0;
>  }
> 
> -void s3c2416_irq_resume(void)
> +static void s3c2416_irq_resume(void)
>  {
>  	s3c_pm_do_restore(irq_save, ARRAY_SIZE(irq_save));
>  }
> --
> 1.7.4.1

Applied, thanks.

- Kukjin
