Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CF9C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 19:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiF2Thb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiF2Th3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:37:29 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8572A974;
        Wed, 29 Jun 2022 12:37:28 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id t21so16048320pfq.1;
        Wed, 29 Jun 2022 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nVljD5oLl6hQuj5pATfqJir0rho8dqvvmzQlrj5p444=;
        b=YYvYwza9tY8TgaITRCFl9eFJ8b1U3i0rllJju+jkRL8HPJmKM/VboeW4p4gPiIHZrp
         71TQEoKHfwVFSZUlk8HSoKB2k017W008uAKi1BNDXZsJRcMafY6i0Gt2l2lMNfAkVnZY
         Val3neNZ09JdbQJAhu7FHtyBb5PeH74nKyyV9QYw6w5EPciVwdAEk4wbkwIWDYKzOH8C
         SzolNwkDEoF+ppFoiLX1i5TEOimP2xRsvNjfKSZOMIoPgqG/u1LNTNV2Bf9HKgMU7Mp6
         y7yaPHeQjb3SKc7Mt+nKF5UfuMau7UgKl9RorV1Bl6P4Xw79fcDIhPkkJZvxNA+F57cH
         QkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nVljD5oLl6hQuj5pATfqJir0rho8dqvvmzQlrj5p444=;
        b=Sxmwt10IVCfY5+tQGtG/7zDU++La2LfpItPK3ooIb6WINXlzWEzBiwE0AGv/iOPsQk
         ytez2V+dEkBK2VDmm8UD9r6jkRJpydz1cIH2XSIP081b22UDFdxNomznVHskvV4oNlww
         9JcEvFp6FJgb3PUBeyUoNA0E+qHQ0dAfEggUBd0+NZaav6PjhFOO56qVOZdT2D2wQikE
         jpdkG44XHwOO1l+IyKw2VLT7laT7sOIoDgPlLKlG3cujMlrWRTzY+0ckXcJ18gd7K6B0
         DVvSI+woH9kAcfWYn2/b5bzP0urGSdfqS4xbctOHrXEI5IaA0WLJ3Jra2YXJrO5n8jZW
         lNqA==
X-Gm-Message-State: AJIora+cEAOF0GIzLYC6+4XSGGYIlSR0E8GigPZM4HwK9fVcNPXWDAqu
        KrHC+WbyC91BjGPyV8DNgkQ=
X-Google-Smtp-Source: AGRyM1tVZxsqo72VbYdoiFw+o+OzJozwE9iTlNkf+A/xADuv0EAl8f7bIaVhO2Muteu4GHAXLbXK8Q==
X-Received: by 2002:a63:7448:0:b0:40c:7d4b:e7c6 with SMTP id e8-20020a637448000000b0040c7d4be7c6mr4222497pgn.140.1656531448347;
        Wed, 29 Jun 2022 12:37:28 -0700 (PDT)
Received: from [172.30.1.37] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id m20-20020a170902c45400b0016a8010218bsm8087881plm.27.2022.06.29.12.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 12:37:27 -0700 (PDT)
Message-ID: <7415fba0-ac04-e764-aa46-2c63b8568ac3@gmail.com>
Date:   Thu, 30 Jun 2022 04:37:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] clk: samsung: exynosautov9: correct register
 offsets of peric0/c1
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
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220628104138.152118-1-chanho61.park@samsung.com>
 <CGME20220628104347epcas2p48a7fe482ad82004c145fcf90e32eaec6@epcas2p4.samsung.com>
 <20220628104138.152118-4-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220628104138.152118-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 6. 28. 19:41, Chanho Park wrote:
> Some register offsets of peric0 and peric1 cmu blocks need to be
> corrected and re-ordered by numerical order.
> 
> Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
> Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
> index c5a4e1bee711..76c4841f2970 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -1170,9 +1170,9 @@ static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2	0x2058
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3	0x205c
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4	0x2060
> -#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5	0x2064
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6	0x2068
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8	0x2070
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9	0x2074
>  #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10	0x204c
> @@ -1422,14 +1422,14 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
>  #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11	0x2020
>  #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0	0x2044
>  #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1	0x2048
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2058
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x205c
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x2060
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x206c
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2064
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2068
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x2070
> -#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2074
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2054
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x2058
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x205c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2060
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2064
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x2068
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x206c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2070
>  #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10	0x204c
>  #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11	0x2050
>  
> @@ -1467,9 +1467,9 @@ static const unsigned long peric1_clk_regs[] __initconst = {
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
> -	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6,
> +	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9,
>  	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks for fixup.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
