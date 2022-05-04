Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5D6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 13:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350324AbiEDNLR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 09:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350363AbiEDNKs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 09:10:48 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF89E4162B;
        Wed,  4 May 2022 06:06:55 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gj17-20020a17090b109100b001d8b390f77bso5145597pjb.1;
        Wed, 04 May 2022 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tzAglf2P74RIzOdpcjaAukRCEK+uQqQK+2svTf9U68Y=;
        b=eIsuqhRlE8VLYWW6BY0bJ79rKktJEw8vA/lLHhKQvTDWR/YitCWqIgr3SSfsZzlHch
         L9Nn5NXt7kIUz3UU+zQct9AeNHQwYgYB6vaKd8yHkQKLannR5qQkOeLzGEVA/z9wNJXN
         ycYtsvNefw11laWhAJI9wxSmQ6f1RWwX5UBT45Wi2Aa+PmwPQTTIMlRRHb9uEf+S3piA
         bEbRLEgrqCuP7Wof6sMThejDoIYETTZWx3MCDk0r7+DRPfIqYUxFj2QgoIE1GKYSeaU0
         COii/ZoN9j+fQqknntj9aXvVsy+vixEx7VrOtsQtQJJ0zYk5BhtRaGXy7NF5ltvH7PsD
         +MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tzAglf2P74RIzOdpcjaAukRCEK+uQqQK+2svTf9U68Y=;
        b=HaumAIVB9cQo1SzTnnHwLjD4vmwtgCciBilF6BgrNGKu7dZ/lxBDfv0sSftzJxf/FQ
         TgT1dDF5BVQhlMqSro25KzYAsRE6tzxGhc9LgwnRZNF2m6yzUIR919TQqH/PdgN1s/er
         BXWAOwRxUL5xDR91JyTZeIlV2w/3Cd2l+aUg5qHjQ76giAjfRG4nyEo7zYX/CojaYZhx
         YIXWBdetUNzRW9M0V2fBxj5hT0Qj78glsgOHS6RaA6lJPZMs0VUCazEwBcWwcBz0Y62/
         gmz7wwtEkMhIKSFzlYR3hwlBbNxD7MV/UYZG+5DZl0nf9OPjDhJwdAxuYRTMH2HVINbY
         MJOg==
X-Gm-Message-State: AOAM533yf702Ld6lMbHHpMzIczPpoL6eN1fhnr5G2sCPYWXUBuUswCVJ
        0eWfvKKbEtdrAzWEOOZDe3Y=
X-Google-Smtp-Source: ABdhPJynl9WGVqAN/WLfbf3ccGPwlwy6RcWNd/vHGTHWDEj+Iq4bzMV2ZA0lEyMusoDE77rQQBZVJQ==
X-Received: by 2002:a17:902:9696:b0:158:f809:310e with SMTP id n22-20020a170902969600b00158f809310emr21850048plp.16.1651669615024;
        Wed, 04 May 2022 06:06:55 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id y17-20020aa78051000000b0050dc76281b2sm8421018pfm.140.2022.05.04.06.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 06:06:54 -0700 (PDT)
Message-ID: <0d5ab941-7fa3-85f2-263b-f7b701595b7f@gmail.com>
Date:   Wed, 4 May 2022 22:06:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 07/12] clk: samsung: exynosautov9: add cmu_fsys2 clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075004epcas2p20f2dca86b740d0ff9471f09a90556a34@epcas2p2.samsung.com>
 <20220504075154.58819-8-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-8-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> CMU_FSYS2 is responsible to control clocks of BLK_FSYS2 which includes
> ufs and ethernet IPs. This patch adds some essential clocks to be
> controlled by ethernet/ufs drivers instead of listing full clocks.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynosautov9.c | 69 ++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
> index aaa78b921fde..8c6ecd3f3eeb 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -1067,6 +1067,73 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
>   	.clk_name		= "dout_clkcmu_core_bus",
>   };
>   
> +/* ---- CMU_FSYS2 ---------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
> +#define PLL_CON0_MUX_CLKCMU_FSYS2_BUS_USER	0x0600
> +#define PLL_CON0_MUX_CLKCMU_FSYS2_UFS_EMBD_USER	0x0620
> +#define PLL_CON0_MUX_CLKCMU_FSYS2_ETHERNET_USER	0x0610
> +#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_ACLK	0x2098
> +#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_CLK_UNIPRO	0x209c
> +#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_ACLK	0x20a4
> +#define CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_CLK_UNIPRO	0x20a8
> +
> +static const unsigned long fsys2_clk_regs[] __initconst = {
> +	PLL_CON0_MUX_CLKCMU_FSYS2_BUS_USER,
> +	PLL_CON0_MUX_CLKCMU_FSYS2_UFS_EMBD_USER,
> +	PLL_CON0_MUX_CLKCMU_FSYS2_ETHERNET_USER,
> +	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_CLK_UNIPRO,
> +	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_CLK_UNIPRO,
> +};
> +
> +/* List of parent clocks for Muxes in CMU_FSYS2 */
> +PNAME(mout_fsys2_bus_user_p) = { "oscclk", "dout_clkcmu_fsys2_bus" };
> +PNAME(mout_fsys2_ufs_embd_user_p) = { "oscclk", "dout_clkcmu_fsys2_ufs_embd" };
> +PNAME(mout_fsys2_ethernet_user_p) = { "oscclk", "dout_clkcmu_fsys2_ethernet" };
> +
> +static const struct samsung_mux_clock fsys2_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_FSYS2_BUS_USER, "mout_fsys2_bus_user",
> +	    mout_fsys2_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS2_BUS_USER, 4, 1),
> +	MUX(CLK_MOUT_FSYS2_UFS_EMBD_USER, "mout_fsys2_ufs_embd_user",
> +	    mout_fsys2_ufs_embd_user_p,
> +	    PLL_CON0_MUX_CLKCMU_FSYS2_UFS_EMBD_USER, 4, 1),
> +	MUX(CLK_MOUT_FSYS2_ETHERNET_USER, "mout_fsys2_ethernet_user",
> +	    mout_fsys2_ethernet_user_p,
> +	    PLL_CON0_MUX_CLKCMU_FSYS2_ETHERNET_USER, 4, 1),
> +};
> +
> +static const struct samsung_gate_clock fsys2_gate_clks[] __initconst = {
> +	GATE(CLK_GOUT_FSYS2_UFS_EMBD0_ACLK, "gout_fsys2_ufs_embd0_aclk",
> +	     "mout_fsys2_ufs_embd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_ACLK, 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_FSYS2_UFS_EMBD0_UNIPRO, "gout_fsys2_ufs_embd0_unipro",
> +	     "mout_fsys2_ufs_embd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD0_IPCLKPORT_I_CLK_UNIPRO,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_FSYS2_UFS_EMBD1_ACLK, "gout_fsys2_ufs_embd1_aclk",
> +	     "mout_fsys2_ufs_embd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_ACLK, 21,
> +	     0, 0),
> +	GATE(CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO, "gout_fsys2_ufs_embd1_unipro",
> +	     "mout_fsys2_ufs_embd_user",
> +	     CLK_CON_GAT_GOUT_BLK_FSYS2_UID_UFS_EMBD1_IPCLKPORT_I_CLK_UNIPRO,
> +	     21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
> +	.mux_clks		= fsys2_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(fsys2_mux_clks),
> +	.gate_clks		= fsys2_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(fsys2_gate_clks),
> +	.nr_clk_ids		= FSYS2_NR_CLK,
> +	.clk_regs		= fsys2_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(fsys2_clk_regs),
> +	.clk_name		= "dout_clkcmu_fsys2_bus",
> +};
> +
>   /* ---- CMU_PERIS ---------------------------------------------------------- */
>   
>   /* Register Offset definitions for CMU_PERIS (0x10020000) */
> @@ -1133,6 +1200,8 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
>   		.compatible = "samsung,exynosautov9-cmu-core",
>   		.data = &core_cmu_info,
>   	}, {
> +		.compatible = "samsung,exynosautov9-cmu-fsys2",
> +		.data = &fsys2_cmu_info,
>   	}, {
>   		.compatible = "samsung,exynosautov9-cmu-peris",
>   		.data = &peris_cmu_info,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
