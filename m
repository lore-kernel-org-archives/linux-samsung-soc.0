From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 10/16] clk: samsung: pll: Add support for rate
 configuration of PLL45xx
Date: Wed, 21 Aug 2013 17:48:44 +0530
Message-ID: <CAKew6eVFC0kbQtWF+eH+h1deGhZosBD=X3ZgCXE1k4yndGrvLw@mail.gmail.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
	<1377019903-14614-11-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:59441 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861Ab3HUMSp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 08:18:45 -0400
In-Reply-To: <1377019903-14614-11-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Tomasz,

On Tue, Aug 20, 2013 at 11:01 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch implements round_rate and set_rate callbacks of PLL45xx
> driver to allow reconfiguration of PLL at runtime.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 109 +++++++++++++++++++++++++++++++++++++++++-
>  drivers/clk/samsung/clk-pll.h |  10 ++++
>  2 files changed, 118 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index b0398d2..cb971cb 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -10,9 +10,12 @@
>  */
>
>  #include <linux/errno.h>
> +#include <linux/hrtimer.h>
>  #include "clk.h"
>  #include "clk-pll.h"
>
> +#define PLL_TIMEOUT_MS         10
> +
>  struct samsung_clk_pll {
>         struct clk_hw           hw;
>         void __iomem            *lock_reg;
> @@ -272,13 +275,20 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
>  /*
>   * PLL45xx Clock Type
>   */
> +#define PLL4502_LOCK_FACTOR    400
> +#define PLL4508_LOCK_FACTOR    240
>
>  #define PLL45XX_MDIV_MASK      (0x3FF)
>  #define PLL45XX_PDIV_MASK      (0x3F)
>  #define PLL45XX_SDIV_MASK      (0x7)
> +#define PLL45XX_AFC_MASK       (0x1F)
>  #define PLL45XX_MDIV_SHIFT     (16)
>  #define PLL45XX_PDIV_SHIFT     (8)
>  #define PLL45XX_SDIV_SHIFT     (0)
> +#define PLL45XX_AFC_SHIFT      (0)
> +
> +#define PLL45XX_ENABLE         BIT(31)
> +#define PLL45XX_LOCKED         BIT(29)
>
>  static unsigned long samsung_pll45xx_recalc_rate(struct clk_hw *hw,
>                                 unsigned long parent_rate)
> @@ -301,8 +311,100 @@ static unsigned long samsung_pll45xx_recalc_rate(struct clk_hw *hw,
>         return (unsigned long)fvco;
>  }
>
> +static bool samsung_pll45xx_mp_change(u32 pll_con0, u32 pll_con1,
> +                               const struct samsung_pll_rate_table *rate)
> +{
> +       u32 old_mdiv, old_pdiv, old_afc;
> +
> +       old_mdiv = (pll_con0 >> PLL45XX_MDIV_SHIFT) & PLL45XX_MDIV_MASK;
> +       old_pdiv = (pll_con0 >> PLL45XX_PDIV_SHIFT) & PLL45XX_PDIV_MASK;
> +       old_afc = (pll_con1 >> PLL45XX_AFC_SHIFT) & PLL45XX_AFC_MASK;

old_afc doesn't required in this function.

> +
> +       return (old_mdiv != rate->mdiv || old_pdiv != rate->pdiv);
> +}
> +
> +static int samsung_pll45xx_set_rate(struct clk_hw *hw, unsigned long drate,
> +                                       unsigned long prate)
> +{
> +       struct samsung_clk_pll *pll = to_clk_pll(hw);
> +       const struct samsung_pll_rate_table *rate;
> +       u32 con0, con1;
> +       ktime_t start;
> +
> +       /* Get required rate settings from table */
> +       rate = samsung_get_pll_settings(pll, drate);
> +       if (!rate) {
> +               pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
> +                       drate, __clk_get_name(hw->clk));
> +               return -EINVAL;
> +       }
> +
> +       con0 = __raw_readl(pll->con_reg);
> +       con1 = __raw_readl(pll->con_reg + 0x4);
> +
> +       if (!(samsung_pll45xx_mp_change(con0, con1, rate))) {
> +               /* If only s change, change just s value only*/
> +               con0 &= ~(PLL45XX_SDIV_MASK << PLL45XX_SDIV_SHIFT);
> +               con0 |= rate->sdiv << PLL45XX_SDIV_SHIFT;
> +               __raw_writel(con0, pll->con_reg);
> +
> +               return 0;
> +       }
> +
> +       /* Set PLL PMS values. */
> +       con0 &= ~((PLL45XX_MDIV_MASK << PLL45XX_MDIV_SHIFT) |
> +                       (PLL45XX_PDIV_MASK << PLL45XX_PDIV_SHIFT) |
> +                       (PLL45XX_SDIV_MASK << PLL45XX_SDIV_SHIFT));
> +       con0 |= (rate->mdiv << PLL45XX_MDIV_SHIFT) |
> +                       (rate->pdiv << PLL45XX_PDIV_SHIFT) |
> +                       (rate->sdiv << PLL45XX_SDIV_SHIFT);
> +
> +       /* Set PLL AFC value. */
> +       con1 = __raw_readl(pll->con_reg + 0x4);
> +       con1 &= ~(PLL45XX_AFC_MASK << PLL45XX_AFC_SHIFT);
> +       con1 |= (rate->afc << PLL45XX_AFC_SHIFT);
> +

Do we need to take care of AFC_ENB also, if we are using AFC ?

Regards,
Yadwinder
