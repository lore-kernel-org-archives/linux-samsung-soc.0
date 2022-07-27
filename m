Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9F0C19F29
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiG0Hog (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiG0Hof (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:44:35 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BB5422CB;
        Wed, 27 Jul 2022 00:44:34 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id y1so7486680pja.4;
        Wed, 27 Jul 2022 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/cHLPO3hHyXzgxRDMsu6+Xfr8jep8qjpQG2Exzn+ess=;
        b=ZcBlWdFBYX62LP2Kgrmbloq9JzBAgZpB/KNeQGy5ovJC5kivY7YfzHTikX0OucSuro
         10p2889xj0w+1qwvpjC4KS9b7UbmJEN7Z+fPtNkc1Ze/j0viHJhmAJnIY9Dm8gI0MWlA
         pJ2XryGAEkaZteUD6f5MuFScvMlb+v4+QtSZoqqJs/xQVMp/SYfMQNI2F++YcgyfaNdw
         fhKac8qSFRWirgXmBVtJ4CTJ4CZLpFTIPrj7gpDCfgQ9PoKCOSEuT4xmhdD409eBjlnG
         5pvp8j4lOTHfEbNj60DHOT8OAMHLRfbFZAVS/KDB5rMxW3NOyBkyGzttqYIKBilUbkQ3
         VxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/cHLPO3hHyXzgxRDMsu6+Xfr8jep8qjpQG2Exzn+ess=;
        b=bPdIe+xzse9I+g8RlU52x/3G2X97bqyWj/RHErWkUZUg5RXDZ7klwJZsyJzhuPB8V6
         jN6/wmHUZrWaEAB7e8ErMSPUnmeSZHsMm5o97aJeqZLFbgK9Esa2WZhQo8oabEAL92FH
         5hTUJaEn9rtPztjSEFeaqgUqz1Zf2Os2FT0ArHD6Tf6rLJHjla7DcsrtKQ/4mluF8MUB
         ywsVK5ECDq2cz517L+BwPozH1sqbwHzb3LIayK6ElFFIC7Mbfiod57Ve2jtk7d87SByo
         pEmskd3GFWWVjS8zblQ0mSbhLHH2FFOb0SeBovsSENg2V3+5m69bhaNtOse0yITO9JQr
         629w==
X-Gm-Message-State: AJIora/pwltRR6fQCs+9TUsZo1+J042AYhz5UoCRAQslz8bAPpZoP4oB
        LCL9jGdMQgS49p98DJakY3I=
X-Google-Smtp-Source: AGRyM1trP7n5X1WhvDQj2RDLu88H6jImQC7o5gr0AH6nXPtm4tvOpS561469Yp4Xz7VOxqokshU1Ew==
X-Received: by 2002:a17:903:1110:b0:16b:6968:1d08 with SMTP id n16-20020a170903111000b0016b69681d08mr20408121plh.3.1658907873485;
        Wed, 27 Jul 2022 00:44:33 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b0016d1e514ec5sm12874624pln.139.2022.07.27.00.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:44:30 -0700 (PDT)
Message-ID: <eae725e0-890a-45b3-296b-4e7c9e3efff5@gmail.com>
Date:   Wed, 27 Jul 2022 16:44:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] clk: samsung: exynosautov9: add fsys1 clock support
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
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p47e21a2545b686d536de47518f7b5c199@epcas2p4.samsung.com>
 <20220727060146.9228-7-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220727060146.9228-7-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 27. 15:01, Chanho Park wrote:
> CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
> mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
> source clock provider.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 129 +++++++++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
> index 527a6837661e..b61eec1244cc 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -1307,6 +1307,132 @@ static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
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
> +PNAME(mout_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
> +PNAME(mout_fsys1_mmc_card_user_p) = { "oscclk", "gout_clkcmu_fsys1_mmc_card" };
> +PNAME(mout_fsys1_usbdrd_user_p) = { "oscclk", "dout_clkcmu_fsys1_usbdrd" };
> +PNAME(mout_fsys1_mmc_card_p) = { "mout_fsys1_mmc_card_user", "mout_mmc_pll" };
> +
> +static const struct samsung_mux_clock fsys1_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_FSYS1_BUS_USER, "mout_fsys1_bus_user",
> +	    mout_fsys1_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS1_BUS_USER, 4, 1),
> +	MUX(CLK_MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
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
> @@ -1944,6 +2070,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
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
