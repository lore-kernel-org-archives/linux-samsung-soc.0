Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB1FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 01:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9B81611C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 01:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhJNBvo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 21:51:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhJNBvo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 21:51:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44B6B611BD;
        Thu, 14 Oct 2021 01:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634176180;
        bh=Gpv3ryCbvh3SBhygjmVyThiZtHe6Jj3RrBddgBX5+w8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ube5ZXQRlLZCU1G2o/8xD26TuZq/h7IELUmS0lwNKzsppCf8K8WgB8DB8LQUN0ZMp
         gkNNdW4I2vD1jv+GwHuLqON9nUoyhPHxxABaXYDcdIsOBqOtSFQeXDP7zCy6bhPlui
         0cr9Ycm2/a/171HhUCC1n8P+LcAP+r831fvJ/fxusG4eb5RwU6yXyzKrXgywfHLdu1
         wYgMoP4UcK4Yym/UspWyPJPqM50XAbHM+GDOOQ6n9Yzrqq1wpE1ZhODhrAzDXjDhgI
         oCE0mrfv1xaHGSc/kW4fD2rbSPiB0Syb/R6m5/RxDcto44Zs2WQETLuCoDOIndhYgy
         9AxNeagdY9/Zg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211013221021.3433704-2-willmcvicker@google.com>
References: <20211013221021.3433704-1-willmcvicker@google.com> <20211013221021.3433704-2-willmcvicker@google.com>
Subject: Re: [PATCH v3 1/2] [RFT] clk: samsung: add support for CPU clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Will McVicker <willmcvicker@google.com>
Date:   Wed, 13 Oct 2021 18:49:38 -0700
Message-ID: <163417617897.936110.4798836682696423903@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Will McVicker (2021-10-13 15:10:19)
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 00ef4d1b0888..b5017934fc41 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -469,3 +469,29 @@ int __init exynos_register_cpu_clock(struct samsung_=
clk_provider *ctx,
>         kfree(cpuclk);
>         return ret;
>  }
> +
> +void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> +               const struct samsung_cpu_clock *list, unsigned int nr_clk)
> +{
> +       unsigned int idx;
> +       unsigned int num_cfgs;
> +       struct clk *parent_clk, *alt_parent_clk;
> +       const struct clk_hw *parent_clk_hw =3D NULL;
> +       const struct clk_hw *alt_parent_clk_hw =3D NULL;
> +
> +       for (idx =3D 0; idx < nr_clk; idx++, list++) {
> +               /* find count of configuration rates in cfg */
> +               for (num_cfgs =3D 0; list->cfg[num_cfgs].prate !=3D 0; )
> +                       num_cfgs++;
> +
> +               parent_clk =3D __clk_lookup(list->parent_name);

Please stop using __clk_lookup()

> +               if (parent_clk)
> +                       parent_clk_hw =3D __clk_get_hw(parent_clk);
> +               alt_parent_clk =3D __clk_lookup(list->alt_parent_name);

Can the DT binding be updated?

> +               if (alt_parent_clk)
> +                       alt_parent_clk_hw =3D __clk_get_hw(alt_parent_clk=
);
> +
> +               exynos_register_cpu_clock(ctx, list->id, list->name, pare=
nt_clk_hw,
> +                               alt_parent_clk_hw, list->offset, list->cf=
g, num_cfgs, list->flags);
> +       }
> +}
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 1949ae7851b2..336243c6f120 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -378,6 +378,8 @@ struct samsung_clk_provider * __init samsung_cmu_regi=
ster_one(
>                 samsung_clk_extended_sleep_init(reg_base,
>                         cmu->clk_regs, cmu->nr_clk_regs,
>                         cmu->suspend_regs, cmu->nr_suspend_regs);
> +       if (cmu->cpu_clks)
> +               samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_=
clks);
> =20
>         samsung_clk_of_add_provider(np, ctx);
> =20
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index c1e1a6b2f499..a52a38cc1740 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -271,6 +271,27 @@ struct samsung_pll_clock {
>         __PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,    \
>               _con, _rtable)
> =20
> +struct samsung_cpu_clock {
> +       unsigned int            id;
> +       const char              *name;
> +       const char              *parent_name;
> +       const char              *alt_parent_name;
> +       unsigned long           flags;
> +       int                     offset;
> +       const struct exynos_cpuclk_cfg_data *cfg;
> +};
> +
> +#define CPU_CLK(_id, _name, _pname, _apname, _flags, _offset, _cfg) \
> +       {                                                           \
> +               .id               =3D _id,                            \
> +               .name             =3D _name,                          \
> +               .parent_name      =3D _pname,                         \
> +               .alt_parent_name  =3D _apname,                        \
> +               .flags            =3D _flags,                         \
> +               .offset           =3D _offset,                        \
> +               .cfg              =3D _cfg,                           \
> +       }
> +
>  struct samsung_clock_reg_cache {
>         struct list_head node;
>         void __iomem *reg_base;
> @@ -301,6 +322,9 @@ struct samsung_cmu_info {
>         unsigned int nr_fixed_factor_clks;
>         /* total number of clocks with IDs assigned*/
>         unsigned int nr_clk_ids;
> +       /* list of cpu clocks and respective count */
> +       const struct samsung_cpu_clock *cpu_clks;
> +       unsigned int nr_cpu_clks;
> =20
>         /* list and number of clocks registers */
>         const unsigned long *clk_regs;
> @@ -350,6 +374,8 @@ extern void __init samsung_clk_register_gate(struct s=
amsung_clk_provider *ctx,
>  extern void __init samsung_clk_register_pll(struct samsung_clk_provider =
*ctx,
>                         const struct samsung_pll_clock *pll_list,
>                         unsigned int nr_clk, void __iomem *base);
> +extern void __init samsung_clk_register_cpu(struct samsung_clk_provider =
*ctx,

__init in header files is useless.

> +               const struct samsung_cpu_clock *list, unsigned int nr_clk=
);
>
