From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C24XX: Fix interrupt pending register offset of the EINT controller
Date: Mon, 8 Apr 2013 22:25:43 +0200
Message-ID: <201304082225.43967.heiko@sntech.de>
References: <1365450787-14473-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:52275 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935708Ab3DHUZt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 16:25:49 -0400
In-Reply-To: <1365450787-14473-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Am Montag, 8. April 2013, 21:53:07 schrieb Sylwester Nawrocki:
> The external pending interrupt register address (EINTPEND) offset is
> 0xa8, not 0x08. Without this patch the external interrupts are not
> properly acknowledged, which may lead to an interrupt storm and the
> system hang as soon as any external interrupt is requested.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
yep, I unintentionally introduced a typo there and the register really is 
0xa8, so thanks (again) for the fix

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
 

> ---
> 
> This patch is for _3.9_. I'm going to send a similar patch for 3.10-rc2
> for drivers/irqchip/irq-s3c24xx.c.
> ---
>  arch/arm/mach-s3c24xx/irq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/irq.c b/arch/arm/mach-s3c24xx/irq.c
> index cb9f5e0..d8ba9be 100644
> --- a/arch/arm/mach-s3c24xx/irq.c
> +++ b/arch/arm/mach-s3c24xx/irq.c
> @@ -500,7 +500,7 @@ struct s3c_irq_intc *s3c24xx_init_intc(struct
> device_node *np, base = (void *)0xfd000000;
> 
>  		intc->reg_mask = base + 0xa4;
> -		intc->reg_pending = base + 0x08;
> +		intc->reg_pending = base + 0xa8;
>  		irq_num = 20;
>  		irq_start = S3C2410_IRQ(32);
>  		irq_offset = 4;
> --
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
