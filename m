From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCHv4 07/13] ARM: s3c64xx: convert to MULTI_IRQ_HANDLER
Date: Wed, 09 Nov 2011 08:50:33 -0600
Message-ID: <4EBA9339.5010407@gmail.com>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com> <1320369010-23428-8-git-send-email-jamie@jamieiles.com> <CAJuYYwRPoFDUhtcVLT_rj4c9whJWVXyQ7tcaK3O_G3X9SYf-cw@mail.gmail.com> <20111109115406.GB4253@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:51262 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab1KIOul (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Nov 2011 09:50:41 -0500
Received: by ggnb2 with SMTP id b2so1785574ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2011 06:50:40 -0800 (PST)
In-Reply-To: <20111109115406.GB4253@totoro>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, viresh.kumar@st.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, rubini@unipv.it, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 11/09/2011 05:54 AM, Jamie Iles wrote:
> On Wed, Nov 09, 2011 at 04:55:06PM +0530, Thomas Abraham wrote:
>> Hi Jamie,
>>
>> On 4 November 2011 06:40, Jamie Iles <jamie@jamieiles.com> wrote:
>>> Now that there is a generic IRQ handler for multiple VIC devices use it
>>> for s3c64xx to help building multi platform kernels.
>>>
>>> Cc: Ben Dooks <ben-linux@fluff.org>
>>> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
>>> ---
>>>  arch/arm/Kconfig                                 |    1 +
>>>  arch/arm/mach-s3c64xx/include/mach/entry-macro.S |    7 ++++---
>>>  arch/arm/mach-s3c64xx/mach-anw6410.c             |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-crag6410.c            |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-hmt.c                 |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-mini6410.c            |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-ncp.c                 |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-real6410.c            |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-smartq5.c             |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-smartq7.c             |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-smdk6400.c            |    2 ++
>>>  arch/arm/mach-s3c64xx/mach-smdk6410.c            |    2 ++
>>>  12 files changed, 25 insertions(+), 3 deletions(-)
>>>
>>
>> I have tested this patch series on smdk6410 board (s3c64xx) using the
>> following repositorty and branch
>>
>> https://github.com/jamieiles/linux-2.6-ji.git  branch: vic-dt
>>
>> There is a crash while booting. Am I using the right tree and branch?
>> The following is the boot log. Is there any other config option to be
>> enabled?
> 
> Hmm, could you please try with the patch below applied?
> 
> Rob, I'm not sure if this is the best fix.  The alternatives I can think 
> of would be to always export irq_domain_simple_ops even if 
> !CONFIG_OF_IRQ but not set .dt_translate or provide a generic 
> irq_domain_null_ops.
> 
> Jamie

There is a simple fix:

@@ -74,7 +76,7 @@ struct irq_domain {
 static inline unsigned int irq_domain_to_irq(struct irq_domain *d,
                                             unsigned long hwirq)
 {
-       if (d->ops->to_irq)
+       if (d->ops && d->ops->to_irq)
                return d->ops->to_irq(d, hwirq);
        if (WARN_ON(hwirq < d->hwirq_base))
                return 0;

I'll prepare a patch and send to tglx.

Rob

> 
> 8<----
> 
> diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
> index 8c5f4b0..9a5fb9e 100644
> --- a/arch/arm/common/vic.c
> +++ b/arch/arm/common/vic.c
> @@ -163,6 +163,10 @@ static int __init vic_pm_init(void)
>  late_initcall(vic_pm_init);
>  #endif /* CONFIG_PM */
>  
> +#ifndef CONFIG_OF_IRQ
> +static const struct irq_domain_ops vic_domain_null_ops;
> +#endif /* !CONFIG_OF_IRQ */
> +
>  /**
>   * vic_register() - Register a VIC.
>   * @base: The base address of the VIC.
> @@ -197,6 +201,8 @@ static void __init vic_register(void __iomem *base, unsigned int irq,
>  #ifdef CONFIG_OF_IRQ
>  	v->domain.of_node = of_node_get(node);
>  	v->domain.ops = &irq_domain_simple_ops;
> +#else /* CONFIG_OF_IRQ */
> +	v->domain.ops = &vic_domain_null_ops;
>  #endif /* CONFIG_OF */
>  	irq_domain_add(&v->domain);
>  }
