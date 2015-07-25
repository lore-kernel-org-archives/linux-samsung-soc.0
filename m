From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 06/13] irqchip: kill off set_irq_flags usage
Date: Sat, 25 Jul 2015 15:34:03 +0200
Message-ID: <55B3904B.3050408@free-electrons.com>
References: <1436711211-18223-1-git-send-email-robh@kernel.org> <1436711211-18223-7-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:49954 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754370AbbGYNeI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Jul 2015 09:34:08 -0400
In-Reply-To: <1436711211-18223-7-git-send-email-robh@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Alexander Shiyan <shc_work@mail.ru>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-rpi-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>

Hi Rob,

On 12/07/2015 16:26, Rob Herring wrote:
> set_irq_flags is ARM specific with custom flags which have genirq
> equivalents. Convert drivers to use the genirq interfaces directly, so we
> can kill off set_irq_flags. The translation of flags is as follows:
> 
> IRQF_VALID -> !IRQ_NOREQUEST
> IRQF_PROBE -> !IRQ_NOPROBE
> IRQF_NOAUTOEN -> IRQ_NOAUTOEN
> 
> For IRQs managed by an irqdomain, the irqdomain core code handles clearing
> and setting IRQ_NOREQUEST already, so there is no need to do this in
> .map() functions and we can simply remove the set_irq_flags calls. Some
> users also set IRQ_NOPROBE and this has been maintained although it is not
> clear that is really needed. There appears to be a great deal of blind
> copy and paste of this code.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Alexander Shiyan <shc_work@mail.ru>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> ---
> v2:
> - Fix build error on clps711x
> 
[...]

> diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
> index 0d3b0fe..b8bf8b0 100644
> --- a/drivers/irqchip/irq-armada-370-xp.c
> +++ b/drivers/irqchip/irq-armada-370-xp.c
> @@ -201,7 +201,6 @@ static int armada_370_xp_msi_map(struct irq_domain *domain, unsigned int virq,
>  {
>  	irq_set_chip_and_handler(virq, &armada_370_xp_msi_irq_chip,
>  				 handle_simple_irq);
> -	set_irq_flags(virq, IRQF_VALID);

OK

> 
>  	return 0;
>  }
> @@ -318,7 +317,7 @@ static int armada_370_xp_mpic_irq_map(struct irq_domain *h,
>  		irq_set_chip_and_handler(virq, &armada_370_xp_irq_chip,
>  					handle_level_irq);
>  	}
> -	set_irq_flags(virq, IRQF_VALID | IRQF_PROBE);
> +	irq_set_noprobe(virq);

I think it should be irq_set_probe(virq), I don't see why you inverted the probe flag.


Thanks,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
