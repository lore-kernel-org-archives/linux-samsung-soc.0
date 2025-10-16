Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B13191CE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607644; cv=none; b=QLNnzCDKh3n14haNLr3v88BSNS67eaCOFstB3mwc0WK5riSx7TkFOxCZ73B5sWMXpZRu44xLHJ2VIBRRdkX5Owt3Sehkaj6OHiZjQCGx0Oyfqx2FMjrZdPM+IgiHfwOYmB8jbGOMlcApiBUSmtGozgjRzSrAKaZYbGOdU7W8duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607644; c=relaxed/simple;
	bh=+IA2tvFx5paZqBx4OAyn9CNrv+jLsBpO2Sy7WT7vMSg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCzz6Bnfg2vrCNWaZTwYvpDgX9bye4jNanr99XpDsQl9k0g5eCbj+REWJp57UegheS6jAGhGeBcWQF4BjPcgOHj5bD7C7J8/SK6mBzqBoZ+pWtROb2DdtsQj5qgyGvvQfv8rVB0ZxaAvz6MO8lEvbTf61f9AD6+rdlyO+bwdX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yxylz7GQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yxylz7GQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so90615566b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760607639; x=1761212439; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8tLjP3QUISYumMMgv2clUq/pjNoXb6et4hLSum4orY4=;
        b=yxylz7GQUuZowtSfQi9Z9Yhf4x3dlnNLemVIrRIDo6A5Qws/ZvZR1MEFE23bqKK+Z/
         TxyZbiYw+UzHOETW2OFuLANjEXMslE1noNp4twVEzRjU6TCiViixKuELpGxHWaHW0PG8
         pp24zM38HtAoDJ+t6Enw7kprrI4Sxu2KKkSB879FDVhrEh44gQumkFLa77ZlMfE2+EfQ
         yqO6jdv2G/9i2HV4rE4AhF8EX2zeLHDB9aqTPMKo+4faqbqSkTLyH6IzF1lkdEWpzKDB
         RdgEFPBTZfbjrzHux2M5cVYhXY60UF6tjD8L053aleiZFS0SQDh+wONdMkxisnYg9WWn
         t4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607639; x=1761212439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tLjP3QUISYumMMgv2clUq/pjNoXb6et4hLSum4orY4=;
        b=oYdUjl4DgXajiBHJMtvuNK1jv3OpxxcPzT8oHybn9wIG6uK/JUv1mYHu/o8P8+l5R5
         bm/lhNHMRMz2J7FobmojZ13f/YeOYA0AZH+CiACkgOQXrPXt1/9rsg+Nd4c1/aKiiisj
         GzCpl2g4xZAd4muUU6CfMDP98eXHB/GLUuaWiLcoYzVsMw8kQM0wH2kRmyVs5wqjlzb9
         W4xYoLHVfcNewd237le8VcrU+8OLRHQeL6k7hzR54XdTnlP9EXxUw0mEHYRndfXEbCgF
         nU+wk3JDsTr6nHAQpM7lbKaN3XVZAHe8zc5ljCDw+0Q3hBfRIf53PkvyLGfV2lfrppoY
         nZAg==
X-Forwarded-Encrypted: i=1; AJvYcCX9WhDY0GI0v9gYG/LFuyoGdgZa/qiispcE2Dte9/zAMDNHlK7Ldg25XxEcv4faZwm/ZHtNSRqwGcpy5UC9dSRo3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVCW4rpwhSmjeH5QmCDrelN4z8Hq4GDkDcBv6VSUaIj72+8OC
	zCSP2JXc+dWYs693WB9FjI3HuWhVD0PPPZ8Nks5yinvzaMF8WkMSlE55T4988aZhrRw=
X-Gm-Gg: ASbGnctaaER+dRfGg1BiAQpSZ/f7aq9f1viQkfyyZwC1o57rSP63EuXeeBUOGPEa0ZE
	Z0c+nSpRbB0xdmvU+zHwt6wG0b5VnpZX8BwzE0Ktg2W2vQ4eZLxLb57t9f35nqxmdshUGkGwJ14
	9MIpz5DamHdvo128iYdQnuJnE9XfcDIwPopRyiYw/8Zpo9fUncdAA0NLw0BsidWW0xN+goSYZQH
	XVW46gm6uPGWDAtjGK+4bqdZYQ6X7gfCxR4aPLtSkCNsuNF/LY85SjpFefTtWMA4aHL9yGM2ojD
	kGd61gHTi44FVDJ9wrwO1UvCjZcNm8R+Xhrr4Ol9+7ZOxnPvhmMoyGdLgmZlFGLiH3at3XfBtBW
	YUPh0e/d5mRheo4RwKhtEAL4k/zl04LIpsXdYXi4LlVGEDUj0W1gKaLN5V2pFUGFfc6eJMVZp/f
	2A1D1GpW7XZjaOKycN5Q==
X-Google-Smtp-Source: AGHT+IFJAw9cYwsree/Zla/cbN6XzYn4IF01LlnNWaWCpS0LbBA5XTnx9R5Zhql69uGWmI3UahBNJQ==
X-Received: by 2002:a17:907:6d25:b0:b3c:82d5:2119 with SMTP id a640c23a62f3a-b50aa49157amr2921240266b.6.1760607638472;
        Thu, 16 Oct 2025 02:40:38 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9c6c874sm469328366b.22.2025.10.16.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:40:37 -0700 (PDT)
Message-ID: <fade8bd8d912b2672ec839e5819367691fec6b72.camel@linaro.org>
Subject: Re: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode
 for CMUs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 10:40:36 +0100
In-Reply-To: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peter,

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Update exynos_arm64_init_clocks() so that it enables the automatic clock
> mode bits in the CMU option register if the auto_clock_gate flag and
> option_offset fields are set for the CMU.
>=20
> The CMU option register bits are global and effect every clock component =
in
> the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANU=
AL
> bit on every gate register is only required if auto_clock_gate is false.
>=20
> Additionally if auto_clock_gate is enabled the dynamic root clock gating
> and memclk registers will be configured in the corresponding CMUs sysreg
> bank. These registers are exposed via syscon, so the register
> suspend/resume paths are updated to handle using a regmap.
>=20
> As many gates for various Samsung SoCs are already exposed in the Samsung
> clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
> some CMU debug registers to report whether clocks are enabled or disabled
> when operating in automatic mode. This allows
> /sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
> correctly report the status of each clock in the system.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

It's great to see some effort on this topic as this makes the clock handlin=
g
on new Exynos much easier and less error prone and time-consuming, and havi=
ng
the hardware decide which clocks need to be enabled at a given point in tim=
e
allows for a significantly more dynamic environment.

Just some initial comments below.

> ---
> =C2=A0drivers/clk/samsung/clk-exynos-arm64.c=C2=A0=C2=A0 |=C2=A0 47 +++++=
++--
> =C2=A0drivers/clk/samsung/clk-exynos4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/clk/samsung/clk-exynos4412-isp.c |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/clk/samsung/clk-exynos5250.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0drivers/clk/samsung/clk-exynos5420.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +-
> =C2=A0drivers/clk/samsung/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 161 ++++++++++++++++++++=
++++++++---
> =C2=A0drivers/clk/samsung/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 49 +++++++++-
> =C2=A07 files changed, 244 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung=
/clk-exynos-arm64.c
> index bf7de21f329ec89069dcf817ca578fcf9b2d9809..c302c836e8f9f6270753d86d7=
d986c88e6762f4f 100644
> --- a/drivers/clk/samsung/clk-exynos-arm64.c
> +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> @@ -24,6 +24,16 @@
> =C2=A0#define GATE_MANUAL		BIT(20)
> =C2=A0#define GATE_ENABLE_HWACG	BIT(28)
> =C2=A0
> +/* Option register bits */
> +#define OPT_EN_DBG			BIT(31)
> +#define OPT_UNKNOWN			BIT(30)

Except for AOC, bit 30 is called ENABLE_LAYER2_CTRL in all gs101 CMUs.

> +#define OPT_EN_PWR_MANAGEMENT		BIT(29)
> +#define OPT_EN_AUTO_GATING		BIT(28)
> +#define OPT_EN_MEM_PM_GATING		BIT(24)
> +
> +#define CMU_OPT_GLOBAL_EN_AUTO_GATING	(OPT_EN_DBG | OPT_UNKNOWN | \
> +	OPT_EN_PWR_MANAGEMENT | OPT_EN_AUTO_GATING | OPT_EN_MEM_PM_GATING)
> +
> =C2=A0/* PLL_CONx_PLL register offsets range */
> =C2=A0#define PLL_CON_OFF_START	0x100
> =C2=A0#define PLL_CON_OFF_END		0x600
> @@ -37,6 +47,8 @@ struct exynos_arm64_cmu_data {
> =C2=A0	unsigned int nr_clk_save;
> =C2=A0	const struct samsung_clk_reg_dump *clk_suspend;
> =C2=A0	unsigned int nr_clk_suspend;
> +	struct samsung_clk_reg_dump *clk_sysreg_save;
> +	unsigned int nr_clk_sysreg;
> =C2=A0
> =C2=A0	struct clk *clk;
> =C2=A0	struct clk **pclks;
> @@ -82,13 +94,28 @@ static void __init exynos_arm64_init_clocks(struct de=
vice_node *np,
> =C2=A0	if (!reg_base)
> =C2=A0		panic("%s: failed to map registers\n", __func__);
> =C2=A0
> +	if (cmu->auto_clock_gate && cmu->option_offset) {
> +		/*
> +		 * Enable the global automatic mode for the entire CMU.
> +		 * This overrides the individual HWACG bits in each of the
> +		 * individual gate, mux and qch registers.
> +		 */
> +		writel(CMU_OPT_GLOBAL_EN_AUTO_GATING,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_base + cmu->option_offset);
> +	}
> +
> =C2=A0	for (i =3D 0; i < reg_offs_len; ++i) {
> =C2=A0		void __iomem *reg =3D reg_base + reg_offs[i];
> =C2=A0		u32 val;
> =C2=A0
> =C2=A0		if (cmu->manual_plls && is_pll_con1_reg(reg_offs[i])) {
> =C2=A0			writel(PLL_CON1_MANUAL, reg);
> -		} else if (is_gate_reg(reg_offs[i])) {
> +		} else if (is_gate_reg(reg_offs[i]) && !cmu->auto_clock_gate) {
> +			/*
> +			 * Setting GATE_MANUAL bit (which is described in TRM as
> +			 * reserved!) overrides the global CMU automatic mode
> +			 * option.
> +			 */
> =C2=A0			val =3D readl(reg);
> =C2=A0			val |=3D GATE_MANUAL;
> =C2=A0			val &=3D ~GATE_ENABLE_HWACG;
> @@ -219,7 +246,7 @@ void __init exynos_arm64_register_cmu(struct device *=
dev,
> =C2=A0 * Return: 0 on success, or negative error code on error.
> =C2=A0 */
> =C2=A0int __init exynos_arm64_register_cmu_pm(struct platform_device *pde=
v,
> -					bool set_manual)
> +					bool init_clk_regs)

kerneldoc needs updating

> =C2=A0{
> =C2=A0	const struct samsung_cmu_info *cmu;
> =C2=A0	struct device *dev =3D &pdev->dev;
> @@ -249,7 +276,7 @@ int __init exynos_arm64_register_cmu_pm(struct platfo=
rm_device *pdev,
> =C2=A0		dev_err(dev, "%s: could not enable bus clock %s; err =3D %d\n",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, cmu->clk_name, ret=
);
> =C2=A0
> -	if (set_manual)
> +	if (init_clk_regs)
> =C2=A0		exynos_arm64_init_clocks(np, cmu);
> =C2=A0
> =C2=A0	reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -280,14 +307,18 @@ int exynos_arm64_cmu_suspend(struct device *dev)
> =C2=A0	struct exynos_arm64_cmu_data *data =3D dev_get_drvdata(dev);
> =C2=A0	int i;
> =C2=A0
> -	samsung_clk_save(data->ctx->reg_base, data->clk_save,
> +	samsung_clk_save(data->ctx->reg_base, NULL, data->clk_save,
> =C2=A0			 data->nr_clk_save);
> =C2=A0
> +	if (data->ctx->sysreg)
> +		samsung_clk_save(NULL, data->ctx->sysreg, data->clk_save,
> +				 data->nr_clk_save);
> +

I think this should be

+		samsung_clk_save(NULL, data->ctx->sysreg, data->clk_sysreg_save,
+				 data->nr_clk_sysreg);

?

> =C2=A0	for (i =3D 0; i < data->nr_pclks; i++)
> =C2=A0		clk_prepare_enable(data->pclks[i]);
> =C2=A0
> =C2=A0	/* For suspend some registers have to be set to certain values */
> -	samsung_clk_restore(data->ctx->reg_base, data->clk_suspend,
> +	samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_suspend,
> =C2=A0			=C2=A0=C2=A0=C2=A0 data->nr_clk_suspend);
> =C2=A0
> =C2=A0	for (i =3D 0; i < data->nr_pclks; i++)
> @@ -308,9 +339,13 @@ int exynos_arm64_cmu_resume(struct device *dev)
> =C2=A0	for (i =3D 0; i < data->nr_pclks; i++)
> =C2=A0		clk_prepare_enable(data->pclks[i]);
> =C2=A0
> -	samsung_clk_restore(data->ctx->reg_base, data->clk_save,
> +	samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_save,
> =C2=A0			=C2=A0=C2=A0=C2=A0 data->nr_clk_save);
> =C2=A0
> +	if (data->ctx->sysreg)
> +		samsung_clk_restore(NULL, data->ctx->sysreg, data->clk_save,
> +				=C2=A0=C2=A0=C2=A0 data->nr_clk_save);
> +

dito.

> =C2=A0	for (i =3D 0; i < data->nr_pclks; i++)
> =C2=A0		clk_disable_unprepare(data->pclks[i]);
>=20

[...]

> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index dbc9925ca8f46e951dfb5d391c0e744ca370abcc..07b2948ae7ea48f126ab420be=
57d8c2705979464 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -12,8 +12,10 @@
> =C2=A0#include <linux/clkdev.h>
> =C2=A0#include <linux/clk-provider.h>
> =C2=A0#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> =C2=A0#include <linux/mod_devicetable.h>
> =C2=A0#include <linux/of_address.h>
> +#include <linux/regmap.h>
> =C2=A0#include <linux/syscore_ops.h>
> =C2=A0
> =C2=A0#include "clk.h"
> @@ -21,19 +23,29 @@
> =C2=A0static LIST_HEAD(clock_reg_cache_list);
> =C2=A0
> =C2=A0void samsung_clk_save(void __iomem *base,
> +				=C2=A0=C2=A0=C2=A0 struct regmap *regmap,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct samsung_clk_reg_dump *rd,
> =C2=A0				=C2=A0=C2=A0=C2=A0 unsigned int num_regs)
> =C2=A0{
> -	for (; num_regs > 0; --num_regs, ++rd)
> -		rd->value =3D readl(base + rd->offset);
> +	for (; num_regs > 0; --num_regs, ++rd) {
> +		if (base)
> +			rd->value =3D readl(base + rd->offset);
> +		if (regmap)

Should this be else if?

> +			regmap_read(regmap, rd->offset, &rd->value);

Otherwise users that (incorrectly) pass both base and regmap would
cause this to end up reading the offset from the wrong memory
region.

At least this way that won't happen, but maybe this constrains should
be made even more explicit.

> +	}
> =C2=A0}
> =C2=A0
> =C2=A0void samsung_clk_restore(void __iomem *base,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct samsung_clk_reg_dum=
p *rd,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_regs)
> =C2=A0{
> -	for (; num_regs > 0; --num_regs, ++rd)
> -		writel(rd->value, base + rd->offset);
> +	for (; num_regs > 0; --num_regs, ++rd) {
> +		if (base)
> +			writel(rd->value, base + rd->offset);
> +		if (regmap)
> +			regmap_write(regmap, rd->offset, rd->value);

dito.

> +	}
> =C2=A0}
> =C2=A0
> =C2=A0struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
> @@ -227,6 +239,82 @@ void __init samsung_clk_register_div(struct samsung_=
clk_provider *ctx,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +#define ACG_MSK GENMASK(6, 4)
> +#define CLK_IDLE GENMASK(5, 4)
> +static int samsung_auto_clk_gate_is_en(struct clk_hw *hw)
> +{
> +	u32 reg;
> +	struct clk_gate *gate =3D to_clk_gate(hw);
> +
> +	reg =3D readl(gate->reg);
> +	return ((reg & ACG_MSK) =3D=3D CLK_IDLE) ? 0 : 1;
> +}
> +
> +/* enable and disable are nops in automatic clock mode */
> +static int samsung_auto_clk_gate_en(struct clk_hw *hw)
> +{
> +	return 0;
> +}
> +
> +static void samsung_auto_clk_gate_dis(struct clk_hw *hw)
> +{
> +}
> +
> +static const struct clk_ops samsung_auto_clk_gate_ops =3D {
> +	.enable =3D samsung_auto_clk_gate_en,
> +	.disable =3D samsung_auto_clk_gate_dis,
> +	.is_enabled =3D samsung_auto_clk_gate_is_en,
> +};
> +
> +struct clk_hw *samsung_register_auto_gate(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags,
> +		void __iomem *reg, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock)
> +{
> +	struct clk_gate *gate;
> +	struct clk_hw *hw;
> +	struct clk_init_data init =3D {};
> +	int ret =3D -EINVAL;
> +
> +	/* allocate the gate */
> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name =3D name;
> +	init.ops =3D &samsung_auto_clk_gate_ops;
> +	init.flags =3D flags;
> +	init.parent_names =3D parent_name ? &parent_name : NULL;
> +	init.parent_hws =3D parent_hw ? &parent_hw : NULL;
> +	init.parent_data =3D parent_data;
> +	if (parent_name || parent_hw || parent_data)
> +		init.num_parents =3D 1;
> +	else
> +		init.num_parents =3D 0;
> +
> +	/* struct clk_gate assignments */
> +	gate->reg =3D reg;
> +	gate->bit_idx =3D bit_idx;
> +	gate->flags =3D clk_gate_flags;
> +	gate->lock =3D lock;
> +	gate->hw.init =3D &init;
> +
> +	hw =3D &gate->hw;
> +	if (dev || !np)
> +		ret =3D clk_hw_register(dev, hw);
> +	else if (np)
> +		ret =3D of_clk_hw_register(np, hw);
> +	if (ret) {
> +		kfree(gate);
> +		hw =3D ERR_PTR(ret);
> +	}
> +
> +	return hw;
> +}
> +
> =C2=A0/* register a list of gate clocks */
> =C2=A0void __init samsung_clk_register_gate(struct samsung_clk_provider *=
ctx,
> =C2=A0				const struct samsung_gate_clock *list,
> @@ -234,11 +322,21 @@ void __init samsung_clk_register_gate(struct samsun=
g_clk_provider *ctx,
> =C2=A0{
> =C2=A0	struct clk_hw *clk_hw;
> =C2=A0	unsigned int idx;
> +	void __iomem *reg_offs;
> =C2=A0
> =C2=A0	for (idx =3D 0; idx < nr_clk; idx++, list++) {
> -		clk_hw =3D clk_hw_register_gate(ctx->dev, list->name, list->parent_nam=
e,
> -				list->flags, ctx->reg_base + list->offset,
> +		reg_offs =3D ctx->reg_base + list->offset;
> +
> +		if (ctx->auto_clock_gate && ctx->gate_dbg_offset)
> +			clk_hw =3D samsung_register_auto_gate(ctx->dev, NULL,
> +				list->name, list->parent_name, NULL, NULL,
> +				list->flags, reg_offs + ctx->gate_dbg_offset,
> =C2=A0				list->bit_idx, list->gate_flags, &ctx->lock);
> +		else
> +			clk_hw =3D clk_hw_register_gate(ctx->dev, list->name,
> +				list->parent_name, list->flags,
> +				ctx->reg_base + list->offset, list->bit_idx,
> +				list->gate_flags, &ctx->lock);
> =C2=A0		if (IS_ERR(clk_hw)) {
> =C2=A0			pr_err("%s: failed to register clock %s\n", __func__,
> =C2=A0				list->name);

Maybe the error message should include the actual error clk_hw here?

> @@ -276,10 +374,11 @@ static int samsung_clk_suspend(void)
> =C2=A0	struct samsung_clock_reg_cache *reg_cache;
> =C2=A0
> =C2=A0	list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
> -		samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
> -				reg_cache->rd_num);
> -		samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
> -				reg_cache->rsuspend_num);
> +		samsung_clk_save(reg_cache->reg_base, reg_cache->sysreg,
> +				 reg_cache->rdump, reg_cache->rd_num);
> +		samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
> +				=C2=A0=C2=A0=C2=A0 reg_cache->rsuspend,
> +				=C2=A0=C2=A0=C2=A0 reg_cache->rsuspend_num);
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}
> @@ -289,8 +388,8 @@ static void samsung_clk_resume(void)
> =C2=A0	struct samsung_clock_reg_cache *reg_cache;
> =C2=A0
> =C2=A0	list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
> -		samsung_clk_restore(reg_cache->reg_base, reg_cache->rdump,
> -				reg_cache->rd_num);
> +		samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
> +				=C2=A0=C2=A0=C2=A0 reg_cache->rdump, reg_cache->rd_num);
> =C2=A0}
> =C2=A0
> =C2=A0static struct syscore_ops samsung_clk_syscore_ops =3D {
> @@ -299,6 +398,7 @@ static struct syscore_ops samsung_clk_syscore_ops =3D=
 {
> =C2=A0};
> =C2=A0
> =C2=A0void samsung_clk_extended_sleep_init(void __iomem *reg_base,
> +			struct regmap *sysreg,
> =C2=A0			const unsigned long *rdump,
> =C2=A0			unsigned long nr_rdump,
> =C2=A0			const struct samsung_clk_reg_dump *rsuspend,
> @@ -319,6 +419,7 @@ void samsung_clk_extended_sleep_init(void __iomem *re=
g_base,
> =C2=A0		register_syscore_ops(&samsung_clk_syscore_ops);
> =C2=A0
> =C2=A0	reg_cache->reg_base =3D reg_base;
> +	reg_cache->sysreg =3D sysreg;
> =C2=A0	reg_cache->rd_num =3D nr_rdump;
> =C2=A0	reg_cache->rsuspend =3D rsuspend;
> =C2=A0	reg_cache->rsuspend_num =3D nr_rsuspend;
> @@ -334,6 +435,12 @@ void samsung_clk_extended_sleep_init(void __iomem *r=
eg_base,
> =C2=A0void __init samsung_cmu_register_clocks(struct samsung_clk_provider=
 *ctx,
> =C2=A0					const struct samsung_cmu_info *cmu)
> =C2=A0{
> +	ctx->auto_clock_gate =3D cmu->auto_clock_gate;
> +	ctx->gate_dbg_offset =3D cmu->gate_dbg_offset;
> +	ctx->option_offset =3D cmu->option_offset;
> +	ctx->drcg_offset =3D cmu->drcg_offset;
> +	ctx->memclk_offset =3D cmu->memclk_offset;
> +
> =C2=A0	if (cmu->pll_clks)
> =C2=A0		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
> =C2=A0	if (cmu->mux_clks)
> @@ -353,6 +460,31 @@ void __init samsung_cmu_register_clocks(struct samsu=
ng_clk_provider *ctx,
> =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> =C2=A0}
> =C2=A0
> +/* Enable Dynamic Root Clock Gating of bus components*/

missing space before */

> +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> +				=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx,
> +				=C2=A0=C2=A0=C2=A0 const struct samsung_cmu_info *cmu)
> +{
> +	if (ctx && !ctx->auto_clock_gate)

ctx can not be NULL here. If it could, then the following lines would also
need updating, but again, it can not be NULL, if ctx allocation fails, the
code will panic() before this here is reached.

> +		return;
> +
> +	ctx->sysreg =3D syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
> +	if (!IS_ERR_OR_NULL(ctx->sysreg)) {
> +		regmap_write(ctx->sysreg, ctx->drcg_offset, 0xffffffff);

What does 0xffffffff mean? Maybe a macro or at least a comment would help.

> +		/* not every sysreg controller has memclk reg*/

missing space before */

Can you please check all such comments, since it seems to be recurring :-)

+		if (ctx->memclk_offset)
> +			regmap_write_bits(ctx->sysreg, ctx->memclk_offset, 0x1, 0x0);
> +
> +		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
> +						cmu->sysreg_clk_regs,
> +						cmu->nr_sysreg_clk_regs,
> +						NULL, 0);
> +	} else {
> +		pr_warn("%pOF: Unable to get CMU sysreg\n", np);
> +		ctx->sysreg =3D NULL;
> +	}
> +}
> +
> =C2=A0/*
> =C2=A0 * Common function which registers plls, muxes, dividers and gates
> =C2=A0 * for each CMU. It also add CMU register list to register cache.
> @@ -374,11 +506,14 @@ struct samsung_clk_provider * __init samsung_cmu_re=
gister_one(
> =C2=A0	samsung_cmu_register_clocks(ctx, cmu);
> =C2=A0
> =C2=A0	if (cmu->clk_regs)
> -		samsung_clk_extended_sleep_init(reg_base,
> +		samsung_clk_extended_sleep_init(reg_base, NULL,
> =C2=A0			cmu->clk_regs, cmu->nr_clk_regs,
> =C2=A0			cmu->suspend_regs, cmu->nr_suspend_regs);
> =C2=A0
> =C2=A0	samsung_clk_of_add_provider(np, ctx);
> =C2=A0
> +	/* sysreg DT nodes reference a clock in this CMU */
> +	samsung_en_dyn_root_clk_gating(np, ctx, cmu);
> +

samsung_cmu_register_one() is not called when the clocks are registered
using exynos_arm64_register_cmu_pm(). Does the pm version need a call to
samsung_en_dyn_root_clk_gating() somewhere?

> =C2=A0	return ctx;
> =C2=A0}
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index 18660c1ac6f0106b17b9efc9c6b3cd62d46f7b82..b719e057f45489e9d92ba5403=
1fe633a8c9264ce 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -12,6 +12,7 @@
> =C2=A0
> =C2=A0#include <linux/clk-provider.h>
> =C2=A0#include <linux/mod_devicetable.h>
> +#include <linux/regmap.h>
> =C2=A0#include "clk-pll.h"
> =C2=A0#include "clk-cpu.h"
> =C2=A0
> @@ -19,13 +20,25 @@
> =C2=A0 * struct samsung_clk_provider - information about clock provider
> =C2=A0 * @reg_base: virtual address for the register base
> =C2=A0 * @dev: clock provider device needed for runtime PM
> + * @sysreg: syscon regmap for clock-provider sysreg controller
> =C2=A0 * @lock: maintains exclusion between callbacks for a given clock-p=
rovider
> + * @auto_clock_gate: enable auto clk mode for all clocks in clock-provid=
er
> + * @gate_dbg_offset: gate debug reg offset. Used for all gates in auto c=
lk mode
> + * @option_offset: option reg offset. Enables auto mode for clock-provid=
er
> + * @drcg_offset: dynamic root clk gate enable register offset
> + * @memclk_offset: memclk enable register offset

The last two are in the sysreg space, maybe the comment should mention that=
.

> =C2=A0 * @clk_data: holds clock related data like clk_hw* and number of c=
locks
> =C2=A0 */
> =C2=A0struct samsung_clk_provider {
> =C2=A0	void __iomem *reg_base;
> =C2=A0	struct device *dev;
> +	struct regmap *sysreg;
> =C2=A0	spinlock_t lock;
> +	bool auto_clock_gate;
> +	u32 gate_dbg_offset;
> +	u32 option_offset;
> +	u32 drcg_offset;
> +	u32 memclk_offset;
> =C2=A0	/* clk_data must be the last entry due to variable length 'hws' ar=
ray */
> =C2=A0	struct clk_hw_onecell_data clk_data;
> =C2=A0};
> @@ -310,6 +323,7 @@ struct samsung_cpu_clock {
> =C2=A0struct samsung_clock_reg_cache {
> =C2=A0	struct list_head node;
> =C2=A0	void __iomem *reg_base;
> +	struct regmap *sysreg;
> =C2=A0	struct samsung_clk_reg_dump *rdump;
> =C2=A0	unsigned int rd_num;
> =C2=A0	const struct samsung_clk_reg_dump *rsuspend;
> @@ -338,7 +352,14 @@ struct samsung_clock_reg_cache {
> =C2=A0 * @suspend_regs: list of clock registers to set before suspend
> =C2=A0 * @nr_suspend_regs: count of clock registers in @suspend_regs
> =C2=A0 * @clk_name: name of the parent clock needed for CMU register acce=
ss
> + * @sysreg_clk_regs: list of sysreg clock registers
> + * @nr_sysreg_clk_regs: count of clock registers in @sysreg_clk_regs
> =C2=A0 * @manual_plls: Enable manual control for PLL clocks
> + * @auto_clock_gate: enable auto clock mode for all components in CMU
> + * @gate_dbg_offset: gate debug reg offset. Used by all gates in auto cl=
k mode
> + * @option_offset: option reg offset. Enables auto clk mode for entire C=
MU
> + * @drcg_offset: dynamic root clk gate enable register offset
> + * @memclk_offset: memclk enable register offset

dito.

Cheers,
Andre'


> =C2=A0 */
> =C2=A0struct samsung_cmu_info {
> =C2=A0	const struct samsung_pll_clock *pll_clks;
> @@ -364,8 +385,16 @@ struct samsung_cmu_info {
> =C2=A0	unsigned int nr_suspend_regs;
> =C2=A0	const char *clk_name;
> =C2=A0
> +	const unsigned long *sysreg_clk_regs;
> +	unsigned int nr_sysreg_clk_regs;
> +
> =C2=A0	/* ARM64 Exynos CMUs */
> =C2=A0	bool manual_plls;
> +	bool auto_clock_gate;
> +	u32 gate_dbg_offset;
> +	u32 option_offset;
> +	u32 drcg_offset;
> +	u32 memclk_offset;
> =C2=A0};
> =C2=A0
> =C2=A0struct samsung_clk_provider *samsung_clk_init(struct device *dev,
> @@ -415,6 +444,7 @@ struct samsung_clk_provider *samsung_cmu_register_one=
(
> =C2=A0
> =C2=A0#ifdef CONFIG_PM_SLEEP
> =C2=A0void samsung_clk_extended_sleep_init(void __iomem *reg_base,
> +			struct regmap *sysreg,
> =C2=A0			const unsigned long *rdump,
> =C2=A0			unsigned long nr_rdump,
> =C2=A0			const struct samsung_clk_reg_dump *rsuspend,
> @@ -426,17 +456,32 @@ static inline void samsung_clk_extended_sleep_init(=
void __iomem *reg_base,
> =C2=A0			const struct samsung_clk_reg_dump *rsuspend,
> =C2=A0			unsigned long nr_rsuspend) {}
> =C2=A0#endif
> -#define samsung_clk_sleep_init(reg_base, rdump, nr_rdump) \
> -	samsung_clk_extended_sleep_init(reg_base, rdump, nr_rdump, NULL, 0)
> +#define samsung_clk_sleep_init(reg_base, sysreg, rdump, nr_rdump)	=C2=A0=
=C2=A0 \
> +	samsung_clk_extended_sleep_init(reg_base, sysreg, rdump, nr_rdump, \
> +					NULL, 0)
> =C2=A0
> =C2=A0void samsung_clk_save(void __iomem *base,
> +			struct regmap *regmap,
> =C2=A0			struct samsung_clk_reg_dump *rd,
> =C2=A0			unsigned int num_regs);
> =C2=A0void samsung_clk_restore(void __iomem *base,
> +			struct regmap *regmap,
> =C2=A0			const struct samsung_clk_reg_dump *rd,
> =C2=A0			unsigned int num_regs);
> =C2=A0struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
> =C2=A0			const unsigned long *rdump,
> =C2=A0			unsigned long nr_rdump);
> =C2=A0
> +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> +				struct samsung_clk_provider *ctx,
> +				const struct samsung_cmu_info *cmu);
> +
> +struct clk_hw *samsung_register_auto_gate(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags,
> +		void __iomem *reg, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock);
> +
> =C2=A0#endif /* __SAMSUNG_CLK_H */
