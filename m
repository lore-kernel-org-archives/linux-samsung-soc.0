Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F74302158
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643789; cv=none; b=GqWmf8WpCV//lVXXgvVnRa7LljO3mMMwJO/tQXwDrQkWpyUNmaqjRPovmSyZfhCb/wuWxripL2sPvO+WYWEo1pxKhpN4GyIafFaA1i5waoQPXqiUgv0FOaYYsYPZ2QmRL6RnicX9DGT+BtrIuIzZ3w5wzwRbQXPKvAZXP/RM810=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643789; c=relaxed/simple;
	bh=HkkOrb8zFiAeXpBcuxQ6hLlxYIoRX1LmFHb0TEcxYmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCzDpqP7gFks5ocbpw6fvEPjUDAEoQPXzLGpYvcPVpIwSRR2CakO06zLDmHzXcGY3NZ3rcCjTUim1Ytw6GwYIpw/jD5Z/EvejVeMmOCrQeffDOkw7DMjubRg8O4TbqoPTuG+iABGyaxTQhl4ZbzychJQUd1ut0TuIFoGWBnUaMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=msMMvYaU; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="msMMvYaU"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c3e2221217so3149572a34.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2025 02:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761643785; x=1762248585; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sK57p6KbHUXe4KkeLJ0RQ/52pmzu5AO7OLWwY8T4dwU=;
        b=msMMvYaUULAZiXqWQZTMfqVuoueh9pCxKYR7aez2rkL/mUR9hLV0PPRvlq7cUqpwE8
         y7jvJAaH5/YemAnYMRwOJv1X99fvcqTtnn1Do/Ai0awk5W8D0Ut77uXlff70fJ0eYGk7
         zJMzP0A0z5t7txCTlApiuFhq82NKWlFVwZi5Ln67z80edzO/MRCVWt8i7yKH8CayAuk+
         /GIcbsG/j3HeIyCJa3hZGWWHeTq539wxwleLzsCyn3+pmuHllnek1AbUJZ3h5WNUUFaK
         3T/sBeLoWcu+OGg4aZtX+Z99ID3wLLnXJfpvfaBjyECqq0Ciebt7UB7AkGhcwA0bTaI2
         vQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643785; x=1762248585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK57p6KbHUXe4KkeLJ0RQ/52pmzu5AO7OLWwY8T4dwU=;
        b=q9DzjZylYVK3fmbIQJ5+l1gknIxQsqk+3TkwYVvGBLcewxvOw2SDAWfYRv3p88R5f8
         /6+Oume7gK8fuVF/xJy3Fj0+hyeMkjUPVIByMvNUJIZz7jqdUAgIUEPxs015Qk7/mZHc
         8Ge/XKukcYWoCK7uwaP1fN05U7M76NQTcLiQCyayoToBGWeUN+YF68R3lY6i6/PAxAER
         Vn7fpTw8tP1VpP0BbpzwVWaPCY3TaBJhNZEekb3ngfeyRnUEV9Ek2LMp7u1LwmPFZ60F
         iaNovTps4QvtzSGsApVOjF+HZEqy3baEnXNXrruC4QXIl62BnyHCj5Px15s4M3dOK1GL
         v1DA==
X-Forwarded-Encrypted: i=1; AJvYcCXArgIcZFzqfvt4P/iNLTMcAWJ3yfaM0G+YNT/TRpvCuKtyHKh2LORhgbZkiGkGYE7FuJnasWwsWqMMmAtN0CoItA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJ2JH9XWFSbEz6+Cs6JiVBvTRlPAW++fpKatKNZfDMu3zeOrZ
	cCOi10X8MY9TpliT2mDDc9PQkicTXMFnqyT5GPfn/ke326aBAj2R60045nTsOSbmnXhYj+D+bQi
	+fHhW2U567vtu4raherAbiHDaiDxjIi4mFiSj6MRYlA==
X-Gm-Gg: ASbGnctTFnG/5hQQIO6YImw1ilH3MreY10zF6PrsbVYBUfuiujm41b/xwCsXn6PNOR3
	s1nKWD7b4IjlkPA6PEKKH2vi2XUvgZq9qkz4SZNta6JRD7r2PQhPvRBlrYF6Wp/GeY3lqR7y7f+
	DPofmn3zGtmXi3vkDuJKyDoOY1Km5xPwo2jVslmacs/ReQ7UWHXOymriGde26DcqUS/+8906pYf
	QY26ros8FpX7zxSuIixzM6mC7vLaZhwnMFGOOU/rOlbWNU9DPwnAK5wiD7WLA==
X-Google-Smtp-Source: AGHT+IE1gkkMJpeTdzbXIvpbxpilEO6S9t7FL0EeiCn8ghufAQF2agJIi6G1CSuV5avrYTTw6qaQsxqTm1UDVTBC4fk=
X-Received: by 2002:a05:6808:50a9:b0:43f:7dee:4693 with SMTP id
 5614622812f47-44f6b9ab81emr1251419b6e.14.1761643785051; Tue, 28 Oct 2025
 02:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org> <5ac782db-fda2-4c31-960c-20269cb40d1d@kernel.org>
In-Reply-To: <5ac782db-fda2-4c31-960c-20269cb40d1d@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 28 Oct 2025 09:29:34 +0000
X-Gm-Features: AWmQ_blN9jlvv15erl1p_Xix2ddOVkJn4wjuXoTixjkRRn1Iku9lQpHMXMNx69k
Message-ID: <CADrjBPrU_Ts8iiOrLd+Z3dudHnAmNP1bP=ryrXBViLvuuN-8GA@mail.gmail.com>
Subject: Re: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode
 for CMUs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review feedback!

On Tue, 21 Oct 2025 at 20:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/10/2025 22:51, Peter Griffin wrote:
> > Update exynos_arm64_init_clocks() so that it enables the automatic clock
> > mode bits in the CMU option register if the auto_clock_gate flag and
> > option_offset fields are set for the CMU.
> >
> > The CMU option register bits are global and effect every clock component in
> > the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANUAL
> > bit on every gate register is only required if auto_clock_gate is false.
> >
> > Additionally if auto_clock_gate is enabled the dynamic root clock gating
> > and memclk registers will be configured in the corresponding CMUs sysreg
> > bank. These registers are exposed via syscon, so the register
> > suspend/resume paths are updated to handle using a regmap.
> >
> > As many gates for various Samsung SoCs are already exposed in the Samsung
> > clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
> > some CMU debug registers to report whether clocks are enabled or disabled
> > when operating in automatic mode. This allows
> > /sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
> > correctly report the status of each clock in the system.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-exynos-arm64.c   |  47 +++++++--
> >  drivers/clk/samsung/clk-exynos4.c        |   6 +-
> >  drivers/clk/samsung/clk-exynos4412-isp.c |   4 +-
> >  drivers/clk/samsung/clk-exynos5250.c     |   2 +-
> >  drivers/clk/samsung/clk-exynos5420.c     |   4 +-
> >  drivers/clk/samsung/clk.c                | 161 ++++++++++++++++++++++++++++---
> >  drivers/clk/samsung/clk.h                |  49 +++++++++-
> >  7 files changed, 244 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> > index bf7de21f329ec89069dcf817ca578fcf9b2d9809..c302c836e8f9f6270753d86d7d986c88e6762f4f 100644
> > --- a/drivers/clk/samsung/clk-exynos-arm64.c
> > +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> > @@ -24,6 +24,16 @@
> >  #define GATE_MANUAL          BIT(20)
> >  #define GATE_ENABLE_HWACG    BIT(28)
> >
> > +/* Option register bits */
> > +#define OPT_EN_DBG                   BIT(31)
> > +#define OPT_UNKNOWN                  BIT(30)
> > +#define OPT_EN_PWR_MANAGEMENT                BIT(29)
> > +#define OPT_EN_AUTO_GATING           BIT(28)
> > +#define OPT_EN_MEM_PM_GATING         BIT(24)
>
> Please reverse, from lowest to highest number (LSB -> MSB).
>

Will fix

> > +
> > +#define CMU_OPT_GLOBAL_EN_AUTO_GATING        (OPT_EN_DBG | OPT_UNKNOWN | \
> > +     OPT_EN_PWR_MANAGEMENT | OPT_EN_AUTO_GATING | OPT_EN_MEM_PM_GATING)
> > +
> >  /* PLL_CONx_PLL register offsets range */
> >  #define PLL_CON_OFF_START    0x100
> >  #define PLL_CON_OFF_END              0x600
> > @@ -37,6 +47,8 @@ struct exynos_arm64_cmu_data {
> >       unsigned int nr_clk_save;
> >       const struct samsung_clk_reg_dump *clk_suspend;
> >       unsigned int nr_clk_suspend;
> > +     struct samsung_clk_reg_dump *clk_sysreg_save;
> > +     unsigned int nr_clk_sysreg;
> >
> >       struct clk *clk;
> >       struct clk **pclks;
> > @@ -82,13 +94,28 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
> >       if (!reg_base)
> >               panic("%s: failed to map registers\n", __func__);
> >
> > +     if (cmu->auto_clock_gate && cmu->option_offset) {
> > +             /*
> > +              * Enable the global automatic mode for the entire CMU.
> > +              * This overrides the individual HWACG bits in each of the
> > +              * individual gate, mux and qch registers.
> > +              */
> > +             writel(CMU_OPT_GLOBAL_EN_AUTO_GATING,
> > +                    reg_base + cmu->option_offset);
> > +     }
> > +
> >       for (i = 0; i < reg_offs_len; ++i) {
> >               void __iomem *reg = reg_base + reg_offs[i];
> >               u32 val;
> >
> >               if (cmu->manual_plls && is_pll_con1_reg(reg_offs[i])) {
> >                       writel(PLL_CON1_MANUAL, reg);
> > -             } else if (is_gate_reg(reg_offs[i])) {
> > +             } else if (is_gate_reg(reg_offs[i]) && !cmu->auto_clock_gate) {
> > +                     /*
> > +                      * Setting GATE_MANUAL bit (which is described in TRM as
> > +                      * reserved!) overrides the global CMU automatic mode
> > +                      * option.
> > +                      */
> >                       val = readl(reg);
> >                       val |= GATE_MANUAL;
> >                       val &= ~GATE_ENABLE_HWACG;
> > @@ -219,7 +246,7 @@ void __init exynos_arm64_register_cmu(struct device *dev,
> >   * Return: 0 on success, or negative error code on error.
> >   */
> >  int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
> > -                                     bool set_manual)
> > +                                     bool init_clk_regs)
> >  {
> >       const struct samsung_cmu_info *cmu;
> >       struct device *dev = &pdev->dev;
> > @@ -249,7 +276,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
> >               dev_err(dev, "%s: could not enable bus clock %s; err = %d\n",
> >                      __func__, cmu->clk_name, ret);
> >
> > -     if (set_manual)
> > +     if (init_clk_regs)
> >               exynos_arm64_init_clocks(np, cmu);
> >
> >       reg_base = devm_platform_ioremap_resource(pdev, 0);
> > @@ -280,14 +307,18 @@ int exynos_arm64_cmu_suspend(struct device *dev)
> >       struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
> >       int i;
> >
> > -     samsung_clk_save(data->ctx->reg_base, data->clk_save,
> > +     samsung_clk_save(data->ctx->reg_base, NULL, data->clk_save,
> >                        data->nr_clk_save);
> >
> > +     if (data->ctx->sysreg)
>
> No need for if() here and in samsung_clk_save.

Will fix.

>
> I find it confusing. You do samsung_clk_save() for regular CMU MMIO
> address and then immediately - for GS101 - do the same for sysreg:
>
> > +             samsung_clk_save(NULL, data->ctx->sysreg, data->clk_save,
> > +                              data->nr_clk_save);
>
> So this feels like you could make one call of samsung_clk_save() with
> both arguments - reg_base and sysreg. It also leads to confusion - first
> read from MMIO will be overwritten by sysreg read.

Apologies for the confusion, that was a typo/bug in v1 it should have
read like this:

samsung_clk_save(data->ctx->reg_base, NULL, data->clk_save,
data->nr_clk_save);

samsung_clk_save(NULL, data->ctx->sysreg, data->clk_sysreg_save,
data->nr_clk_sysreg);

First it saves the CMU MMIO regs, then the second call saves the
sysreg registers (drcg & memclk).

>
>
> > +
> >       for (i = 0; i < data->nr_pclks; i++)
> >               clk_prepare_enable(data->pclks[i]);
> >
> >       /* For suspend some registers have to be set to certain values */
> > -     samsung_clk_restore(data->ctx->reg_base, data->clk_suspend,
> > +     samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_suspend,
> >                           data->nr_clk_suspend);
> >
> >       for (i = 0; i < data->nr_pclks; i++)
> > @@ -308,9 +339,13 @@ int exynos_arm64_cmu_resume(struct device *dev)
> >       for (i = 0; i < data->nr_pclks; i++)
> >               clk_prepare_enable(data->pclks[i]);
> >
> > -     samsung_clk_restore(data->ctx->reg_base, data->clk_save,
> > +     samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_save,
> >                           data->nr_clk_save);
> >
> > +     if (data->ctx->sysreg)
> > +             samsung_clk_restore(NULL, data->ctx->sysreg, data->clk_save,
> > +                                 data->nr_clk_save);
> > +
> >       for (i = 0; i < data->nr_pclks; i++)
> >               clk_disable_unprepare(data->pclks[i]);
> >
> > diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> > index cc5c1644c41c08b27bc48d809a08cd8a006cbe8f..26ac9734722d1e7ed8ec3f1c0a956f26e32b92d4 100644
> > --- a/drivers/clk/samsung/clk-exynos4.c
> > +++ b/drivers/clk/samsung/clk-exynos4.c
> > @@ -1378,15 +1378,15 @@ static void __init exynos4_clk_init(struct device_node *np,
> >       if (soc == EXYNOS4212 || soc == EXYNOS4412)
> >               exynos4x12_core_down_clock();
> >
> > -     samsung_clk_extended_sleep_init(reg_base,
> > +     samsung_clk_extended_sleep_init(reg_base, NULL,
> >                       exynos4_clk_regs, ARRAY_SIZE(exynos4_clk_regs),
> >                       src_mask_suspend, ARRAY_SIZE(src_mask_suspend));
> >       if (exynos4_soc == EXYNOS4210)
> > -             samsung_clk_extended_sleep_init(reg_base,
> > +             samsung_clk_extended_sleep_init(reg_base, NULL,
> >                   exynos4210_clk_save, ARRAY_SIZE(exynos4210_clk_save),
> >                   src_mask_suspend_e4210, ARRAY_SIZE(src_mask_suspend_e4210));
> >       else
> > -             samsung_clk_sleep_init(reg_base, exynos4x12_clk_save,
> > +             samsung_clk_sleep_init(reg_base, NULL, exynos4x12_clk_save,
> >                                      ARRAY_SIZE(exynos4x12_clk_save));
> >
> >       samsung_clk_of_add_provider(np, ctx);
> > diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
> > index fa915057e109e0008ebe0b1b5d1652fd5804e82b..772bc18a1e686f23b11bf160b803becff6279637 100644
> > --- a/drivers/clk/samsung/clk-exynos4412-isp.c
> > +++ b/drivers/clk/samsung/clk-exynos4412-isp.c
> > @@ -94,7 +94,7 @@ static int __maybe_unused exynos4x12_isp_clk_suspend(struct device *dev)
> >  {
> >       struct samsung_clk_provider *ctx = dev_get_drvdata(dev);
> >
> > -     samsung_clk_save(ctx->reg_base, exynos4x12_save_isp,
> > +     samsung_clk_save(ctx->reg_base, NULL, exynos4x12_save_isp,
> >                        ARRAY_SIZE(exynos4x12_clk_isp_save));
> >       return 0;
> >  }
> > @@ -103,7 +103,7 @@ static int __maybe_unused exynos4x12_isp_clk_resume(struct device *dev)
> >  {
> >       struct samsung_clk_provider *ctx = dev_get_drvdata(dev);
> >
> > -     samsung_clk_restore(ctx->reg_base, exynos4x12_save_isp,
> > +     samsung_clk_restore(ctx->reg_base, NULL, exynos4x12_save_isp,
> >                           ARRAY_SIZE(exynos4x12_clk_isp_save));
> >       return 0;
> >  }
> > diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> > index e90d3a0848cbc24b2709c10795f6affcda404567..f97f30b29be7317db8186bac39cf52e1893eb106 100644
> > --- a/drivers/clk/samsung/clk-exynos5250.c
> > +++ b/drivers/clk/samsung/clk-exynos5250.c
> > @@ -854,7 +854,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
> >               PWR_CTRL2_CORE2_UP_RATIO | PWR_CTRL2_CORE1_UP_RATIO);
> >       __raw_writel(tmp, reg_base + PWR_CTRL2);
> >
> > -     samsung_clk_sleep_init(reg_base, exynos5250_clk_regs,
> > +     samsung_clk_sleep_init(reg_base, NULL, exynos5250_clk_regs,
> >                              ARRAY_SIZE(exynos5250_clk_regs));
> >       exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5250_subcmus),
> >                            exynos5250_subcmus);
> > diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> > index a9df4e6db82fa7831d4e5c7210b0163d7d301ec1..1982e0751ceec7e57f9e82d96dcbadce1f691092 100644
> > --- a/drivers/clk/samsung/clk-exynos5420.c
> > +++ b/drivers/clk/samsung/clk-exynos5420.c
> > @@ -1649,12 +1649,12 @@ static void __init exynos5x_clk_init(struct device_node *np,
> >                               ARRAY_SIZE(exynos5800_cpu_clks));
> >       }
> >
> > -     samsung_clk_extended_sleep_init(reg_base,
> > +     samsung_clk_extended_sleep_init(reg_base, NULL,
> >               exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
> >               exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));
> >
> >       if (soc == EXYNOS5800) {
> > -             samsung_clk_sleep_init(reg_base, exynos5800_clk_regs,
> > +             samsung_clk_sleep_init(reg_base, NULL, exynos5800_clk_regs,
> >                                      ARRAY_SIZE(exynos5800_clk_regs));
> >
> >               exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5800_subcmus),
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index dbc9925ca8f46e951dfb5d391c0e744ca370abcc..07b2948ae7ea48f126ab420be57d8c2705979464 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -12,8 +12,10 @@
> >  #include <linux/clkdev.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/io.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/of_address.h>
> > +#include <linux/regmap.h>
> >  #include <linux/syscore_ops.h>
> >
> >  #include "clk.h"
> > @@ -21,19 +23,29 @@
> >  static LIST_HEAD(clock_reg_cache_list);
> >
> >  void samsung_clk_save(void __iomem *base,
> > +                                 struct regmap *regmap,
>
> Here it is regmap, in samsung_clk_extended_sleep_init() it is called
> sysreg.

I'll update samsung_clk_sleep_init so it is named regmap to be
consistent with the naming. Currently it is only used with the sysreg
regmap, but I suppose in the future there could be other regmaps we
wish to save/restore.

>This suggests that in some cases this replaces the MMIO - like
> here in samsung_clk_save().

Each CMU has MMIO registers and nearly all of them (so far only
cmu_top I've found doesn't) have a couple of clock related registers
in the correspondingly named sysreg. This patch was updating the
samsung_clk_save/restore functions so that as well as saving the MMIO
registers via base, you can alternatively pass it a regmap (instead of
base) and it will save those registers as well. It was obfuscated
unfortunately due to the copy/paste bug mentioned above in the first
version.

Maybe we should just have separate functions instead of overloading
these samsung_clk_save_regmap() and samsung_clk_restore_regmap()

>
>
> >                                   struct samsung_clk_reg_dump *rd,
> >                                   unsigned int num_regs)
> >  {
> > -     for (; num_regs > 0; --num_regs, ++rd)
> > -             rd->value = readl(base + rd->offset);
> > +     for (; num_regs > 0; --num_regs, ++rd) {
> > +             if (base)
> > +                     rd->value = readl(base + rd->offset);
> > +             if (regmap)
> > +                     regmap_read(regmap, rd->offset, &rd->value);
> > +     }
> >  }
> >
> >  void samsung_clk_restore(void __iomem *base,
> > +                                   struct regmap *regmap,
> >                                     const struct samsung_clk_reg_dump *rd,
> >                                     unsigned int num_regs)
> >  {
> > -     for (; num_regs > 0; --num_regs, ++rd)
> > -             writel(rd->value, base + rd->offset);
> > +     for (; num_regs > 0; --num_regs, ++rd) {
> > +             if (base)
> > +                     writel(rd->value, base + rd->offset);
> > +             if (regmap)
> > +                     regmap_write(regmap, rd->offset, rd->value);
> > +     }
> >  }
> >
> >  struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
> > @@ -227,6 +239,82 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
> >       }
> >  }
> >
> > +#define ACG_MSK GENMASK(6, 4)
> > +#define CLK_IDLE GENMASK(5, 4)
> > +static int samsung_auto_clk_gate_is_en(struct clk_hw *hw)
> > +{
> > +     u32 reg;
> > +     struct clk_gate *gate = to_clk_gate(hw);
> > +
> > +     reg = readl(gate->reg);
> > +     return ((reg & ACG_MSK) == CLK_IDLE) ? 0 : 1;
> > +}
> > +
> > +/* enable and disable are nops in automatic clock mode */
> > +static int samsung_auto_clk_gate_en(struct clk_hw *hw)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void samsung_auto_clk_gate_dis(struct clk_hw *hw)
> > +{
> > +}
> > +
> > +static const struct clk_ops samsung_auto_clk_gate_ops = {
> > +     .enable = samsung_auto_clk_gate_en,
> > +     .disable = samsung_auto_clk_gate_dis,
> > +     .is_enabled = samsung_auto_clk_gate_is_en,
> > +};
> > +
> > +struct clk_hw *samsung_register_auto_gate(struct device *dev,
> > +             struct device_node *np, const char *name,
> > +             const char *parent_name, const struct clk_hw *parent_hw,
> > +             const struct clk_parent_data *parent_data,
> > +             unsigned long flags,
> > +             void __iomem *reg, u8 bit_idx,
> > +             u8 clk_gate_flags, spinlock_t *lock)
> > +{
> > +     struct clk_gate *gate;
> > +     struct clk_hw *hw;
> > +     struct clk_init_data init = {};
> > +     int ret = -EINVAL;
> > +
> > +     /* allocate the gate */
> > +     gate = kzalloc(sizeof(*gate), GFP_KERNEL);
> > +     if (!gate)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     init.name = name;
> > +     init.ops = &samsung_auto_clk_gate_ops;
> > +     init.flags = flags;
> > +     init.parent_names = parent_name ? &parent_name : NULL;
> > +     init.parent_hws = parent_hw ? &parent_hw : NULL;
> > +     init.parent_data = parent_data;
> > +     if (parent_name || parent_hw || parent_data)
> > +             init.num_parents = 1;
> > +     else
> > +             init.num_parents = 0;
> > +
> > +     /* struct clk_gate assignments */
> > +     gate->reg = reg;
> > +     gate->bit_idx = bit_idx;
> > +     gate->flags = clk_gate_flags;
> > +     gate->lock = lock;
> > +     gate->hw.init = &init;
> > +
> > +     hw = &gate->hw;
> > +     if (dev || !np)
> > +             ret = clk_hw_register(dev, hw);
> > +     else if (np)
> > +             ret = of_clk_hw_register(np, hw);
> > +     if (ret) {
> > +             kfree(gate);
> > +             hw = ERR_PTR(ret);
> > +     }
> > +
> > +     return hw;
> > +}
> > +
> >  /* register a list of gate clocks */
> >  void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
> >                               const struct samsung_gate_clock *list,
> > @@ -234,11 +322,21 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
> >  {
> >       struct clk_hw *clk_hw;
> >       unsigned int idx;
> > +     void __iomem *reg_offs;
> >
> >       for (idx = 0; idx < nr_clk; idx++, list++) {
> > -             clk_hw = clk_hw_register_gate(ctx->dev, list->name, list->parent_name,
> > -                             list->flags, ctx->reg_base + list->offset,
> > +             reg_offs = ctx->reg_base + list->offset;
> > +
> > +             if (ctx->auto_clock_gate && ctx->gate_dbg_offset)
> > +                     clk_hw = samsung_register_auto_gate(ctx->dev, NULL,
> > +                             list->name, list->parent_name, NULL, NULL,
> > +                             list->flags, reg_offs + ctx->gate_dbg_offset,
> >                               list->bit_idx, list->gate_flags, &ctx->lock);
> > +             else
> > +                     clk_hw = clk_hw_register_gate(ctx->dev, list->name,
> > +                             list->parent_name, list->flags,
> > +                             ctx->reg_base + list->offset, list->bit_idx,
> > +                             list->gate_flags, &ctx->lock);
> >               if (IS_ERR(clk_hw)) {
> >                       pr_err("%s: failed to register clock %s\n", __func__,
> >                               list->name);
> > @@ -276,10 +374,11 @@ static int samsung_clk_suspend(void)
> >       struct samsung_clock_reg_cache *reg_cache;
> >
> >       list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
> > -             samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
> > -                             reg_cache->rd_num);
> > -             samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
> > -                             reg_cache->rsuspend_num);
> > +             samsung_clk_save(reg_cache->reg_base, reg_cache->sysreg,
> > +                              reg_cache->rdump, reg_cache->rd_num);
> > +             samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
> > +                                 reg_cache->rsuspend,
> > +                                 reg_cache->rsuspend_num);
> >       }
> >       return 0;
> >  }
> > @@ -289,8 +388,8 @@ static void samsung_clk_resume(void)
> >       struct samsung_clock_reg_cache *reg_cache;
> >
> >       list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
> > -             samsung_clk_restore(reg_cache->reg_base, reg_cache->rdump,
> > -                             reg_cache->rd_num);
> > +             samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
> > +                                 reg_cache->rdump, reg_cache->rd_num);
> >  }
> >
> >  static struct syscore_ops samsung_clk_syscore_ops = {
> > @@ -299,6 +398,7 @@ static struct syscore_ops samsung_clk_syscore_ops = {
> >  };
> >
> >  void samsung_clk_extended_sleep_init(void __iomem *reg_base,
> > +                     struct regmap *sysreg,
> >                       const unsigned long *rdump,
> >                       unsigned long nr_rdump,
> >                       const struct samsung_clk_reg_dump *rsuspend,
> > @@ -319,6 +419,7 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
> >               register_syscore_ops(&samsung_clk_syscore_ops);
> >
> >       reg_cache->reg_base = reg_base;
> > +     reg_cache->sysreg = sysreg;
> >       reg_cache->rd_num = nr_rdump;
> >       reg_cache->rsuspend = rsuspend;
> >       reg_cache->rsuspend_num = nr_rsuspend;
> > @@ -334,6 +435,12 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
> >  void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
> >                                       const struct samsung_cmu_info *cmu)
> >  {
> > +     ctx->auto_clock_gate = cmu->auto_clock_gate;
> > +     ctx->gate_dbg_offset = cmu->gate_dbg_offset;
> > +     ctx->option_offset = cmu->option_offset;
> > +     ctx->drcg_offset = cmu->drcg_offset;
> > +     ctx->memclk_offset = cmu->memclk_offset;
> > +
> >       if (cmu->pll_clks)
> >               samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
> >       if (cmu->mux_clks)
> > @@ -353,6 +460,31 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
> >               samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> >  }
> >
> > +/* Enable Dynamic Root Clock Gating of bus components*/
> > +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> > +                                 struct samsung_clk_provider *ctx,
> > +                                 const struct samsung_cmu_info *cmu)
> > +{
> > +     if (ctx && !ctx->auto_clock_gate)
>
> Test for ctx should trigger Smatch warning.

Will remove the ctx test.
>
> > +             return;
> > +
> > +     ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
> > +     if (!IS_ERR_OR_NULL(ctx->sysreg)) {
>
> Can it return NULL? anyway that's very confusing if() - negated OR_NULL.
> Better just
> if (IS_ERR()) {
>         ctx->sysreg = NULL;
>         return;
> }

Will update like you suggest in v2. Thanks for the review feedback.

regards,

Peter
