Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2D2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 19:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 680876109E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 19:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhJNTiU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 15:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhJNTiU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:38:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBC0C061570
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:36:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z20so28730656edc.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dIQWIEZ49azUUbEy/GpUFOPwbZoaapNSKaUu38nOXPw=;
        b=NwMJc5gTcoqjrSv8zyRSRN0wkbTBYNbZFEfXsBXip9Jv1DKu5Ur7B/lsPTNLADuzIW
         ejrtuUazFJsBzA2gg4rYmRMol0js0xNT116ceA6tfO8+c/jTgzkuqUcxFlLqR8mqQi2E
         7h3EejTa5FNxtdBfA8jJa3008s2VEsI/FU/eUMB3Qu8H7iRUZxQadYowlEBepxKVLSfT
         T339dlUWJ5FW0/4JkMR5yQKqQKRHJnfSR2w9fFxYjYkg2YNJPj6dlrr0ZQ0OxsvzRDW7
         VBvZnw59/AWBTvTNoBGyiT2gT93ttikz3Flk6IKmRH7Ozd84dDA/8FWbIS+HyDEhDhFQ
         uQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dIQWIEZ49azUUbEy/GpUFOPwbZoaapNSKaUu38nOXPw=;
        b=RrK6zFDBPRgELuTJrPDJ1/w17zYFzY38TefreAZyyM1LBrUYRk/UGl7u8hX/+Drg4d
         lwLt3aqZ47dpLiWzYYQvms2P3JpO0flxc3p9WEHIWELq6EIPQvJJYIqDDLaD/J2DpwL/
         gOp5IlfM6+7sbJOgZhDgjVhPay3rmlHTr7m8ZE6854JxqVNJJ1V6sU70ehN0ZfVcTffV
         tw4RyqUo3ZvUJO4BrjBletX+Vi6Yht8cZa5WX8h9nz1+HBcuoS9tb1bps6oY/pESXaLK
         YCtP796miWGZhPEgtzujn755tjZNkpiQKH2vgMrNtf2x5DDBUBp/kg+1xhNqEP8AlVk+
         HMuQ==
X-Gm-Message-State: AOAM5316tXgDIYzB2qetQNGzj0iSYDkDAtIzrzkus7wEaOFPGvxpnSRo
        hiyZnY6+jl4FqlxTlwxn5NEmOfHMR+mxGp1JNjXApA==
X-Google-Smtp-Source: ABdhPJw42VaZ1z4gK1xzeif6WMVK4lY7WhKn6398EaTPxMrm9/94ufHU+6t20eQuTRecaH1cR692bJBAMjGYgbnqhKM=
X-Received: by 2002:a05:6402:5190:: with SMTP id q16mr11329786edd.228.1634240173167;
 Thu, 14 Oct 2021 12:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211013221021.3433704-1-willmcvicker@google.com>
 <20211013221021.3433704-2-willmcvicker@google.com> <163417617897.936110.4798836682696423903@swboyd.mtv.corp.google.com>
In-Reply-To: <163417617897.936110.4798836682696423903@swboyd.mtv.corp.google.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 14 Oct 2021 12:35:57 -0700
Message-ID: <CABYd82a7G7jAOMr=yjpkG6sbH+g0-r36NKSBwVEDZeEthuTTLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] [RFT] clk: samsung: add support for CPU clocks
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 13, 2021 at 6:49 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Will McVicker (2021-10-13 15:10:19)
> > diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> > index 00ef4d1b0888..b5017934fc41 100644
> > --- a/drivers/clk/samsung/clk-cpu.c
> > +++ b/drivers/clk/samsung/clk-cpu.c
> > @@ -469,3 +469,29 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
> >         kfree(cpuclk);
> >         return ret;
> >  }
> > +
> > +void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> > +               const struct samsung_cpu_clock *list, unsigned int nr_clk)
> > +{
> > +       unsigned int idx;
> > +       unsigned int num_cfgs;
> > +       struct clk *parent_clk, *alt_parent_clk;
> > +       const struct clk_hw *parent_clk_hw = NULL;
> > +       const struct clk_hw *alt_parent_clk_hw = NULL;
> > +
> > +       for (idx = 0; idx < nr_clk; idx++, list++) {
> > +               /* find count of configuration rates in cfg */
> > +               for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
> > +                       num_cfgs++;
> > +
> > +               parent_clk = __clk_lookup(list->parent_name);
>
> Please stop using __clk_lookup()

Thanks, I believe I have a way around this. I'll fix this up in the
follow-up version.

>
> > +               if (parent_clk)
> > +                       parent_clk_hw = __clk_get_hw(parent_clk);
> > +               alt_parent_clk = __clk_lookup(list->alt_parent_name);
>
> Can the DT binding be updated?

Are you referring to removing alt_parent and just adding it as another
parent clock?

>
> > +               if (alt_parent_clk)
> > +                       alt_parent_clk_hw = __clk_get_hw(alt_parent_clk);
> > +
> > +               exynos_register_cpu_clock(ctx, list->id, list->name, parent_clk_hw,
> > +                               alt_parent_clk_hw, list->offset, list->cfg, num_cfgs, list->flags);
> > +       }
> > +}
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index 1949ae7851b2..336243c6f120 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -378,6 +378,8 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
> >                 samsung_clk_extended_sleep_init(reg_base,
> >                         cmu->clk_regs, cmu->nr_clk_regs,
> >                         cmu->suspend_regs, cmu->nr_suspend_regs);
> > +       if (cmu->cpu_clks)
> > +               samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> >
> >         samsung_clk_of_add_provider(np, ctx);
> >
> > diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> > index c1e1a6b2f499..a52a38cc1740 100644
> > --- a/drivers/clk/samsung/clk.h
> > +++ b/drivers/clk/samsung/clk.h
> > @@ -271,6 +271,27 @@ struct samsung_pll_clock {
> >         __PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,    \
> >               _con, _rtable)
> >
> > +struct samsung_cpu_clock {
> > +       unsigned int            id;
> > +       const char              *name;
> > +       const char              *parent_name;
> > +       const char              *alt_parent_name;
> > +       unsigned long           flags;
> > +       int                     offset;
> > +       const struct exynos_cpuclk_cfg_data *cfg;
> > +};
> > +
> > +#define CPU_CLK(_id, _name, _pname, _apname, _flags, _offset, _cfg) \
> > +       {                                                           \
> > +               .id               = _id,                            \
> > +               .name             = _name,                          \
> > +               .parent_name      = _pname,                         \
> > +               .alt_parent_name  = _apname,                        \
> > +               .flags            = _flags,                         \
> > +               .offset           = _offset,                        \
> > +               .cfg              = _cfg,                           \
> > +       }
> > +
> >  struct samsung_clock_reg_cache {
> >         struct list_head node;
> >         void __iomem *reg_base;
> > @@ -301,6 +322,9 @@ struct samsung_cmu_info {
> >         unsigned int nr_fixed_factor_clks;
> >         /* total number of clocks with IDs assigned*/
> >         unsigned int nr_clk_ids;
> > +       /* list of cpu clocks and respective count */
> > +       const struct samsung_cpu_clock *cpu_clks;
> > +       unsigned int nr_cpu_clks;
> >
> >         /* list and number of clocks registers */
> >         const unsigned long *clk_regs;
> > @@ -350,6 +374,8 @@ extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
> >  extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
> >                         const struct samsung_pll_clock *pll_list,
> >                         unsigned int nr_clk, void __iomem *base);
> > +extern void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
>
> __init in header files is useless.

Thanks for pointing that out. Looks like this header needs some cleaning up.

>
> > +               const struct samsung_cpu_clock *list, unsigned int nr_clk);
> >
