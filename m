Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8E239579;
	Tue,  4 Mar 2025 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112166; cv=none; b=Zql45AqJSaD5XnqTTBjog8/IiDOM7yFWYn47ppkzJHk2TNuJvhljep6yWvRu1iLwFdJpoj3lokisVKLDrt8wbabVb9eIq6qLI9GBk8yaLwd9xfuT9sJfJMB8kBZfs/upRx9kSiTm+2QGA6k74X/rcb+bxptlXsmNOyBEsvWOUuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112166; c=relaxed/simple;
	bh=TjiK3dy6VtxMzpyEGZ59HRvoPz9f2mzhsPZT7T2eWnU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=okj9PBu2zxvgD5prfL2rOc5UMwUZfhM5romrVp21PohPL7ArQTvD85ftyvh+vLrneYOpOGhMW5OvcuRjkrP49LB/vQQWZSobVHNN84x/8LPBhqEEY/Z6t++h094h8ggJivDTqwoB9dammXYP+PSEvEUmLsI3mXnFuxTB0D/bsQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arLobDPT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arLobDPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097A8C4CEE5;
	Tue,  4 Mar 2025 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741112166;
	bh=TjiK3dy6VtxMzpyEGZ59HRvoPz9f2mzhsPZT7T2eWnU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=arLobDPTfb+VaUBCkCpX2TEeRqAqSHAELYPc8ObZkWzMQKhT+yCu1KFwupzYjGm0G
	 vgDiwRkW4dC2pApZZ05eKIvfD91/SWFaQ9R0hID/hhbhAAL1zywLO0aKBRixIwgQuz
	 kfBLhQRB47lGrthuWQjAq7/4pcqbtUygmCUAlabgm1Xi3ypDps51vvR3KiLB6N8aJt
	 CP3/v1hen2/7T4KgAuO+EYJaIFprcJWJOwI5j/GXKl2Teg01wRKx4Jm/92TkcoCviT
	 RmXeI3jgKyRl/y0hvoeWBvPAdZ5nNL0Tj7tj+msGJqFJA5bQfjL1CzthgEHt5WAUpq
	 Ddgj0rzvqukqw==
Message-ID: <b4fb36bc3970293ebdf1ac793bb3d752.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org> <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
Subject: Re: [PATCH v5 2/2] clk: samsung: add initial exynos7870 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 04 Mar 2025 10:16:03 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Kaustabh Chakraborty (2025-02-28 19:57:13)
> diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/c=
lk-exynos7870.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2ec4a4e489be30bd1cd2e6dea=
c006bb8ac5bdc57
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos7870.c
> @@ -0,0 +1,1830 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2015 Samsung Electronics Co., Ltd.
> + * Author: Kaustabh Chakraborty <kauschluss@disroot.org>
> + *
> + * Common Clock Framework support for Exynos7870.
> + */
> +
> +#include <linux/clk.h>

Please remove this include as this is a clk provider and not a clk
consumer.

> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos7870-cmu.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/*
> + * Register offsets for CMU_MIF (0x10460000)
> + */
[...]
> +
> +static const struct samsung_cmu_info peri_cmu_info __initconst =3D {
> +       .gate_clks              =3D peri_gate_clks,
> +       .nr_gate_clks           =3D ARRAY_SIZE(peri_gate_clks),
> +       .clk_regs               =3D peri_clk_regs,
> +       .nr_clk_regs            =3D ARRAY_SIZE(peri_clk_regs),
> +       .nr_clk_ids             =3D PERI_NR_CLK,
> +};
> +
> +static int __init exynos7870_cmu_probe(struct platform_device *pdev)
> +{
> +       const struct samsung_cmu_info *info;
> +       struct device *dev =3D &pdev->dev;
> +
> +       info =3D of_device_get_match_data(dev);

Use device APIs please: device_get_match_data()

> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id exynos7870_cmu_of_match[] =3D {
> +       {
> +               .compatible =3D "samsung,exynos7870-cmu-mif",
> +               .data =3D &mif_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-dispaud",
> +               .data =3D &dispaud_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-fsys",
> +               .data =3D &fsys_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-g3d",
> +               .data =3D &g3d_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-isp",
> +               .data =3D &isp_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-mfcmscl",
> +               .data =3D &mfcmscl_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-peri",
> +               .data =3D &peri_cmu_info,
> +       }, {
> +       },
> +};
> +
> +static struct platform_driver exynos7870_cmu_driver __refdata =3D {

Having __refdata here looks wrong.

> +       .driver =3D {
> +               .name =3D "exynos7870-cmu",
> +               .of_match_table =3D exynos7870_cmu_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D exynos7870_cmu_probe,
> +};
> +
> +static int __init exynos7870_cmu_init(void)
> +{
> +       return platform_driver_register(&exynos7870_cmu_driver);

Is this supposed to be platform_driver_probe()? All the __init markings
in the samsung clk driver look like potential problems if anything
defers or is made into a module.
