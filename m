Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B4FC19F28
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Aug 2022 17:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbiHCRPM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Aug 2022 13:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbiHCRPK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Aug 2022 13:15:10 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B786753D0A;
        Wed,  3 Aug 2022 10:15:08 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id v16-20020a17090abb9000b001f25244c65dso2689650pjr.2;
        Wed, 03 Aug 2022 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XdSlOXuHhhIbWVCv4buM9Zz2HBRydczrfgZXVip4PUM=;
        b=odUn1ZstSMUDN2+OzuFWixJp1LJv9UA1r10GnSgKfYx+OY+Am6YE4uzDOmfRsBPE1d
         dPOIHKm6VD3d6J9cx7abBsIYNh3zJk+HCncxQrvRSG9vMd2m8qZ9UcMGLFjrZJONx7/a
         MxI0/mwq1a/Jq+pYAdSA+lHX2rErhj5fN4crAgTeZiQpllZlm/CW4h2WKXh3hn/ci3FB
         0kOsYxuGWjLqenKj1U1rWgNXxgEJ4IZpq9oWMFIt8aQ82fEjkbtLJZYDPPc62jrFBhP2
         rJTeEUC472Q9qR9yBsLzpzfp3i1ruVyiIIwqbb1Ki6zOuHqRe6wmXBaY3/4zzPEkrFdk
         i00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XdSlOXuHhhIbWVCv4buM9Zz2HBRydczrfgZXVip4PUM=;
        b=T8uHInPOrTJein9dY4Rn355LWSQDiU//XejoOAYyLEVK6nS/5wmlyiHgLiBQyI3L9x
         SIQ/k4O0xYLPYXWtgAvwwAWm1aeDfCbxuuGJBrh9CSALmhx0aTLNy9K6TjagINajcKV9
         5Jskl6KDT61y9CxHaKtfMSUbKkZcCEvdDX9gS38vQ/OHuW97rrDKAvd9wkKuLjXz+ONW
         s/sK6Mea2IW8J/GL8X6wmNYGlPyH4qcSbg1TlHFtnYmqLxwJHVbphPMh1HNmupjbHc4V
         LbFWKLwQpetPN6eFo7jnXRDERD+eQxqzGMUBumNhRyGttppUdShw3FL6qsB+bOWA3sZy
         RxdQ==
X-Gm-Message-State: ACgBeo22daBwaJy1sA5+zti77Rg0TJBQ4pGeMlHpgsJki1C+rm41UjAm
        krm060/t0ajyyhgLJ3l9Sks=
X-Google-Smtp-Source: AA6agR5RAm+oqvuu7bYVzVzrfgIb3EeQRLD32uN+b4RbV8Ixqv0wH9Ee4udgR9bdIu4DKoTX/RHIVQ==
X-Received: by 2002:a17:902:c7c4:b0:16e:d968:6343 with SMTP id r4-20020a170902c7c400b0016ed9686343mr19246695pla.133.1659546907788;
        Wed, 03 Aug 2022 10:15:07 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b0016dbaf3ff2esm2347101plk.22.2022.08.03.10.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 10:15:07 -0700 (PDT)
Message-ID: <52758b63-1bf9-2ffb-2970-7be37c3baea3@gmail.com>
Date:   Thu, 4 Aug 2022 02:15:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/6] clk: samsung: exynosautov9: add fsys1 clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1659054220.git.chanho61.park@samsung.com>
 <CGME20220729003612epcas2p4cd006dcd814ff49583aa44921fbbed5a@epcas2p4.samsung.com>
 <d4aa967538fed9667e9550a256e545026fc2fa8d.1659054220.git.chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <d4aa967538fed9667e9550a256e545026fc2fa8d.1659054220.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 29. 09:30, Chanho Park wrote:
> CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
> mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
> source clock provider.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 130 +++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
> index 527a6837661e..196d8b023907 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -1307,6 +1307,133 @@ static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
>  	.clk_name		= "dout_clkcmu_fsys0_bus",
>  };
>  
> +/* ---- CMU_FSYS1 ---------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_FSYS1 (0x17040000) */
> +#define PLL_LOCKTIME_PLL_MMC			0x0000
> +#define PLL_CON0_PLL_MMC			0x0100
> +#define PLL_CON3_PLL_MMC			0x010c
> +#define PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER	0x0600
> +#define PLL_CON0_MUX_CLKCMU_FSYS1_MMC_CARD_USER	0x0610
> +#define PLL_CON0_MUX_CLKCMU_FSYS1_USBDRD_USER	0x0620
> +
> +#define CLK_CON_MUX_MUX_CLK_FSYS1_MMC_CARD	0x1000
> +#define CLK_CON_DIV_DIV_CLK_FSYS1_MMC_CARD	0x1800
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_FSYS1_CMU_FSYS1_IPCLKPORT_PCLK	0x2018
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_SDCLKIN	0x202c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_I_ACLK	0x2028
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_0_REF_CLK_40		0x204c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_1_REF_CLK_40		0x2058
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_0_REF_CLK_40		0x2064
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_1_REF_CLK_40		0x2070
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_0_IPCLKPORT_ACLK	0x2074
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_1_IPCLKPORT_ACLK	0x2078
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_0_IPCLKPORT_ACLK	0x207c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_1_IPCLKPORT_ACLK	0x2080
> +
> +static const unsigned long fsys1_clk_regs[] __initconst = {
> +	PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER,
> +};
> +
> +static const struct samsung_pll_clock fsys1_pll_clks[] __initconst = {
> +	PLL(pll_0831x, FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
> +};
> +
> +/* List of parent clocks for Muxes in CMU_FSYS1 */
> +PNAME(mout_fsys1_bus_user_p) = { "oscclk", "dout_clkcmu_fsys1_bus" };
> +PNAME(mout_fsys1_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
> +PNAME(mout_fsys1_mmc_card_user_p) = { "oscclk", "gout_clkcmu_fsys1_mmc_card" };
> +PNAME(mout_fsys1_usbdrd_user_p) = { "oscclk", "dout_clkcmu_fsys1_usbdrd" };
> +PNAME(mout_fsys1_mmc_card_p) = { "mout_fsys1_mmc_card_user",
> +				 "mout_fsys1_mmc_pll" };
> +
> +static const struct samsung_mux_clock fsys1_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_FSYS1_BUS_USER, "mout_fsys1_bus_user",
> +	    mout_fsys1_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER, 4, 1),
> +	MUX(CLK_MOUT_FSYS1_MMC_PLL, "mout_fsys1_mmc_pll", mout_fsys1_mmc_pll_p,
> +	    PLL_CON0_PLL_MMC, 4, 1),
> +	MUX(CLK_MOUT_FSYS1_MMC_CARD_USER, "mout_fsys1_mmc_card_user",
> +	    mout_fsys1_mmc_card_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_MMC_CARD_USER,
> +	    4, 1),
> +	MUX(CLK_MOUT_FSYS1_USBDRD_USER, "mout_fsys1_usbdrd_user",
> +	    mout_fsys1_usbdrd_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_USBDRD_USER,
> +	    4, 1),
> +	MUX(CLK_MOUT_FSYS1_MMC_CARD, "mout_fsys1_mmc_card",
> +	    mout_fsys1_mmc_card_p, CLK_CON_MUX_MUX_CLK_FSYS1_MMC_CARD,
> +	    0, 1),
> +};
> +
> +static const struct samsung_div_clock fsys1_div_clks[] __initconst = {
> +	DIV(CLK_DOUT_FSYS1_MMC_CARD, "dout_fsys1_mmc_card",
> +	    "mout_fsys1_mmc_card",
> +	    CLK_CON_DIV_DIV_CLK_FSYS1_MMC_CARD, 0, 9),
> +};
> +
> +static const struct samsung_gate_clock fsys1_gate_clks[] __initconst = {
> +	GATE(CLK_GOUT_FSYS1_PCLK, "gout_fsys1_pclk", "mout_fsys1_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_FSYS1_CMU_FSYS1_IPCLKPORT_PCLK,
> +	     21, CLK_IGNORE_UNUSED, 0),
> +	GATE(CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN, "gout_fsys1_mmc_card_sdclkin",
> +	     "dout_fsys1_mmc_card",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_SDCLKIN,
> +	     21, CLK_SET_RATE_PARENT, 0),
> +	GATE(CLK_GOUT_FSYS1_MMC_CARD_ACLK, "gout_fsys1_mmc_card_aclk",
> +	     "dout_fsys1_mmc_card",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_MMC_CARD_IPCLKPORT_I_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB20DRD_0_REFCLK, "gout_fsys1_usb20drd_0_refclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_0_REF_CLK_40,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB20DRD_1_REFCLK, "gout_fsys1_usb20drd_1_refclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB20DRD_1_REF_CLK_40,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB30DRD_0_REFCLK, "gout_fsys1_usb30drd_0_refclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_0_REF_CLK_40,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB30DRD_1_REFCLK, "gout_fsys1_usb30drd_1_refclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_USB30DRD_1_REF_CLK_40,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB20_0_ACLK, "gout_fsys1_usb20_0_aclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_0_IPCLKPORT_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB20_1_ACLK, "gout_fsys1_usb20_1_aclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB2_1_IPCLKPORT_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB30_0_ACLK, "gout_fsys1_usb30_0_aclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_0_IPCLKPORT_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS1_USB30_1_ACLK, "gout_fsys1_usb30_1_aclk",
> +	     "mout_fsys1_usbdrd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS1_UID_US_D_USB3_1_IPCLKPORT_ACLK,
> +	     21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info fsys1_cmu_info __initconst = {
> +	.pll_clks		= fsys1_pll_clks,
> +	.nr_pll_clks		= ARRAY_SIZE(fsys1_pll_clks),
> +	.mux_clks		= fsys1_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(fsys1_mux_clks),
> +	.div_clks		= fsys1_div_clks,
> +	.nr_div_clks		= ARRAY_SIZE(fsys1_div_clks),
> +	.gate_clks		= fsys1_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
> +	.nr_clk_ids		= FSYS1_NR_CLK,
> +	.clk_regs		= fsys1_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
> +	.clk_name		= "dout_clkcmu_fsys1_bus",
> +};
> +
>  /* ---- CMU_FSYS2 ---------------------------------------------------------- */
>  
>  /* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
> @@ -1944,6 +2071,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
>  	}, {
>  		.compatible = "samsung,exynosautov9-cmu-fsys0",
>  		.data = &fsys0_cmu_info,
> +	}, {
> +		.compatible = "samsung,exynosautov9-cmu-fsys1",
> +		.data = &fsys1_cmu_info,
>  	}, {
>  		.compatible = "samsung,exynosautov9-cmu-fsys2",
>  		.data = &fsys2_cmu_info,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
