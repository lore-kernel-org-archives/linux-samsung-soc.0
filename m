Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891B4C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbiAMMzJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 07:55:09 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51280
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234779AbiAMMzI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 07:55:08 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 24B083FFD0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642078507;
        bh=PXcIYZEVRPMHXKWkXgjZM50R+tkU0aMoN3mUJ6g2+cY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gKOYyBq7iNRT3sI6XgI+bZqnvsucznP17FJQYJl3MK+4iHb+DNQvmYOCYEOEtkibe
         EGjoQovMA89t24E/BvPmS6Zs2ECr3D1Qco6Ur96z4dSJBr41IdaWN9AUIhesAWIUOe
         xQJ3ymz1NdF8Am8DxjDbJsN0mqB13pwFms6LauG39mmbxrhb2gYEC4hmjavbu3Dol6
         AnfKnElk4zuctSCNlds+odCjQw1pHr92FXWdSQTT9YGxU5fDf1/2353fvxGFpqPhze
         0dCVCni9cW3iAq2FoLLWEIdvEjHbVeD4kpf04hj4gLvGCbO2rDQLUydNgmS4OP93/B
         VZ57KpW5QyQJA==
Received: by mail-ed1-f71.google.com with SMTP id m16-20020a056402431000b003fb60bbe0e2so5252908edc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 04:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PXcIYZEVRPMHXKWkXgjZM50R+tkU0aMoN3mUJ6g2+cY=;
        b=wO6vg9EeMtKTWfGiQLvAQY3za4x/04h+JqBD/+n4mvqVdsT3ssScVNeJoStMRrk7+P
         30NbS9puAaSl1zzBjn0vlLVNv3Rk11QYQTxz5j6sP49YwbiqEyLqTgKDmJjIvKVM7NqN
         xDGwM25wCtdWtGuERxX1RdHKm82XZ5Bn5BmaH3PyP+ZXa8EPSQ005XsYbRU+cOwjpWU0
         N42CZ9/szf/TpusR8VI6VIWAlkg8Un1wNkhkMZyZuYa8/9360KbAWZejmaqecdscpWMP
         i3yeUyZyNY+rKTDbgD2wl2RmL8VqH0qEvfqpI6EVhzJI606LHzxnP2tuYzBFof+rz6zS
         +ncQ==
X-Gm-Message-State: AOAM533tKDznX7whObRgF5ug3osI+Ef3+tvBtnfji3Nqv075WoXDc7Iy
        4HExvT0mP1up8kZ4owR8lydyGCHyKWFgzeBejZQ/m0AxgUkVsis7ejcS0mlyzLZ1RQPKrUpEESb
        wUziPf9aUcBjG9Pq96vslMBAbobgX5c2GPeF0ybApSQd6KtkQ
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr3562357ejc.275.1642078505602;
        Thu, 13 Jan 2022 04:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/PYHSMLu1FwH6kqjx8H1obDsFC+1nj4fmqsLiCntlQc4FNn1c4c8k0043PmwcL4VmrIyrgw==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr3562334ejc.275.1642078505371;
        Thu, 13 Jan 2022 04:55:05 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id jg41sm869622ejc.101.2022.01.13.04.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:55:04 -0800 (PST)
Message-ID: <1b246ad6-5b65-a02f-e887-5a07e8f12ec7@canonical.com>
Date:   Thu, 13 Jan 2022 13:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 04/23] clk: samsung: fsd: Add cmu_peric block clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Aswani Reddy <aswani.reddy@samsung.com>,
        Niyas Ahmed S T <niyas.ahmed@samsung.com>,
        Chandrasekar R <rcsekar@samsung.com>,
        Jayati Sahu <jayati.sahu@samsung.com>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122330epcas5p46ae5cd30950b1d9126479231dcf5da49@epcas5p4.samsung.com>
 <20220113121143.22280-5-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-5-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds CMU_PERIC block clock information needed
> for various IPs functions found in this block.

Here and in all other commits, please do not use "This patch". Instead:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Niyas Ahmed S T <niyas.ahmed@samsung.com>
> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 464 +++++++++++++++++++++++++++++++++-
>  1 file changed, 463 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
> index e47523106d9e..6da20966ba99 100644
> --- a/drivers/clk/samsung/clk-fsd.c
> +++ b/drivers/clk/samsung/clk-fsd.c
> @@ -9,12 +9,59 @@
>   *
>   */
>  
> -#include <linux/clk-provider.h>
>  #include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>

Please order the includes alphabetically.

>  
>  #include "clk.h"
>  #include <dt-bindings/clock/fsd-clk.h>
>  
> +/* Gate register bits */
> +#define GATE_MANUAL		BIT(20)
> +#define GATE_ENABLE_HWACG	BIT(28)
> +
> +/* Gate register offsets range */
> +#define GATE_OFF_START		0x2000
> +#define GATE_OFF_END		0x2fff
> +
> +/**
> + * fsd_init_clocks - Set clocks initial configuration
> + * @np:			CMU device tree node with "reg" property (CMU addr)
> + * @reg_offs:		Register offsets array for clocks to init
> + * @reg_offs_len:	Number of register offsets in reg_offs array
> + *
> + * Set manual control mode for all gate clocks.
> + */
> +static void __init fsd_init_clocks(struct device_node *np,
> +		const unsigned long *reg_offs, size_t reg_offs_len)

The same as exynos_arm64_init_clocks - please re-use instead of duplicating.

> +{
> +	void __iomem *reg_base;
> +	size_t i;
> +
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base)
> +		panic("%s: failed to map registers\n", __func__);
> +
> +	for (i = 0; i < reg_offs_len; ++i) {
> +		void __iomem *reg = reg_base + reg_offs[i];
> +		u32 val;
> +
> +		/* Modify only gate clock registers */
> +		if (reg_offs[i] < GATE_OFF_START || reg_offs[i] > GATE_OFF_END)
> +			continue;
> +
> +		val = readl(reg);
> +		val |= GATE_MANUAL;
> +		val &= ~GATE_ENABLE_HWACG;
> +		writel(val, reg);
> +	}
> +
> +	iounmap(reg_base);
> +}
> +

(...)

> +/**
> + * fsd_cmu_probe - Probe function for FSD platform clocks
> + * @pdev: Pointer to platform device
> + *
> + * Configure clock hierarchy for clock domains of FSD platform
> + */
> +static int __init fsd_cmu_probe(struct platform_device *pdev)
> +{
> +	const struct samsung_cmu_info *info;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +
> +	info = of_device_get_match_data(dev);
> +	fsd_init_clocks(np, info->clk_regs, info->nr_clk_regs);
> +	samsung_cmu_register_one(np, info);
> +
> +	/* Keep bus clock running, so it's possible to access CMU registers */
> +	if (info->clk_name) {
> +		struct clk *bus_clk;
> +
> +		bus_clk = clk_get(dev, info->clk_name);
> +		if (IS_ERR(bus_clk)) {
> +			pr_err("%s: could not find bus clock %s; err = %ld\n",
> +			       __func__, info->clk_name, PTR_ERR(bus_clk));
> +		} else {
> +			clk_prepare_enable(bus_clk);
> +		}
> +	}
> +
> +	return 0;
> +}

Please re-use exynos_arm64_register_cmu(). This will also solve my
previous comment about exynos_arm64_init_clocks().

> +
> +/* CMUs which belong to Power Domains and need runtime PM to be implemented */
> +static const struct of_device_id fsd_cmu_of_match[] = {
> +	{
> +		.compatible = "tesla,fsd-clock-peric",
> +		.data = &peric_cmu_info,
> +	}, {
> +	},
> +};
> +
> +static struct platform_driver fsd_cmu_driver __refdata = {
> +	.driver	= {
> +		.name = "fsd-cmu",
> +		.of_match_table = fsd_cmu_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = fsd_cmu_probe,
> +};
> +
> +static int __init fsd_cmu_init(void)
> +{
> +	return platform_driver_register(&fsd_cmu_driver);
> +}
> +core_initcall(fsd_cmu_init);
> 


Best regards,
Krzysztof
