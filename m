Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908F2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 19:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiF2Tf0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiF2Tf0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:35:26 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7950824F34;
        Wed, 29 Jun 2022 12:35:25 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n10so15069405plp.0;
        Wed, 29 Jun 2022 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=95tsqSF2Ws9PMfR7VFWcKYhRBNRzo4H5AayEf5+qB6E=;
        b=FXGcn12ayu8cSdqOn4sMuwij6qtgTiHXt2Fd0YvO6ME2BWWqPfnuI1k2B/91tB+Q0M
         6Vth+og7OY4cnrtLrJrLcM39L+DfQBKeQVmuSSx6Pv7fI4DOsRiOzssIdolMK4JbFRLW
         2aXLGnOraRoW7NmvKUvQDPw2ygUTG0ebZe7w1zezPMw3AE1ZjzXk43+E/q86e2QAqBiT
         W2yFHpuwDwptQEgwWE3arPl8GCuiqhi/lPHhSehEexmi1yftegL4/mJ0jEI6gbtz6Fl0
         hN7I1Uq6OzMXVJNHQBTf3LHVs4Khzu7NTNcwU3xT8Av0E39aIzt6nYLzV9hCJprKXuIU
         c2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=95tsqSF2Ws9PMfR7VFWcKYhRBNRzo4H5AayEf5+qB6E=;
        b=ADGThnX0sQnBEWmL9/7DVWsyAivoT0dC0lgBq74Kpsjawu16MWKWuwLwUEIbttuyTe
         VOOuPthwp4MUs2lDMmvQZoJ3vIrcss7wKYjsJUQqTQF9G/U+7P7cT90A2UaWauNh4DHH
         W16+a9mFMW5lgzxwJPNCvVO8+POOCPjACBnuyVuq0EMdneE9z7iI1iLkc2Af2adLgoAw
         D/cqVWYouQ7k67pHDRNX+cwprDgkLQhFNS9ue7OJ/pkCYep0NaEvD9GfXlFqxq9E67Ka
         KtMy7n1PODZKO3onDs4CWeSqigh5RIojsygBs3AcXKmSNmeDrTuK8ux8Yj0Jp8FJuBxh
         Jf8A==
X-Gm-Message-State: AJIora/nAbvra069glkrDTADzoDUjuWTJSZ895YMAXk4ww50JfEJNBoN
        DXI1UUBR2vT2Sa3nYs6NHqE=
X-Google-Smtp-Source: AGRyM1uTv93YeAbb2qcUV2vW85PLlkMZW/1a9/1J+ejy5hErxW6fnZGq/tikgsWmaclxnRrask1y+A==
X-Received: by 2002:a17:902:ce0a:b0:16b:9021:a5f4 with SMTP id k10-20020a170902ce0a00b0016b9021a5f4mr9561758plg.6.1656531324975;
        Wed, 29 Jun 2022 12:35:24 -0700 (PDT)
Received: from [172.30.1.37] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b0016b90620910sm4079072plh.71.2022.06.29.12.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 12:35:24 -0700 (PDT)
Message-ID: <03f91699-f6f5-883d-14ae-2da193b59051@gmail.com>
Date:   Thu, 30 Jun 2022 04:35:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
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
 <CGME20220628104347epcas2p3cc1c9c7b17a449814fc2596f00052985@epcas2p3.samsung.com>
 <20220628104138.152118-2-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220628104138.152118-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 6. 28. 19:41, Chanho Park wrote:
> There are duplicated definitions of peric0 and peric1 cmu blocks. Thus,
> they should be defined correctly as numerical order.
> 
> Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
> index ea9f91b4eb1a..a7db6516593f 100644
> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> @@ -226,21 +226,21 @@
>  #define CLK_GOUT_PERIC0_IPCLK_8		28
>  #define CLK_GOUT_PERIC0_IPCLK_9		29
>  #define CLK_GOUT_PERIC0_IPCLK_10	30
> -#define CLK_GOUT_PERIC0_IPCLK_11	30
> -#define CLK_GOUT_PERIC0_PCLK_0		31
> -#define CLK_GOUT_PERIC0_PCLK_1		32
> -#define CLK_GOUT_PERIC0_PCLK_2		33
> -#define CLK_GOUT_PERIC0_PCLK_3		34
> -#define CLK_GOUT_PERIC0_PCLK_4		35
> -#define CLK_GOUT_PERIC0_PCLK_5		36
> -#define CLK_GOUT_PERIC0_PCLK_6		37
> -#define CLK_GOUT_PERIC0_PCLK_7		38
> -#define CLK_GOUT_PERIC0_PCLK_8		39
> -#define CLK_GOUT_PERIC0_PCLK_9		40
> -#define CLK_GOUT_PERIC0_PCLK_10		41
> -#define CLK_GOUT_PERIC0_PCLK_11		42
> +#define CLK_GOUT_PERIC0_IPCLK_11	31
> +#define CLK_GOUT_PERIC0_PCLK_0		32
> +#define CLK_GOUT_PERIC0_PCLK_1		33
> +#define CLK_GOUT_PERIC0_PCLK_2		34
> +#define CLK_GOUT_PERIC0_PCLK_3		35
> +#define CLK_GOUT_PERIC0_PCLK_4		36
> +#define CLK_GOUT_PERIC0_PCLK_5		37
> +#define CLK_GOUT_PERIC0_PCLK_6		38
> +#define CLK_GOUT_PERIC0_PCLK_7		39
> +#define CLK_GOUT_PERIC0_PCLK_8		40
> +#define CLK_GOUT_PERIC0_PCLK_9		41
> +#define CLK_GOUT_PERIC0_PCLK_10		42
> +#define CLK_GOUT_PERIC0_PCLK_11		43
>  
> -#define PERIC0_NR_CLK			43
> +#define PERIC0_NR_CLK			44
>  
>  /* CMU_PERIC1 */
>  #define CLK_MOUT_PERIC1_BUS_USER	1
> @@ -272,21 +272,21 @@
>  #define CLK_GOUT_PERIC1_IPCLK_8		28
>  #define CLK_GOUT_PERIC1_IPCLK_9		29
>  #define CLK_GOUT_PERIC1_IPCLK_10	30
> -#define CLK_GOUT_PERIC1_IPCLK_11	30
> -#define CLK_GOUT_PERIC1_PCLK_0		31
> -#define CLK_GOUT_PERIC1_PCLK_1		32
> -#define CLK_GOUT_PERIC1_PCLK_2		33
> -#define CLK_GOUT_PERIC1_PCLK_3		34
> -#define CLK_GOUT_PERIC1_PCLK_4		35
> -#define CLK_GOUT_PERIC1_PCLK_5		36
> -#define CLK_GOUT_PERIC1_PCLK_6		37
> -#define CLK_GOUT_PERIC1_PCLK_7		38
> -#define CLK_GOUT_PERIC1_PCLK_8		39
> -#define CLK_GOUT_PERIC1_PCLK_9		40
> -#define CLK_GOUT_PERIC1_PCLK_10		41
> -#define CLK_GOUT_PERIC1_PCLK_11		42
> +#define CLK_GOUT_PERIC1_IPCLK_11	31
> +#define CLK_GOUT_PERIC1_PCLK_0		32
> +#define CLK_GOUT_PERIC1_PCLK_1		33
> +#define CLK_GOUT_PERIC1_PCLK_2		34
> +#define CLK_GOUT_PERIC1_PCLK_3		35
> +#define CLK_GOUT_PERIC1_PCLK_4		36
> +#define CLK_GOUT_PERIC1_PCLK_5		37
> +#define CLK_GOUT_PERIC1_PCLK_6		38
> +#define CLK_GOUT_PERIC1_PCLK_7		39
> +#define CLK_GOUT_PERIC1_PCLK_8		40
> +#define CLK_GOUT_PERIC1_PCLK_9		41
> +#define CLK_GOUT_PERIC1_PCLK_10		42
> +#define CLK_GOUT_PERIC1_PCLK_11		43
>  
> -#define PERIC1_NR_CLK			43
> +#define PERIC1_NR_CLK			44
>  
>  /* CMU_PERIS */
>  #define CLK_MOUT_PERIS_BUS_USER		1

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
