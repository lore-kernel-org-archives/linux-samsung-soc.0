Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AE022687C;
	Tue, 29 Jul 2025 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753806600; cv=none; b=BUFrFkdkQ+KQpRyFFfcSLZWtQ3W/Kkr3OL1IYtWwK9ZqSjlgzv4NHqxccW9OhPEIKC1dhDpJAILHJXTNCPbhvkZOwuCuNXmjKDl6v06oqUTKKGefyLup/2UD0iBMJAzCsP3cS864adTPQ4y0ThQ/el34RKrwE5wAYktX3SiwNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753806600; c=relaxed/simple;
	bh=cYPpvp6/LktGFqLRabjLYkW/Jo8p7bCXx5XWj6nAHfQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Q30/LcoQIMzLCG71c0hroxgvovNpI+zXsbHJrAHBIbMXEL2TMhX1abdhYkKBVSWiMf35s5AalFvoYlIM70nHFUTNt46th/bsCJkBSt1ArUMpOkmX/7eOkGG+K1ggCtC6FZAocqQmeGJcP9ccDiI8u97Tdl4p52BYeGEf0FYOUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=D+a5l1fO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="D+a5l1fO"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8EC6520F84;
	Tue, 29 Jul 2025 18:29:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh5I-_ur6aEA; Tue, 29 Jul 2025 18:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753806592; bh=cYPpvp6/LktGFqLRabjLYkW/Jo8p7bCXx5XWj6nAHfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D+a5l1fOvhebePXJUchw4Yhtzye0Fw7YkC6+MLurTq8XGuJcueOGpRM2zSobYf8iU
	 j5+5ljLOrkjG28uiSPb3IWE8Iu7t6iJ2eU6h2VULRj3V5QCNQuuOcbrsSlJUdyPPGO
	 6D2mPPUf0GUCzKVoXw+efXTzlgiO1k0OeLH+LGe5ZR5uOkVxcbnbtjgZfcOA2Dtt+k
	 +EMxwuPvc+w094r40OWw9k4Iu0Ej+pJAZ5istvxlAHAsAfQXySN6/VKbIAuAQvG8uv
	 ia+cztb0FemhJ98IKUv+ZaGAP4jhyc15v+zAWJohyFvZ2SjEoR+aSBNPTgeyPCQEZr
	 cRGAiEqMf+rhg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 16:29:52 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/13] drm/bridge: samsung-dsim: add ability to define
 clock names for every variant
In-Reply-To: <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-10-9879fb9a644d@disroot.org>
 <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
Message-ID: <080f567245829dba8572be649a46cc93@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-29 07:02, Inki Dae wrote:
> 2025년 7월 7일 (월) 오전 3:28, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> -       dsi->clks = devm_kcalloc(dev, dsi->driver_data->num_clks,
>> -                                sizeof(*dsi->clks), GFP_KERNEL);
>> -       if (!dsi->clks)
>> -               return -ENOMEM;
>> -
>> -       for (i = 0; i < dsi->driver_data->num_clks; i++) {
>> -               dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
>> -               if (IS_ERR(dsi->clks[i])) {
>> -                       if (strcmp(clk_names[i], "sclk_mipi") == 0) {
>> -                               dsi->clks[i] = devm_clk_get(dev, 
>> OLD_SCLK_MIPI_CLK_NAME);
>> -                               if (!IS_ERR(dsi->clks[i]))
>> -                                       continue;
>> -                       }
>> -
>> -                       dev_info(dev, "failed to get the clock: %s\n", 
>> clk_names[i]);
>> -                       return PTR_ERR(dsi->clks[i]);
>> -               }
>> +       ret = devm_clk_bulk_get(dev, dsi->driver_data->num_clks,
>> +                               dsi->driver_data->clk_data);
>> +       if (ret) {
>> +               dev_err(dev, "failed to get clocks in bulk (%d)\n", 
>> ret);
>> +               return ret;
> 
> Above change modifies the existing behavior.
> 
> Previously, when devm_clk_get() failed and the clock name was
> "sclk_mipi", the code included a fallback mechanism to try "pll_clk"
> instead. This fallback logic has been removed in the current patch.
> 
> While changing this behavior may raise concerns, the benefits of
> refactoring—specifically, defining clock names per SoC and adopting
> the clk_bulk_* API for improved maintainability—appear to outweigh the
> potential downsides.

I have checked all devices which use this driver.

Here is a mapping of all compatible -> clock names in the driver:
- fsl,imx8mm-mipi-dsim: bus_clk, sclk_mipi
- fsl,imx8mp-mipi-dsim: bus_clk, sclk_mipi
- samsung,exynos3250-mipi-dsi: bus_clk, pll_clk
- samsung,exynos4210-mipi-dsi: bus_clk, sclk_mipi
- samsung,exynos5410-mipi-dsi: bus_clk, pll_clk
- samsung,exynos5422-mipi-dsi: bus_clk, pll_clk
- samsung,exynos5433-mipi-dsi: bus_clk, sclk_mipi,
                                phyclk_mipidphy0_bitclkdiv8,
                                phyclk_mipidphy0_rxclkesc0,
                                sclk_rgb_vclk_to_dsim0

And here is what I found by grep-ing all devicetrees:

arm/boot/dts/nxp/imx/imx7s.dtsi
     compatible = "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm/boot/dts/samsung/exynos3250.dtsi
     compatible = "samsung,exynos3250-mipi-dsi";
     (uses bus_clk, pll_clk)

arm/boot/dts/samsung/exynos4.dtsi
     compatible = "samsung,exynos4210-mipi-dsi";
     (uses bus_clk, sclk_mipi)

arm/boot/dts/samsung/exynos5420.dtsi
     compatible = "samsung,exynos5410-mipi-dsi";
     (uses bus_clk, pll_clk)

arm/boot/dts/samsung/exynos5800.dtsi
     compatible = "samsung,exynos5422-mipi-dsi";
     (uses bus_clk, pll_clk - uses node from exynos5420.dtsi)

arm64/boot/dts/exynos/exynos5433.dtsi
     compatible = "samsung,exynos5433-mipi-dsi";
     (uses bus_clk, sclk_mipi, and 3 others as mentioned above)

arm64/boot/dts/freescale/imx8mm.dtsi
     compatible = "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm64/boot/dts/freescale/imx8mn.dtsi
     compatible = "fsl,imx8mn-mipi-dsim", "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm64/boot/dts/freescale/imx8mp.dtsi
     compatible = "fsl,imx8mp-mipi-dsim";
     (uses bus_clk, sclk_mipi)

So, there shouldn't be any regressions.

> 
> Unless there are objections from other reviewers, I intend to proceed
> with merging this patch.
> If anyone has concerns or sees potential issues with this change,
> please share your thoughts.
> 
> Thanks,
> Inki Dae
> 
