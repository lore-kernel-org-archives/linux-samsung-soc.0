Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAF2C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiG0Ho0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiG0HoZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:44:25 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3EC32054;
        Wed, 27 Jul 2022 00:44:24 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y141so15375963pfb.7;
        Wed, 27 Jul 2022 00:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4aygtT4lo1cj8JI8hKjDImTrxkup0lSJNzDwBwINdwc=;
        b=SL/tKXPCEf7VtTuZwMG9cmdpN/DzlF11aPDZRDgkAP7FQSbVA+yFNi0NdC1Zg3+B6s
         IGy/GVEQ5HMzAZW+/nT/05Qs1cLwZE+EYfNKc+W4Jmw9ZKQfFKFZfXNPNxH3csuIi02R
         kVKala9d1vzptqViGog3LdA9xarwHGjJLee1zjdoDF51IpvHCxHy9XsJhG9imbnBPiAW
         FU5PWh8utWQC5ReepjospFMlCKfIp/y6zKgoZ/UkaDQO2CG6yDKObo4IiPe6QBDBVd2S
         oIVRh4mQuYDP7ClpN4FH3+s5UXFKR6EK1utEdHUv98XADCVwFFE276GANAhJwy0W/+pR
         ijpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4aygtT4lo1cj8JI8hKjDImTrxkup0lSJNzDwBwINdwc=;
        b=RSLhKS0r82N5Lsp37/dPRqCVWABOJYaMXiyFIraYKmEP1BweA//42T5zCPHSTZ/tK4
         MoC2cgTHHqkQfVA3RGuUUvObDM2weioP6WKAZqYRy3ARwH4+U7cnXM9Tg1P3lX4IPXC3
         tZkg6cH7hOU3TsmTlsvWkrQ/yv/3nGrHNrWQM6HZLBR78M7K9HmpUAJqk1Cqfn2nXbIc
         f7Ed7eDfr8XwwslMOk0dWLaRCEH+kvk9lRHNdcJMD0UkC+WXd9wlVTJfzxOxin2pDM0l
         rfJa5JmlY907ZurG04QXctqCYR2qyo73LyM1rfA8xK27cXTjpTQ0vcJPOsJ8kdXJWqc0
         djLw==
X-Gm-Message-State: AJIora/ed0laKreGs/kFbNsLBm+fNpyj7g7Dj4NVsO7ihjPmdShCs7lO
        /C6oLwV2mlFk7QN4rmNY09M=
X-Google-Smtp-Source: AGRyM1tcPMeGWbv7OAaHhObgrDxX6+i0eBL91+y3pQwWE8YIjt2g0XoaVVQ1DImc/CAVwm/RxKlyWg==
X-Received: by 2002:a63:170d:0:b0:415:f76d:45e1 with SMTP id x13-20020a63170d000000b00415f76d45e1mr18122569pgl.171.1658907863479;
        Wed, 27 Jul 2022 00:44:23 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id i12-20020a17090332cc00b0016cf985c0fcsm6340043plr.124.2022.07.27.00.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:44:22 -0700 (PDT)
Message-ID: <6367e91a-efc2-491d-3ed3-7745b36bcc4a@gmail.com>
Date:   Wed, 27 Jul 2022 16:44:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] clk: samsung: exynosautov9: add fsys0 clock support
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
 <CGME20220727060612epcas2p1e79b8d8bfb9e8a3ea351c4dbd7c42b7d@epcas2p1.samsung.com>
 <20220727060146.9228-6-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220727060146.9228-6-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 27. 15:01, Chanho Park wrote:
> CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
> Lanes.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 243 +++++++++++++++++++++++++
>  1 file changed, 243 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
> index d9e1f8e4a7b4..527a6837661e 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -1067,6 +1067,246 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
>  	.clk_name		= "dout_clkcmu_core_bus",
>  };
>  
> +/* ---- CMU_FSYS0 ---------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_FSYS2 (0x17700000) */
> +#define PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER	0x0600
> +#define PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER	0x0610
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK	0x2000
> +
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN	0x2004
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN	0x2008
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN	0x200c
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN	0x2010
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN	0x2014
> +#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN	0x2018
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK	0x205c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK	0x2060
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK	0x2064
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK	0x206c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK	0x2070
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK	0x2074
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PIPE_CLK	0x207c
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK	0x2084
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK	0x2088
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK	0x208c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK	0x2094
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK	0x2098
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK	0x209c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PIPE_CLK	0x20a4
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK		0x20ac
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK	0x20b0
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK		0x20b4
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK		0x20bc
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK	0x20c0
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK		0x20c4
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PIPE_CLK		0x20cc
> +
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK		0x20d4
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK		0x20d8
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK		0x20dc
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK		0x20e0
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK		0x20e4
> +#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK		0x20e8
> +
> +
> +static const unsigned long fsys0_clk_regs[] __initconst = {
> +	PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER,
> +	PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN,
> +	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PIPE_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PIPE_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PIPE_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK,
> +};
> +
> +/* List of parent clocks for Muxes in CMU_FSYS0 */
> +PNAME(mout_fsys0_bus_user_p) = { "oscclk", "dout_clkcmu_fsys0_bus" };
> +PNAME(mout_fsys0_pcie_user_p) = { "oscclk", "dout_clkcmu_fsys0_pcie" };
> +
> +static const struct samsung_mux_clock fsys0_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_FSYS0_BUS_USER, "mout_fsys0_bus_user",
> +	    mout_fsys0_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER, 4, 1),
> +	MUX(CLK_MOUT_FSYS0_PCIE_USER, "mout_fsys0_pcie_user",
> +	    mout_fsys0_pcie_user_p, PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER, 4, 1),
> +};
> +
> +static const struct samsung_gate_clock fsys0_gate_clks[] __initconst = {
> +	GATE(CLK_GOUT_FSYS0_BUS_PCLK, "gout_fsys0_bus_pclk",
> +	     "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK,
> +	     21, CLK_IGNORE_UNUSED, 0),
> +
> +	/* Gen3 2L0 */
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_REFCLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x1_refclk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_REFCLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x2_refclk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_DBI_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x1_dbi_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_MSTR_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x1_mstr_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_SLV_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x1_slv_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_DBI_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x2_dbi_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_MSTR_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x2_mstr_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_SLV_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l0_x2_slv_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_2L0_CLK,
> +	     "gout_fsys0_pcie_gen3a_2l0_clk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_2L0_CLK,
> +	     "gout_fsys0_pcie_gen3b_2l0_clk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK,
> +	     21, 0, 0),
> +
> +	/* Gen3 2L1 */
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_REFCLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x1_refclk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_REFCLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x2_refclk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_DBI_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x1_dbi_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_MSTR_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x1_mstr_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_SLV_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x1_slv_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_DBI_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x2_dbi_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_MSTR_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x2_mstr_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_SLV_ACLK,
> +	     "gout_fsys0_pcie_gen3_2l1_x2_slv_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_2L1_CLK,
> +	     "gout_fsys0_pcie_gen3a_2l1_clk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_2L1_CLK,
> +	     "gout_fsys0_pcie_gen3b_2l1_clk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK,
> +	     21, 0, 0),
> +
> +	/* Gen3 4L */
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_REFCLK,
> +	     "gout_fsys0_pcie_gen3_4l_x2_refclk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_REFCLK,
> +	     "gout_fsys0_pcie_gen3_4l_x4_refclk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_DBI_ACLK,
> +	     "gout_fsys0_pcie_gen3_4l_x2_dbi_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_MSTR_ACLK,
> +	     "gout_fsys0_pcie_gen3_4l_x2_mstr_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_SLV_ACLK,
> +	     "gout_fsys0_pcie_gen3_4l_x2_slv_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_DBI_ACLK,
> +	     "gout_fsys0_pcie_gen3_4l_x4_dbi_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_MSTR_ACLK,
> +	     "gout_fsys0_pcie_gen3_4l_x4_mstr_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_SLV_ACLK,
> +	     "gout_fsys0_pcie_gen3_4l_x4_slv_aclk", "mout_fsys0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_4L_CLK,
> +	     "gout_fsys0_pcie_gen3a_4l_clk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK,
> +	     "gout_fsys0_pcie_gen3b_4l_clk", "mout_fsys0_pcie_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK,
> +	     21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
> +	.mux_clks		= fsys0_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
> +	.gate_clks		= fsys0_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
> +	.nr_clk_ids		= FSYS0_NR_CLK,
> +	.clk_regs		= fsys0_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
> +	.clk_name		= "dout_clkcmu_fsys0_bus",
> +};
> +
>  /* ---- CMU_FSYS2 ---------------------------------------------------------- */
>  
>  /* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
> @@ -1701,6 +1941,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
>  	}, {
>  		.compatible = "samsung,exynosautov9-cmu-core",
>  		.data = &core_cmu_info,
> +	}, {
> +		.compatible = "samsung,exynosautov9-cmu-fsys0",
> +		.data = &fsys0_cmu_info,
>  	}, {
>  		.compatible = "samsung,exynosautov9-cmu-fsys2",
>  		.data = &fsys2_cmu_info,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
