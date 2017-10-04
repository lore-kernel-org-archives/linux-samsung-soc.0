From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 9/9] clk: samsung: Remove obsolete clkdev alias support
Date: Thu, 5 Oct 2017 00:39:06 +0900
Message-ID: <CAGTfZH3q9FrsaAM7s+6TRGGgqBStqWB9ktcz3rcL4HMQcXaj9g@mail.gmail.com>
References: <CGME20171003100032eucas1p294307731c3e26a16c2e0fcd52fc2655c@eucas1p2.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-10-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:50311 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752431AbdJDPjr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 11:39:47 -0400
In-Reply-To: <20171003100016.32029-10-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi,

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Remove support for obsolete clkdev alias definition in generic
> helper macros for MUX, DIV, GATE and PLL clocks. clkdev aliases can be
> still created using samsung_clk_register_alias() function if given
> platform still needs them. All current drivers have been converted
> not to use *_A-style macros and checked if there are any clients for
> the PLL clocks, which had aliases created unconditionally.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c |  9 ------
>  drivers/clk/samsung/clk.c     | 33 ++------------------
>  drivers/clk/samsung/clk.h     | 71 ++++++++-----------------------------------
>  3 files changed, 15 insertions(+), 98 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 037c61484098..137882657370 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1397,15 +1397,6 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>         }
>
>         samsung_clk_add_lookup(ctx, &pll->hw, pll_clk->id);
> -
> -       if (!pll_clk->alias)
> -               return;
> -
> -       ret = clk_hw_register_clkdev(&pll->hw, pll_clk->alias,
> -                                    pll_clk->dev_name);
> -       if (ret)
> -               pr_err("%s: failed to register lookup for %s : %d",
> -                       __func__, pll_clk->name, ret);
>  }
>
>  void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 7ce0fa86c5ff..484abc84a352 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -181,7 +181,7 @@ void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
>                                 unsigned int nr_clk)
>  {
>         struct clk_hw *clk_hw;
> -       unsigned int idx, ret;
> +       unsigned int idx;
>
>         for (idx = 0; idx < nr_clk; idx++, list++) {
>                 clk_hw = clk_hw_register_mux(NULL, list->name,
> @@ -195,15 +195,6 @@ void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
>                 }
>
>                 samsung_clk_add_lookup(ctx, clk_hw, list->id);
> -
> -               /* register a clock lookup only if a clock alias is specified */
> -               if (list->alias) {
> -                       ret = clk_hw_register_clkdev(clk_hw, list->alias,
> -                                               list->dev_name);
> -                       if (ret)
> -                               pr_err("%s: failed to register lookup %s\n",
> -                                               __func__, list->alias);
> -               }
>         }
>  }
>
> @@ -213,7 +204,7 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
>                                 unsigned int nr_clk)
>  {
>         struct clk_hw *clk_hw;
> -       unsigned int idx, ret;
> +       unsigned int idx;
>
>         for (idx = 0; idx < nr_clk; idx++, list++) {
>                 if (list->table)
> @@ -234,15 +225,6 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
>                 }
>
>                 samsung_clk_add_lookup(ctx, clk_hw, list->id);
> -
> -               /* register a clock lookup only if a clock alias is specified */
> -               if (list->alias) {
> -                       ret = clk_hw_register_clkdev(clk_hw, list->alias,
> -                                               list->dev_name);
> -                       if (ret)
> -                               pr_err("%s: failed to register lookup %s\n",
> -                                               __func__, list->alias);
> -               }
>         }
>  }
>
> @@ -252,7 +234,7 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
>                                 unsigned int nr_clk)
>  {
>         struct clk_hw *clk_hw;
> -       unsigned int idx, ret;
> +       unsigned int idx;
>
>         for (idx = 0; idx < nr_clk; idx++, list++) {
>                 clk_hw = clk_hw_register_gate(NULL, list->name, list->parent_name,
> @@ -264,15 +246,6 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
>                         continue;
>                 }
>
> -               /* register a clock lookup only if a clock alias is specified */
> -               if (list->alias) {
> -                       ret = clk_hw_register_clkdev(clk_hw, list->alias,
> -                                                       list->dev_name);
> -                       if (ret)
> -                               pr_err("%s: failed to register lookup %s\n",
> -                                       __func__, list->alias);
> -               }
> -
>                 samsung_clk_add_lookup(ctx, clk_hw, list->id);
>         }
>  }
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index d5f0d3f818b6..1cb03b6e2dfd 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -106,7 +106,6 @@ struct samsung_fixed_factor_clock {
>  /**
>   * struct samsung_mux_clock: information about mux clock
>   * @id: platform specific id of the clock.
> - * @dev_name: name of the device to which this clock belongs.
>   * @name: name of this mux clock.
>   * @parent_names: array of pointer to parent clock names.
>   * @num_parents: number of parents listed in @parent_names.
> @@ -115,11 +114,9 @@ struct samsung_fixed_factor_clock {
>   * @shift: starting bit location of the mux control bit-field in @reg.
>   * @width: width of the mux control bit-field in @reg.
>   * @mux_flags: flags for mux-type clock.
> - * @alias: optional clock alias name to be assigned to this clock.
>   */
>  struct samsung_mux_clock {
>         unsigned int            id;
> -       const char              *dev_name;
>         const char              *name;
>         const char              *const *parent_names;
>         u8                      num_parents;
> @@ -128,13 +125,11 @@ struct samsung_mux_clock {
>         u8                      shift;
>         u8                      width;
>         u8                      mux_flags;
> -       const char              *alias;
>  };
>
> -#define __MUX(_id, dname, cname, pnames, o, s, w, f, mf, a)    \
> +#define __MUX(_id, cname, pnames, o, s, w, f, mf)              \
>         {                                                       \
>                 .id             = _id,                          \
> -               .dev_name       = dname,                        \
>                 .name           = cname,                        \
>                 .parent_names   = pnames,                       \
>                 .num_parents    = ARRAY_SIZE(pnames),           \
> @@ -143,36 +138,26 @@ struct samsung_mux_clock {
>                 .shift          = s,                            \
>                 .width          = w,                            \
>                 .mux_flags      = mf,                           \
> -               .alias          = a,                            \
>         }
>
>  #define MUX(_id, cname, pnames, o, s, w)                       \
> -       __MUX(_id, NULL, cname, pnames, o, s, w, 0, 0, NULL)
> -
> -#define MUX_A(_id, cname, pnames, o, s, w, a)                  \
> -       __MUX(_id, NULL, cname, pnames, o, s, w, 0, 0, a)
> +       __MUX(_id, cname, pnames, o, s, w, 0, 0)
>
>  #define MUX_F(_id, cname, pnames, o, s, w, f, mf)              \
> -       __MUX(_id, NULL, cname, pnames, o, s, w, f, mf, NULL)
> -
> -#define MUX_FA(_id, cname, pnames, o, s, w, f, mf, a)          \
> -       __MUX(_id, NULL, cname, pnames, o, s, w, f, mf, a)
> +       __MUX(_id, cname, pnames, o, s, w, f, mf)
>
>  /**
>   * @id: platform specific id of the clock.
>   * struct samsung_div_clock: information about div clock
> - * @dev_name: name of the device to which this clock belongs.
>   * @name: name of this div clock.
>   * @parent_name: name of the parent clock.
>   * @flags: optional flags for basic clock.
>   * @offset: offset of the register for configuring the div.
>   * @shift: starting bit location of the div control bit-field in @reg.
>   * @div_flags: flags for div-type clock.
> - * @alias: optional clock alias name to be assigned to this clock.
>   */
>  struct samsung_div_clock {
>         unsigned int            id;
> -       const char              *dev_name;
>         const char              *name;
>         const char              *parent_name;
>         unsigned long           flags;
> @@ -180,14 +165,12 @@ struct samsung_div_clock {
>         u8                      shift;
>         u8                      width;
>         u8                      div_flags;
> -       const char              *alias;
>         struct clk_div_table    *table;
>  };
>
> -#define __DIV(_id, dname, cname, pname, o, s, w, f, df, a, t)  \
> +#define __DIV(_id, cname, pname, o, s, w, f, df, t)    \
>         {                                                       \
>                 .id             = _id,                          \
> -               .dev_name       = dname,                        \
>                 .name           = cname,                        \
>                 .parent_name    = pname,                        \
>                 .flags          = f,                            \
> @@ -195,70 +178,51 @@ struct samsung_div_clock {
>                 .shift          = s,                            \
>                 .width          = w,                            \
>                 .div_flags      = df,                           \
> -               .alias          = a,                            \
>                 .table          = t,                            \
>         }
>
>  #define DIV(_id, cname, pname, o, s, w)                                \
> -       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, NULL, NULL)
> -
> -#define DIV_A(_id, cname, pname, o, s, w, a)                   \
> -       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, a, NULL)
> +       __DIV(_id, cname, pname, o, s, w, 0, 0, NULL)
>
>  #define DIV_F(_id, cname, pname, o, s, w, f, df)               \
> -       __DIV(_id, NULL, cname, pname, o, s, w, f, df, NULL, NULL)
> +       __DIV(_id, cname, pname, o, s, w, f, df, NULL)
>
>  #define DIV_T(_id, cname, pname, o, s, w, t)                   \
> -       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, NULL, t)
> +       __DIV(_id, cname, pname, o, s, w, 0, 0, t)
>
>  /**
>   * struct samsung_gate_clock: information about gate clock
>   * @id: platform specific id of the clock.
> - * @dev_name: name of the device to which this clock belongs.
>   * @name: name of this gate clock.
>   * @parent_name: name of the parent clock.
>   * @flags: optional flags for basic clock.
>   * @offset: offset of the register for configuring the gate.
>   * @bit_idx: bit index of the gate control bit-field in @reg.
>   * @gate_flags: flags for gate-type clock.
> - * @alias: optional clock alias name to be assigned to this clock.
>   */
>  struct samsung_gate_clock {
>         unsigned int            id;
> -       const char              *dev_name;
>         const char              *name;
>         const char              *parent_name;
>         unsigned long           flags;
>         unsigned long           offset;
>         u8                      bit_idx;
>         u8                      gate_flags;
> -       const char              *alias;
>  };
>
> -#define __GATE(_id, dname, cname, pname, o, b, f, gf, a)       \
> +#define __GATE(_id, cname, pname, o, b, f, gf)                 \
>         {                                                       \
>                 .id             = _id,                          \
> -               .dev_name       = dname,                        \
>                 .name           = cname,                        \
>                 .parent_name    = pname,                        \
>                 .flags          = f,                            \
>                 .offset         = o,                            \
>                 .bit_idx        = b,                            \
>                 .gate_flags     = gf,                           \
> -               .alias          = a,                            \
>         }
>
>  #define GATE(_id, cname, pname, o, b, f, gf)                   \
> -       __GATE(_id, NULL, cname, pname, o, b, f, gf, NULL)
> -
> -#define GATE_A(_id, cname, pname, o, b, f, gf, a)              \
> -       __GATE(_id, NULL, cname, pname, o, b, f, gf, a)
> -
> -#define GATE_D(_id, dname, cname, pname, o, b, f, gf)          \
> -       __GATE(_id, dname, cname, pname, o, b, f, gf, NULL)
> -
> -#define GATE_DA(_id, dname, cname, pname, o, b, f, gf, a)      \
> -       __GATE(_id, dname, cname, pname, o, b, f, gf, a)
> +       __GATE(_id, cname, pname, o, b, f, gf)
>
>  #define PNAME(x) static const char * const x[] __initconst
>
> @@ -275,18 +239,15 @@ struct samsung_clk_reg_dump {
>  /**
>   * struct samsung_pll_clock: information about pll clock
>   * @id: platform specific id of the clock.
> - * @dev_name: name of the device to which this clock belongs.
>   * @name: name of this pll clock.
>   * @parent_name: name of the parent clock.
>   * @flags: optional flags for basic clock.
>   * @con_offset: offset of the register for configuring the PLL.
>   * @lock_offset: offset of the register for locking the PLL.
>   * @type: Type of PLL to be registered.
> - * @alias: optional clock alias name to be assigned to this clock.
>   */
>  struct samsung_pll_clock {
>         unsigned int            id;
> -       const char              *dev_name;
>         const char              *name;
>         const char              *parent_name;
>         unsigned long           flags;
> @@ -294,31 +255,23 @@ struct samsung_pll_clock {
>         int                     lock_offset;
>         enum samsung_pll_type   type;
>         const struct samsung_pll_rate_table *rate_table;
> -       const char              *alias;
>  };
>
> -#define __PLL(_typ, _id, _dname, _name, _pname, _flags, _lock, _con,   \
> -               _rtable, _alias)                                        \
> +#define __PLL(_typ, _id, _name, _pname, _flags, _lock, _con, _rtable)  \
>         {                                                               \
>                 .id             = _id,                                  \
>                 .type           = _typ,                                 \
> -               .dev_name       = _dname,                               \
>                 .name           = _name,                                \
>                 .parent_name    = _pname,                               \
>                 .flags          = _flags,                               \
>                 .con_offset     = _con,                                 \
>                 .lock_offset    = _lock,                                \
>                 .rate_table     = _rtable,                              \
> -               .alias          = _alias,                               \
>         }
>
>  #define PLL(_typ, _id, _name, _pname, _lock, _con, _rtable)    \
> -       __PLL(_typ, _id, NULL, _name, _pname, CLK_GET_RATE_NOCACHE,     \
> -               _lock, _con, _rtable, _name)
> -
> -#define PLL_A(_typ, _id, _name, _pname, _lock, _con, _alias, _rtable) \
> -       __PLL(_typ, _id, NULL, _name, _pname, CLK_GET_RATE_NOCACHE,     \
> -               _lock, _con, _rtable, _alias)
> +       __PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,    \
> +             _con, _rtable)
>
>  struct samsung_clock_reg_cache {
>         struct list_head node;

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
