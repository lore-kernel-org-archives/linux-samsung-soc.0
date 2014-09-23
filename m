From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] pinctrl: exynos: Add irq_chip instance for Exynos7
 wakeup interrupts
Date: Tue, 23 Sep 2014 16:49:38 +0200
Message-ID: <54218882.1050401@gmail.com>
References: <1411460169-30536-1-git-send-email-a.kesavan@samsung.com> <1411460169-30536-3-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411460169-30536-3-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 23.09.2014 10:16, Abhilash Kesavan wrote:
[snip]
> @@ -383,9 +377,11 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
>  /*
>   * irq_chip for wakeup interrupts
>   */
> -static struct exynos_irq_chip exynos_wkup_irq_chip = {
> +static struct exynos_irq_chip *exynos_wkup_irq_chip;
> +
[snip]
> @@ -459,7 +480,7 @@ static void exynos_irq_demux_eint16_31(unsigned int irq, struct irq_desc *desc)
>  static int exynos_wkup_irq_map(struct irq_domain *h, unsigned int virq,
>  					irq_hw_number_t hw)
>  {
> -	irq_set_chip_and_handler(virq, &exynos_wkup_irq_chip.chip,
> +	irq_set_chip_and_handler(virq, &exynos_wkup_irq_chip->chip,
>  					handle_level_irq);
>  	irq_set_chip_data(virq, h->host_data);
>  	set_irq_flags(virq, IRQF_VALID);
> @@ -491,7 +512,12 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  	int idx, irq;
>  
>  	for_each_child_of_node(dev->of_node, np) {
> -		if (of_match_node(exynos_wkup_irq_ids, np)) {
> +		const struct of_device_id *match;
> +
> +		match = of_match_node(exynos_wkup_irq_ids, np);
> +		if (match) {
> +			exynos_wkup_irq_chip = kmemdup(match->data,
> +				sizeof(struct exynos_irq_chip), GFP_KERNEL);

That's not exactly what I had in my mind.

You just changed the code to write to another global variable. This is
not the best practice and might cause hard to track issues in future,
when extending the driver.

>From what I can see, the best solution would be to add .irq_chip field
to samsung_pin_bank struct. Then exynos_wkup_irq_map() could access it
through h->host_data pointer and exynos_irq_demux_eint16_31() could also
retrieve the irq chip through bank struct without the need too add chip
field to exynos_muxed_weint_data struct.

As a side effect, it would be possible to consolidate
exynos_wkup_irqd_ops with exynos_gpio_irqd_ops, which currently only
differ in irq chip passed as argument to irq_set_chip_and_handler() in
.map() callback.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
