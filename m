From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 3/6] pinctrl: exynos: Add irq_chip instance for Exynos7
 wakeup interrupts
Date: Tue, 30 Sep 2014 00:46:03 +0200
Message-ID: <5429E12B.5020708@gmail.com>
References: <1411967712-8321-1-git-send-email-a.kesavan@samsung.com> <1411967712-8321-4-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:49238 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753861AbaI2WqH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 18:46:07 -0400
In-Reply-To: <1411967712-8321-4-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org

Hi Abhilash,

Just two minor issues inline. I leave them up to Linus to decide.

Linus, if you don't mind them, feel free to apply this patch with my Ack.

On 29.09.2014 07:15, Abhilash Kesavan wrote:
> Exynos7 uses different offsets for wakeup interrupt configuration registers.
> So a new irq_chip instance for Exynos7 wakeup interrupts is added. The irq_chip
> selection is now based on the wakeup interrupt controller compatible string.

[snip]

> @@ -469,12 +488,18 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  	struct samsung_pin_bank *bank;
>  	struct exynos_weint_data *weint_data;
>  	struct exynos_muxed_weint_data *muxed_data;
> +	struct exynos_irq_chip *exynos_wkup_irq_chip;

Quite an awful name for a local variable. "irq_chip" alone would be enough.

>  	unsigned int muxed_banks = 0;
>  	unsigned int i;
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

sizeof(*exynos_wkup_irq_chip) (or irq_chip considering my comment above)
could be used instead.

Best regards,
Tomasz
