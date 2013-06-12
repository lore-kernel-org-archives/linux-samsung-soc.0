From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: samsung: pll: Add support for PLL6552 and PLL6553
Date: Tue, 11 Jun 2013 19:53:05 -0700
Message-ID: <20130612025305.8816.27929@quantum>
References: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
 <1370476651-6743-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370476651-6743-2-git-send-email-tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Tomasz Figa (2013-06-05 16:57:25)
> This patch adds support for PLL6552 and PLL6553 PLLs present on Samsung
> S3C64xx SoCs.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

or I can take it into clk-next.

> ---
>  drivers/clk/samsung/clk-pll.c | 160 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h |   4 ++
>  2 files changed, 164 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 89135f6..cef0bb9 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -336,6 +336,166 @@ struct clk * __init samsung_clk_register_pll46xx(const char *name,
>  }
>  
>  /*
> + * PLL6552 Clock Type
> + */
> +
> +#define PLL6552_LOCK_REG       0x00
> +#define PLL6552_CON_REG                0x0c
> +
> +#define PLL6552_MDIV_MASK      0x3ff
> +#define PLL6552_PDIV_MASK      0x3f
> +#define PLL6552_SDIV_MASK      0x7
> +#define PLL6552_MDIV_SHIFT     16
> +#define PLL6552_PDIV_SHIFT     8
> +#define PLL6552_SDIV_SHIFT     0
> +
> +struct samsung_clk_pll6552 {
> +       struct clk_hw hw;
> +       void __iomem *reg_base;
> +};
> +
> +#define to_clk_pll6552(_hw) container_of(_hw, struct samsung_clk_pll6552, hw)
> +
> +static unsigned long samsung_pll6552_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct samsung_clk_pll6552 *pll = to_clk_pll6552(hw);
> +       u32 mdiv, pdiv, sdiv, pll_con;
> +       u64 fvco = parent_rate;
> +
> +       pll_con = __raw_readl(pll->reg_base + PLL6552_CON_REG);
> +       mdiv = (pll_con >> PLL6552_MDIV_SHIFT) & PLL6552_MDIV_MASK;
> +       pdiv = (pll_con >> PLL6552_PDIV_SHIFT) & PLL6552_PDIV_MASK;
> +       sdiv = (pll_con >> PLL6552_SDIV_SHIFT) & PLL6552_SDIV_MASK;
> +
> +       fvco *= mdiv;
> +       do_div(fvco, (pdiv << sdiv));
> +
> +       return (unsigned long)fvco;
> +}
> +
> +static const struct clk_ops samsung_pll6552_clk_ops = {
> +       .recalc_rate = samsung_pll6552_recalc_rate,
> +};
> +
> +struct clk * __init samsung_clk_register_pll6552(const char *name,
> +                                       const char *pname, void __iomem *base)
> +{
> +       struct samsung_clk_pll6552 *pll;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +
> +       pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll) {
> +               pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> +               return NULL;
> +       }
> +
> +       init.name = name;
> +       init.ops = &samsung_pll6552_clk_ops;
> +       init.parent_names = &pname;
> +       init.num_parents = 1;
> +
> +       pll->hw.init = &init;
> +       pll->reg_base = base;
> +
> +       clk = clk_register(NULL, &pll->hw);
> +       if (IS_ERR(clk)) {
> +               pr_err("%s: failed to register pll clock %s\n", __func__,
> +                               name);
> +               kfree(pll);
> +       }
> +
> +       if (clk_register_clkdev(clk, name, NULL))
> +               pr_err("%s: failed to register lookup for %s", __func__, name);
> +
> +       return clk;
> +}
> +
> +/*
> + * PLL6553 Clock Type
> + */
> +
> +#define PLL6553_LOCK_REG       0x00
> +#define PLL6553_CON0_REG       0x0c
> +#define PLL6553_CON1_REG       0x10
> +
> +#define PLL6553_MDIV_MASK      0xff
> +#define PLL6553_PDIV_MASK      0x3f
> +#define PLL6553_SDIV_MASK      0x7
> +#define PLL6553_KDIV_MASK      0xffff
> +#define PLL6553_MDIV_SHIFT     16
> +#define PLL6553_PDIV_SHIFT     8
> +#define PLL6553_SDIV_SHIFT     0
> +#define PLL6553_KDIV_SHIFT     0
> +
> +struct samsung_clk_pll6553 {
> +       struct clk_hw hw;
> +       void __iomem *reg_base;
> +};
> +
> +#define to_clk_pll6553(_hw) container_of(_hw, struct samsung_clk_pll6553, hw)
> +
> +static unsigned long samsung_pll6553_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct samsung_clk_pll6553 *pll = to_clk_pll6553(hw);
> +       u32 mdiv, pdiv, sdiv, kdiv, pll_con0, pll_con1;
> +       u64 fvco = parent_rate;
> +
> +       pll_con0 = __raw_readl(pll->reg_base + PLL6553_CON0_REG);
> +       pll_con1 = __raw_readl(pll->reg_base + PLL6553_CON1_REG);
> +       mdiv = (pll_con0 >> PLL6553_MDIV_SHIFT) & PLL6553_MDIV_MASK;
> +       pdiv = (pll_con0 >> PLL6553_PDIV_SHIFT) & PLL6553_PDIV_MASK;
> +       sdiv = (pll_con0 >> PLL6553_SDIV_SHIFT) & PLL6553_SDIV_MASK;
> +       kdiv = (pll_con1 >> PLL6553_KDIV_SHIFT) & PLL6553_KDIV_MASK;
> +
> +       fvco *= (mdiv << 16) + kdiv;
> +       do_div(fvco, (pdiv << sdiv));
> +       fvco >>= 16;
> +
> +       return (unsigned long)fvco;
> +}
> +
> +static const struct clk_ops samsung_pll6553_clk_ops = {
> +       .recalc_rate = samsung_pll6553_recalc_rate,
> +};
> +
> +struct clk * __init samsung_clk_register_pll6553(const char *name,
> +                                       const char *pname, void __iomem *base)
> +{
> +       struct samsung_clk_pll6553 *pll;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +
> +       pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll) {
> +               pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> +               return NULL;
> +       }
> +
> +       init.name = name;
> +       init.ops = &samsung_pll6553_clk_ops;
> +       init.parent_names = &pname;
> +       init.num_parents = 1;
> +
> +       pll->hw.init = &init;
> +       pll->reg_base = base;
> +
> +       clk = clk_register(NULL, &pll->hw);
> +       if (IS_ERR(clk)) {
> +               pr_err("%s: failed to register pll clock %s\n", __func__,
> +                               name);
> +               kfree(pll);
> +       }
> +
> +       if (clk_register_clkdev(clk, name, NULL))
> +               pr_err("%s: failed to register lookup for %s", __func__, name);
> +
> +       return clk;
> +}
> +
> +/*
>   * PLL2550x Clock Type
>   */
>  
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index f33786e..1d68a68 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -34,6 +34,10 @@ extern struct clk * __init samsung_clk_register_pll45xx(const char *name,
>  extern struct clk * __init samsung_clk_register_pll46xx(const char *name,
>                         const char *pname, const void __iomem *con_reg,
>                         enum pll46xx_type type);
> +extern struct clk *samsung_clk_register_pll6552(const char *name,
> +                       const char *pname, void __iomem *base);
> +extern struct clk *samsung_clk_register_pll6553(const char *name,
> +                       const char *pname, void __iomem *base);
>  extern struct clk * __init samsung_clk_register_pll2550x(const char *name,
>                         const char *pname, const void __iomem *reg_base,
>                         const unsigned long offset);
> -- 
> 1.8.2.1
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
