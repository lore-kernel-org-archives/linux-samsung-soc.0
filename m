Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B62111;
	Tue,  4 Mar 2025 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112343; cv=none; b=YnEwbievNevV/rI7Gl9Z32KfjCdZ8KlcZHRzr5ggE5v8UTefOcyiSRciAjowLltEK52C5ZjrPTwd/jFMEbiQ3IBpbooy1LfOe5FsnIO22R53d++hVWOt2HhMtz5rPgkTTOHJQUGzgvDdJnbHqLbf8ODwj14t8eVVAm0Mn4luUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112343; c=relaxed/simple;
	bh=7bw48i0H6/MBvyCOgup5IexafXe/jlFudSz/GS/f0jE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LUwBVmO3o2QHbQtLFYaEbsxA/elRqphdFahhLAMN/EiUxq8qv0XqBcKEd1LH/nn6lWLcS3AOgdRvjxTGL8fAGFFpbYFXNRIkrJiDFzrVIABoD4M7/TjBqr00CI6og2ohO3lPYrUcbFHfbFvYZpI8BTezrK62aCyye7S5hQB3dwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqMAvySZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqMAvySZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B625BC4CEE5;
	Tue,  4 Mar 2025 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741112342;
	bh=7bw48i0H6/MBvyCOgup5IexafXe/jlFudSz/GS/f0jE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WqMAvySZGaDBm0Jxa8T9HSI/EwuV+hxw9GHoBqXTHCROXsqHZejECMhM+x5Y5Ggrg
	 14BWwQDJ4LEq17AAtgjK/N+furYAIzI212zZrUeVssXvQoKD4su+rP1YERhsiZ0JhE
	 Y1h2awhCY2iVZajCPjRq/c0N355Xo5iBVK/QZ2/8egIBMATG3mbe+jbW4wCD3MyoKc
	 0G/i0e3C1LRrUxELu+x01yqP/QeHlS6crW7w4pFe2ZCwT/+gqX7fKQ5kS98z4e8ZIu
	 lEJ1omW9CKM04dgieEM9LRj0bdWSFSRBC/SnazC6o7WqAD1notKcHPPQTHGgOlaFQx
	 F6VxzEwDJuRmA==
Message-ID: <7b182615f1439dd39a17b8e74cf740bf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com> <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2 3/3] clk: samsung: introduce Exynos2200 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 04 Mar 2025 10:19:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Ivaylo Ivanov (2025-02-23 03:56:00)
> diff --git a/drivers/clk/samsung/clk-exynos2200.c b/drivers/clk/samsung/c=
lk-exynos2200.c
> new file mode 100644
> index 000000000..151bdb35a
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos2200.c
> @@ -0,0 +1,3928 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + *
> + * Common Clock Framework support for Exynos2200 SoC.
> + */
> +
> +#include <linux/clk.h>

Remove this include because this is a clk provider and not a clk
consumer.

> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos2200-cmu.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define CLKS_NR_TOP                    (CLK_DOUT_TCXO_DIV4 + 1)
> +#define CLKS_NR_ALIVE                  (CLK_DOUT_ALIVE_DSP_NOC + 1)
> +#define CLKS_NR_PERIS                  (CLK_DOUT_PERIS_DDD_CTRL + 1)
> +#define CLKS_NR_CMGP                   (CLK_DOUT_CMGP_USI6 + 1)
> +#define CLKS_NR_HSI0                   (CLK_DOUT_DIV_CLK_HSI0_EUSB + 1)
[...]
> +
> +static int __init exynos2200_cmu_probe(struct platform_device *pdev)
> +{
> +       const struct samsung_cmu_info *info;
> +       struct device *dev =3D &pdev->dev;
> +
> +       info =3D of_device_get_match_data(dev);

Use device APIs to be firmware agnostic: device_get_match_data()=20

> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id exynos2200_cmu_of_match[] =3D {
> +       {
> +               .compatible =3D "samsung,exynos2200-cmu-cmgp",
> +               .data =3D &cmgp_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-hsi0",
> +               .data =3D &hsi0_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-peric0",
> +               .data =3D &peric0_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-peric1",
> +               .data =3D &peric1_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-peric2",
> +               .data =3D &peric2_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-ufs",
> +               .data =3D &ufs_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-vts",
> +               .data =3D &vts_cmu_info,
> +       }, { }
> +};
> +
> +static struct platform_driver exynos2200_cmu_driver __refdata =3D {
> +       .driver =3D {
> +               .name =3D "exynos2200-cmu",
> +               .of_match_table =3D exynos2200_cmu_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D exynos2200_cmu_probe,
> +};
> +
> +static int __init exynos2200_cmu_init(void)
> +{
> +       return platform_driver_register(&exynos2200_cmu_driver);

Was this supposed to be platform_driver_probe()? The __refdata usage
suggests that but all of the __init markings and stuff in the samsung
clk driver worry me.
