Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C3280033
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080622; cv=none; b=FRabSn9Gf5QcMk+sj8jrxfc+YGAvaOWF8xfQUi9LdpEdhti0rjfwspMUBJ+0xb/6cMaUeFPmDVAuinMIW9BhheXJ3n/jCVjvI8WGMpXUOixZBqXoJ361tFR+VxAVdYsoaFGnxawlCdDnCithSeehwRea5UQfekYAwvsHdVh7Sfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080622; c=relaxed/simple;
	bh=fsNzpsKif2XiBWrqxMzGb+TCCzigMM4Kzyxjq7uUsEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By+RGMTFICcYMVF1ZhwOjszl8w99PdgnT/9S4Aeex+6P4gIev98aODHNZJfUQtCBLrf/50CVwa9ZsjGobfx8DKso0gCgeWhHbGfipouf/pCrc4I1jTFye32LQomd2P+1AjqD7emoDF8un7pEK6z61t1JSC82g1vj+5/Ys1lulyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lC7NtZwG; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lC7NtZwG"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-651cda151f0so2519850eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761080618; x=1761685418; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMiBejLPKhYPEtqA8D8Oln6QNM1cO/EDknKj+TQbAkw=;
        b=lC7NtZwGod3lqgdTMQkq0Pd/FPzDYv6OQuX36tUrXktms5FdY5oVd1j94iP/1sqSGp
         G5v80beK/8dIzZ1HJsb1howfnJYiMwhg0MbbmDQaHEuNJRVtGVN9BDX9WJrzzpnND4n9
         3nqCX4BdMeWJ9v+7NJ8fkTnTAUNOliNDgCLXEX8jely1G8YJRtAcUydvDAyMPbKUXkpl
         6iw8Z3BM4DK3vsnBR0i8lHcHzzv72MqDInH93NuM8BcmuJl514Z7EHvgLqbefuHSt2BJ
         X/kutIdcHnLb9gVCmbnbnaUFq2cGknUYzjKRDRtnpgChOAbwioDZ2tTO5omUQHFsM0Jk
         Hq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080618; x=1761685418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMiBejLPKhYPEtqA8D8Oln6QNM1cO/EDknKj+TQbAkw=;
        b=KdcZ+8RN6BrAPiJL3hdR1JC/AIf1zVEtWAYvMOElLZilaKY0XNoPOLcE4zh5Ig6suM
         WZzHGyfMT5KkpoMrexoquecIBzQ1wlp9yGfiGfvNyfKhy44c4X+7MgD19YqNOWuzmfwz
         J78G10ulNBE7geWe/s3lor6Wic2l+eu9vIcS+BEXZD1Jk7iTZk8YY5foF+PIpvSiE24x
         8nnodxF41NVR96As3H221bhyzOdO06GYygH98eEyxz/uaW7T2/Ma7+dYyuWkGvxWRlqN
         QsM9B1Jrf/syP564PTHaplRFTDmB8FPb1QImErnDQlo1Zc95EN+u5MyucH3LGlIES/1A
         fRPA==
X-Forwarded-Encrypted: i=1; AJvYcCXnudOARRNydGE13uae+PvlH6yz34kblhTFxNDuvxe39QG4Yg4AzRSWlBXOKJQFzBsSDfQ0PL0HuCq1iZCFCOxvtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsanW3IAMMiEOe8uPijIoXbo9YZUfSzP+i+mQ/Kr6JbSEjVMa
	IpPQ/BVkUDfxQSHZMxIf0rcL683NyE7+fi8/4IRonRST5c/KBxQ7vUT0v//qX8gxRiSnygffsqD
	kR/JZ9VVAu6nh5V3J7L1LsT9jy7PNcpePYpDoDxnNJQ==
X-Gm-Gg: ASbGncupNyKTx+74hlVsP0guxSCy/88GOalAW02nGvuiiHq2mm96wllkUcaeR05zXci
	XoYOFgdiU3rHDA2oSnUdm7DFM2PZs+pkY1iGaH35QL4sqcF/V8WSXRi4PIB1xTM5EsONfQmDbMS
	bGYl7a4jpgssmc6WZcZMUj9vDEgiHZbYCy0zX3H3DfQMzpJuJEkZ51vD1ioVP4ecmS6IbTytdLL
	krH7zTLof5cENakt60lEEpN4hxwyCeAz+9a9KkIf9MpUmrsfezHpCtZy8kNUwbM2waVERpmSpBl
	L9xgeoE=
X-Google-Smtp-Source: AGHT+IGhhxXOWUhypLR513EstnVpxP2n9PBtNjWPgYEhC5md6NPI4NHWrGoHnBDHjXCimVbmmxclmA3LGRFQCjGw+oI=
X-Received: by 2002:a05:6820:201:b0:64e:8106:bb91 with SMTP id
 006d021491bc7-651c7e6c8c2mr7330485eaf.8.1761080617763; Tue, 21 Oct 2025
 14:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-8-72851ee00300@linaro.org> <4383c2fb-5267-4b7b-90e9-6046c2686912@kernel.org>
In-Reply-To: <4383c2fb-5267-4b7b-90e9-6046c2686912@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Oct 2025 22:03:26 +0100
X-Gm-Features: AS18NWDGDGo3ssrAJMIVVsew6HYnxHA2tTZVJevoKlj0HODQs8C9nRRKXRt97mU
Message-ID: <CADrjBPov=7t876dqpTS71j_xNFOrJv7_Ym7abYVLzjypoOYKng@mail.gmail.com>
Subject: Re: [PATCH 8/9] clk: samsung: gs101: Enable auto_clock_gate mode for
 each gs101 CMU
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

Thanks for the review feedback.

On Tue, 21 Oct 2025 at 20:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/10/2025 22:51, Peter Griffin wrote:
> > Enable auto clock mode, and define the additional fields which are used
> > when this mode is enabled.
> >
> > /sys/kernel/debug/clk/clk_summary now reports approximately 308 running
> > clocks and 298 disabled clocks. Prior to this commit 586 clocks were
> > running and 17 disabled. To ensure compatability with older DTs the
>
> Typo

Will fix.

>
> > resource size is checked and an error issued if the DT needs updating.
>
> I fail to see how you keek it compatible. See further.
>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-gs101.c | 80 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> > index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..baf41ae6c9e2480cb83531acf7eae190c6aff819 100644
> > --- a/drivers/clk/samsung/clk-gs101.c
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/platform_device.h>
> >
> >  #include <dt-bindings/clock/google,gs101.h>
> > @@ -17,6 +18,8 @@
> >  #include "clk-exynos-arm64.h"
> >  #include "clk-pll.h"
> >
> > +int check_cmu_res_size(struct device_node *np);
> > +
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> >  #define CLKS_NR_TOP  (CLK_GOUT_CMU_TPU_UART + 1)
> >  #define CLKS_NR_APM  (CLK_APM_PLL_DIV16_APM + 1)
> > @@ -26,6 +29,10 @@
> >  #define CLKS_NR_PERIC0       (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> >  #define CLKS_NR_PERIC1       (CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> >
> > +#define GS101_GATE_DBG_OFFSET 0x4000
> > +#define GS101_DRCG_EN_OFFSET  0x104
> > +#define GS101_MEMCLK_OFFSET   0x108
> > +
> >  /* ---- CMU_TOP ------------------------------------------------------------- */
> >
> >  /* Register Offset definitions for CMU_TOP (0x1e080000) */
> > @@ -1433,6 +1440,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_TOP,
> >       .clk_regs               = cmu_top_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(cmu_top_clk_regs),
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = CMU_CMU_TOP_CONTROLLER_OPTION,
> >  };
> >
> >  static void __init gs101_cmu_top_init(struct device_node *np)
> > @@ -1900,6 +1910,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
> >            CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
> >  };
> >
> > +static const unsigned long dcrg_memclk_sysreg[] __initconst = {
> > +     GS101_DRCG_EN_OFFSET,
> > +     GS101_MEMCLK_OFFSET,
> > +};
> > +
> >  static const struct samsung_cmu_info apm_cmu_info __initconst = {
> >       .mux_clks               = apm_mux_clks,
> >       .nr_mux_clks            = ARRAY_SIZE(apm_mux_clks),
> > @@ -1912,6 +1927,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_APM,
> >       .clk_regs               = apm_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(apm_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> >  /* ---- CMU_HSI0 ------------------------------------------------------------ */
> > @@ -2375,7 +2396,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_HSI0,
> >       .clk_regs               = hsi0_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(hsi0_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> >       .clk_name               = "bus",
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = HSI0_CMU_HSI0_CONTROLLER_OPTION,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> >  /* ---- CMU_HSI2 ------------------------------------------------------------ */
> > @@ -2863,7 +2891,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_HSI2,
> >       .clk_regs               = cmu_hsi2_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(cmu_hsi2_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> >       .clk_name               = "bus",
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = HSI2_CMU_HSI2_CONTROLLER_OPTION,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> >  /* ---- CMU_MISC ------------------------------------------------------------ */
> > @@ -3423,11 +3458,37 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
> >       .nr_clk_ids             = CLKS_NR_MISC,
> >       .clk_regs               = misc_clk_regs,
> >       .nr_clk_regs            = ARRAY_SIZE(misc_clk_regs),
> > +     .sysreg_clk_regs        = dcrg_memclk_sysreg,
> > +     .nr_sysreg_clk_regs     = ARRAY_SIZE(dcrg_memclk_sysreg),
> >       .clk_name               = "bus",
> > +     .auto_clock_gate        = true,
> > +     .gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> > +     .option_offset          = MISC_CMU_MISC_CONTROLLER_OPTION,
> > +     .drcg_offset            = GS101_DRCG_EN_OFFSET,
> > +     .memclk_offset          = GS101_MEMCLK_OFFSET,
> >  };
> >
> > +/* for old DT compatbility with incorrect CMU size*/
> > +int check_cmu_res_size(struct device_node *np)
> > +{
> > +     struct resource res;
> > +     resource_size_t size;
> > +
> > +     if (of_address_to_resource(np, 0, &res))
> > +             return -ENODEV;
> > +
> > +     size = resource_size(&res);
> > +     if (size != 0x10000) {
> > +             pr_warn("%pOF: resource to small. Please update your DT\n", np);
> > +             return -ENODEV;
> > +     }
> > +     return 0;
> > +}
> > +
> >  static void __init gs101_cmu_misc_init(struct device_node *np)
> >  {
> > +     if (check_cmu_res_size(np))
> > +             return;
>
> You will not register CMU on old DTB.

By "compatible" I meant the driver detects an old DTB with an
incorrect reg size and issues an error message on the console to
update your DT (as opposed to crashing trying to access a register
that hasn't been mapped).

Is it enough to re-word the commit message to make it clearer what will happen?

An alternative might be to try registering all the gates in manual
mode, but that seems like it would add more complexity for not much
benefit. It would also require that clk_ignore_unused kernel parameter
to have been passed (as manual clock mode has never worked without it)
and whilst it might boot today I imagine it would bitrot fast as
additional CMUs are added (and thus probably crash in a much more
obscure way).

Peter
