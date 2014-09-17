From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [RESEND PATCH] arm: exynos: Allow rtc alarm and tick wakeup irq
 for exynos3250.
Date: Wed, 17 Sep 2014 14:38:44 +0545
Message-ID: <CAGm_ybjMaLHPALp519fe=UdMy1DeJbcxUxJN+hcPecttY7A_tQ@mail.gmail.com>
References: <1410923262-4771-1-git-send-email-jonghwa3.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:58169 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905AbaIQIxq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 04:53:46 -0400
In-Reply-To: <1410923262-4771-1-git-send-email-jonghwa3.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwa Lee <jonghwa3.lee@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi,

On Wed, Sep 17, 2014 at 8:52 AM, Jonghwa Lee <jonghwa3.lee@samsung.com> wrote:
> Add rtc alarm and tick irq to wakeup sources in exynos3250.
>
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Acked-by : Chanwoo choi <cw00.choi@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index fa7218a..d78dcf9 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -66,6 +66,12 @@ static struct sleep_save exynos_core_save[] = {
>
>  static u32 exynos_irqwake_intmask = 0xffffffff;
>
> +static const struct exynos_wkup_irq exynos3250_wkup_irq[] = {
> +       { 105, BIT(1) }, /* RTC alarm */
> +       { 106, BIT(2) }, /* RTC tick */
> +       { /* sentinel */ },
> +};
> +
>  static const struct exynos_wkup_irq exynos4_wkup_irq[] = {
>         { 76, BIT(1) }, /* RTC alarm */
>         { 77, BIT(2) }, /* RTC tick */
> @@ -81,9 +87,10 @@ static const struct exynos_wkup_irq exynos5250_wkup_irq[] = {
>  static int exynos_irq_set_wake(struct irq_data *data, unsigned int state)
>  {
>         const struct exynos_wkup_irq *wkup_irq;
> -
>         if (soc_is_exynos5250())
>                 wkup_irq = exynos5250_wkup_irq;
> +       else if (soc_is_exynos3250())
> +               wkup_irq = exynos3250_wkup_irq;


Don't add anymore soc_is_exynosxxx() checks, please rebase on [1],
which refactors the pm.c to use DT based lookup.

[1] http://www.spinics.net/lists/arm-kernel/msg355266.html



>         else
>                 wkup_irq = exynos4_wkup_irq;
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
