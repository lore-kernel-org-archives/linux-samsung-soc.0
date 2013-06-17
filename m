From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH Resend] pinctrl: exynos: Fix build breakage
Date: Mon, 17 Jun 2013 13:57:58 +0200
Message-ID: <1992157.1uNu7hFias@amdc1227>
References: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51785 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932610Ab3FQL6H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 07:58:07 -0400
In-reply-to: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Doug Anderson <dianders@chromium.org>

Hi Sachin,

On Monday 17 of June 2013 15:08:12 Sachin Kamat wrote:
> 'exynos_wkup_irq_ack' should be defined ahead of its call.
>=20
> Fixes the following error:
> drivers/pinctrl/pinctrl-exynos.c: In function =E2=80=98exynos_wkup_ir=
q_mask=E2=80=99:
> drivers/pinctrl/pinctrl-exynos.c:299:3: error: implicit declaration o=
f
> function =E2=80=98exynos_wkup_irq_ack=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
>    exynos_wkup_irq_ack(irqd);
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
> Fixed the commit message.
> ---

This patch is incorrect.

Compilation error is caused by merge error of Doug's patch:

pinctrl: exynos: ack level-triggered interrupts before unmasking

hunk of which went to wrong function - mask instead of unmask.

Linus, could you fix it?

Best regards,
Tomasz

>  drivers/pinctrl/pinctrl-exynos.c |   18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-exynos.c
> b/drivers/pinctrl/pinctrl-exynos.c index 8cd5bf5..f9277bc 100644
> --- a/drivers/pinctrl/pinctrl-exynos.c
> +++ b/drivers/pinctrl/pinctrl-exynos.c
> @@ -279,6 +279,15 @@ err_domains:
>  	return ret;
>  }
>=20
> +static void exynos_wkup_irq_ack(struct irq_data *irqd)
> +{
> +	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
> +	struct samsung_pinctrl_drv_data *d =3D b->drvdata;
> +	unsigned long pend =3D d->ctrl->weint_pend + b->eint_offset;
> +
> +	writel(1 << irqd->hwirq, d->virt_base + pend);
> +}
> +
>  static void exynos_wkup_irq_mask(struct irq_data *irqd)
>  {
>  	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
> @@ -307,15 +316,6 @@ static void exynos_wkup_irq_mask(struct irq_data=
 *irqd)
> spin_unlock_irqrestore(&b->slock, flags);
>  }
>=20
> -static void exynos_wkup_irq_ack(struct irq_data *irqd)
> -{
> -	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
> -	struct samsung_pinctrl_drv_data *d =3D b->drvdata;
> -	unsigned long pend =3D d->ctrl->weint_pend + b->eint_offset;
> -
> -	writel(1 << irqd->hwirq, d->virt_base + pend);
> -}
> -
>  static void exynos_wkup_irq_unmask(struct irq_data *irqd)
>  {
>  	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
