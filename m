Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7979285C9C;
	Sun, 21 Sep 2025 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758487039; cv=none; b=p5AAZN5+Y7Xibo5iI+8X2yyEn5l/ON0KY5fPoOOtCohEl54kg0fsqml+gt4xnparmnO25mYNTksLaPsP9vE6zvAiLeSijICTUOJOp9eeUcVEe43fZ1xC7WOaiTWa24JjfJV3PlEdQiwfgRWTY9ENLtl1HhBxqUJ3nzOqmyEUkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758487039; c=relaxed/simple;
	bh=h0CCspWX7v+icobunOo57R3hj+9ITuMxqueMpV/4iUQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DCKtgny3D8bNPLCVCnPmCuvEwy45bDga3zKQpy0w1Bru3WLUezUFqnyGTUn3Ah2EWXYIP5zHFWcz4rUbRuuqcT+4/EzMRzThHQu4lmRCfhf0rQhEzZpj0CVZ0Omx84cxSovVG4p4p4f6e0T9K1wIet912K94El0BRCuXwC/Mv68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWHIjc15; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWHIjc15"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E3DC4CEE7;
	Sun, 21 Sep 2025 20:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758487038;
	bh=h0CCspWX7v+icobunOo57R3hj+9ITuMxqueMpV/4iUQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GWHIjc15bLcK1IEAAs678u/24MLpykiuY2V/iTmlkGbs3wEHR2tZitc6wEcMIkfLI
	 51UsHvUvkJp2CPh0KlTXvSiHF/ZqNH2RX6oj2lYNdVvRkF3r2HmVC0aPfjWDimdXgJ
	 +quJ1/onweU9oJOaZvHBKGzu+cf5RqwGaiIoY+i8eQ6LFg6brwVlYAiLIA9Si865D3
	 PABsMpTvS8OipSHL4RSB8aXq6tG3Rk/YykDXpW1M3aScraCwhtUdUPHP9mRROtLNu4
	 EmCtAi1xnwcbKH8TsGGdet253smkYN2VweDHaic18bI8ym0zkGYjYMVQjJNKOCo8aJ
	 HfKQurTsLbmXg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250908-acpm-clk-v4-4-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org> <20250908-acpm-clk-v4-4-633350c0c0b1@linaro.org>
Subject: Re: [PATCH v4 4/5] clk: samsung: add Exynos ACPM clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will Deacon <will@kernel.org>
Date: Sun, 21 Sep 2025 13:37:16 -0700
Message-ID: <175848703636.4354.2936744718103927060@lazor>
User-Agent: alot/0.11

Quoting Tudor Ambarus (2025-09-08 06:12:45)
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95=
e029c52436e5c7f 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>           status of the certains clocks from SoC, but it could also be ti=
ed to
>           other devices as an input clock.
> =20
> +config EXYNOS_ACPM_CLK
> +       tristate "Clock driver controlled via ACPM interface"
> +       depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_=
PROTOCOL)

Why is COMPILE_TEST limited to !EXYNOS_ACPM_PROTOCOL?

> +       help
> +         This driver provides support for clocks that are controlled by
> +         firmware that implements the ACPM interface.
> +
> +         This driver uses the ACPM interface to interact with the firmwa=
re
> +         providing all the clock controlls.
> +
>  config TESLA_FSD_COMMON_CLK
>         bool "Tesla FSD clock controller support" if COMPILE_TEST
>         depends on COMMON_CLK_SAMSUNG
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acp=
m.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8566495265ee3e06dbf370f9e=
424d5540f5c7457
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Samsung Exynos ACPM protocol based clock driver.
> + *
> + * Copyright 2025 Linaro Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

Is this include used?

> +#include <linux/platform_device.h>
> +#include <linux/types.h>

Are you avoiding kernel.h? If so, please include container_of.h and
device/devres.h to avoid implicit includes.

> +
> +struct acpm_clk {
> +       u32 id;
> +       struct clk_hw hw;
> +       unsigned int mbox_chan_id;
> +       const struct acpm_handle *handle;
> +};
> +
> +struct acpm_clk_variant {
> +       const char *name;
> +};
> +
> +struct acpm_clk_driver_data {
> +       const struct acpm_clk_variant *clks;
> +       unsigned int nr_clks;
> +       unsigned int mbox_chan_id;
> +};
> +
> +#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
> +
> +#define ACPM_CLK(cname)                                        \
> +       {                                               \
> +               .name           =3D cname,                \
> +       }
> +
> +static const struct acpm_clk_variant gs101_acpm_clks[] =3D {
> +       ACPM_CLK("mif"),
> +       ACPM_CLK("int"),
> +       ACPM_CLK("cpucl0"),
> +       ACPM_CLK("cpucl1"),
> +       ACPM_CLK("cpucl2"),
> +       ACPM_CLK("g3d"),
> +       ACPM_CLK("g3dl2"),
> +       ACPM_CLK("tpu"),
> +       ACPM_CLK("intcam"),
> +       ACPM_CLK("tnr"),
> +       ACPM_CLK("cam"),
> +       ACPM_CLK("mfc"),
> +       ACPM_CLK("disp"),
> +       ACPM_CLK("b0"),
> +};
> +
> +static const struct acpm_clk_driver_data acpm_clk_gs101 =3D {
> +       .clks =3D gs101_acpm_clks,
> +       .nr_clks =3D ARRAY_SIZE(gs101_acpm_clks),
> +       .mbox_chan_id =3D 0,
> +};
> +
> +static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
> +                                         unsigned long parent_rate)
> +{
> +       struct acpm_clk *clk =3D to_acpm_clk(hw);
> +
> +       return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
> +                                       clk->mbox_chan_id, clk->id, 0);
> +}
> +
> +static int acpm_clk_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
> +{
> +       /*
> +        * We can't figure out what rate it will be, so just return the
> +        * rate back to the caller. acpm_clk_recalc_rate() will be called
> +        * after the rate is set and we'll know what rate the clock is
> +        * running at then.
> +        */
> +       return 0;
> +}
> +
> +static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +                            unsigned long parent_rate)
> +{
> +       struct acpm_clk *clk =3D to_acpm_clk(hw);
> +
> +       return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
> +                                       clk->mbox_chan_id, clk->id, rate);
> +}
> +
> +static const struct clk_ops acpm_clk_ops =3D {
> +       .recalc_rate =3D acpm_clk_recalc_rate,
> +       .determine_rate =3D acpm_clk_determine_rate,
> +       .set_rate =3D acpm_clk_set_rate,
> +};
> +
> +static int acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,

Maybe acpm_clk_register() is a more appropriate name.

> +                            const char *name)
> +{
> +       struct clk_init_data init =3D {};
> +
> +       init.name =3D name;
> +       init.ops =3D &acpm_clk_ops;
> +       aclk->hw.init =3D &init;
> +
> +       return devm_clk_hw_register(dev, &aclk->hw);
> +}
> +
> +static int acpm_clk_probe(struct platform_device *pdev)
> +{
> +       const struct acpm_handle *acpm_handle;
> +       struct clk_hw_onecell_data *clk_data;
> +       struct clk_hw **hws;
> +       struct device *dev =3D &pdev->dev;
> +       struct acpm_clk *aclks;
> +       unsigned int mbox_chan_id;
> +       int i, err, count;
> +
> +       acpm_handle =3D devm_acpm_get_by_node(dev, dev->parent->of_node);
> +       if (IS_ERR(acpm_handle))
> +               return dev_err_probe(dev, PTR_ERR(acpm_handle),
> +                                    "Failed to get acpm handle.\n");

Remove the period please. Most error messages don't have proper
punctuation.

> +
> +       count =3D acpm_clk_gs101.nr_clks;
> +       mbox_chan_id =3D acpm_clk_gs101.mbox_chan_id;
> +
> +       clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, count),
> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       clk_data->num =3D count;
> +       hws =3D clk_data->hws;
> +
> +       aclks =3D devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
> +       if (!aclks)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < count; i++) {
> +               struct acpm_clk *aclk =3D &aclks[i];
> +
> +               /*
> +                * The code assumes the clock IDs start from zero,
> +                * are sequential and do not have gaps.
> +                */
> +               aclk->id =3D i;
> +               aclk->handle =3D acpm_handle;
> +               aclk->mbox_chan_id =3D mbox_chan_id;
> +
> +               hws[i] =3D &aclk->hw;
> +
> +               err =3D acpm_clk_ops_init(dev, aclk,
> +                                       acpm_clk_gs101.clks[i].name);
> +               if (err)
> +                       return dev_err_probe(dev, err,
> +                                            "Failed to register clock.\n=
");
> +       }
> +
> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +                                          clk_data);
> +}
> +
> +static const struct platform_device_id acpm_clk_id[] =3D {
> +       { "gs101-acpm-clk" },
> +       {},

Please drop comma here so that nothing can come after.
