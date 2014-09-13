From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: exynos: Add irq_chip instance for Exynos7
 wakeup interrupts
Date: Sat, 13 Sep 2014 13:27:50 +0200
Message-ID: <54142A36.5050703@gmail.com>
References: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com> <1410598252-30931-4-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410598252-30931-4-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Abhilash,

Please see my comments inline.

On 13.09.2014 10:50, Abhilash Kesavan wrote:
> Exynos7 uses different offsets for wakeup interrupt configuration registers.
> So a new irq_chip instance for Exynos7 wakeup interrupts is added. The irq_chip
> selection is now based on the wakeup interrupt controller compatible string.

[snip]

> @@ -328,9 +322,11 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
>  /*
>   * irq_chip for wakeup interrupts
>   */
> -static struct exynos_irq_chip exynos_wkup_irq_chip = {
> +static struct exynos_irq_chip exynos_wkup_irq_chip;
> +

Why do you still need this, if you have both variants below?

> +static struct exynos_irq_chip exynos4210_wkup_irq_chip = {
>  	.chip = {
> -		.name = "exynos_wkup_irq_chip",
> +		.name = "exynos4210_wkup_irq_chip",
>  		.irq_unmask = exynos_irq_unmask,
>  		.irq_mask = exynos_irq_mask,
>  		.irq_ack = exynos_irq_ack,
> @@ -342,6 +338,29 @@ static struct exynos_irq_chip exynos_wkup_irq_chip = {
>  	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
>  };
>  
> +static struct exynos_irq_chip exynos7_wkup_irq_chip = {
> +	.chip = {
> +		.name = "exynos7_wkup_irq_chip",
> +		.irq_unmask = exynos_irq_unmask,
> +		.irq_mask = exynos_irq_mask,
> +		.irq_ack = exynos_irq_ack,
> +		.irq_set_type = exynos_irq_set_type,
> +		.irq_set_wake = exynos_wkup_irq_set_wake,
> +	},
> +	.eint_con = EXYNOS7_WKUP_ECON_OFFSET,
> +	.eint_mask = EXYNOS7_WKUP_EMASK_OFFSET,
> +	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
> +};
> +
> +/* list of external wakeup controllers supported */
> +static const struct of_device_id exynos_wkup_irq_ids[] = {
> +	{ .compatible = "samsung,exynos4210-wakeup-eint",
> +			.data = &exynos4210_wkup_irq_chip },
> +	{ .compatible = "samsung,exynos7-wakeup-eint",
> +			.data = &exynos7_wkup_irq_chip },
> +	{ }
> +};
> +
>  /* interrupt handler for wakeup interrupts 0..15 */
>  static void exynos_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
>  {
> @@ -434,7 +453,12 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  	int idx, irq;
>  
>  	for_each_child_of_node(dev->of_node, np) {
> -		if (of_match_node(exynos_wkup_irq_ids, np)) {
> +		const struct of_device_id *match;
> +
> +		match = of_match_node(exynos_wkup_irq_ids, np);
> +		if (match) {
> +			memcpy(&exynos_wkup_irq_chip, match->data,
> +				sizeof(struct exynos_irq_chip));

Hmm, this doesn't look correct to me. You are modifying a static struct
here. Why couldn't you simply use the exynos irq chip pointed by
match->data in further registration code?

>  			wkup_np = np;
>  			break;
>  		}
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> index e060722..0db1e52 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -25,6 +25,9 @@
>  #define EXYNOS_WKUP_ECON_OFFSET		0xE00
>  #define EXYNOS_WKUP_EMASK_OFFSET	0xF00
>  #define EXYNOS_WKUP_EPEND_OFFSET	0xF40
> +#define EXYNOS7_WKUP_ECON_OFFSET	0x700
> +#define EXYNOS7_WKUP_EMASK_OFFSET	0x900
> +#define EXYNOS7_WKUP_EPEND_OFFSET	0xA00

Interestingly enough, the offsets look just like the normal GPIO
interrupt controller of previous Exynos SoCs. Are you sure those are
correct? Also if somehow the controller now resembles the normal one,
doesn't it have the SVC register making it possible to reuse the non
wake-up code instead?

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
