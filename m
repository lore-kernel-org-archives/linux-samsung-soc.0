Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAF0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 10:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344698AbiF1KCw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 06:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241640AbiF1KCa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 06:02:30 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F602F3AF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 03:02:12 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i25so11375333wrc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3ZLTvjDl16WXAfxrYhPgAG4dx8YGkXCU/wb2ZjBGHxQ=;
        b=msmzAW7PSUdijfx025BCp2/8s3pOGKHZjzRWntzmi6KAvV8jW6AQruHlpJe5hJBJ+T
         EM36fcnz/XIBu2v5ab+3p5b9NWV5h9s4w+Y2RWsFE7tH3czqwpsz9Nr3RGgr7QXncXSv
         IqLV58rvPzMwjDi88tiKUSd21vSifDdBvmsrqCLAje/NYaaR98WdoEfymvhd8dnDnIqD
         vyxsP4pEjPBuji0NZGr+bHgoOIbvX8wbqQ4R5jSCelXDfwmjbKNLdBD3IVFK4DMOZAkr
         ED6qGkg/LjDsKf6P3IrWkWIKh07p7qquUuFXS/yYJgTyDMy9zWksPt0WrKG+V4FZouU/
         5n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3ZLTvjDl16WXAfxrYhPgAG4dx8YGkXCU/wb2ZjBGHxQ=;
        b=Or8g64mbTAghor6NIGRRlJGRaQW485xs6FaFi/h8a+JYbTHN6lcOtnz/PiyVYe3G2i
         VZH0bkORO5WvgaMowbG6oMiEPfJW363X2rZw64x4N1RXl1k7rfi4IbQ0VVkrC8mweGOF
         7+bWgVlIA59MXMiPEyRAbUsV67bM/M9QiHXIy9OznKy3ZnLgBBRBT5QZItcT5Lhjw0KY
         oFLc/4DnDAlgv4WFh+ilpnjnAGWpttSwS8ppBxTidd6CWQ4YpJLvP8mAuiEptG30UfQm
         Qn63ljyWF9Rh8kYCiMuqJgvrx1OnU+WGDmGS+l6RhoCxlgPrXdblq6MmS+HrMvBRn/vw
         B2Lw==
X-Gm-Message-State: AJIora9WW0f5RElMLQNAPT2q18k+w3AMjg80VZNaa505Y/XnfW4EJ6eE
        Ad2ZbDQDoCjqMSWXyp+lR9tT9w==
X-Google-Smtp-Source: AGRyM1ticr0v/IxsOpoo3bMVweszhCvDeSWbd9rkPrNp8Fcov6Tmwht2shB+7n3Tz1p27DACrMqxkw==
X-Received: by 2002:a05:6000:1d84:b0:20e:5fae:6e71 with SMTP id bk4-20020a0560001d8400b0020e5fae6e71mr16980710wrb.224.1656410530736;
        Tue, 28 Jun 2022 03:02:10 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c3-20020adfef43000000b0021bab0ba755sm13629129wrp.106.2022.06.28.03.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 03:02:09 -0700 (PDT)
Message-ID: <354b2ae2-92b4-bb56-387a-599f0451a1c0@linaro.org>
Date:   Tue, 28 Jun 2022 12:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
        'Tomasz Figa' <tomasz.figa@gmail.com>,
        'Chanwoo Choi' <cw00.choi@samsung.com>,
        'Stephen Boyd' <sboyd@kernel.org>,
        'Michael Turquette' <mturquette@baylibre.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>
Cc:     'Alim Akhtar' <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220627005210.6473-1-chanho61.park@samsung.com>
 <CGME20220627005413epcas2p39750fb5876366881b8535ee516c1bebe@epcas2p3.samsung.com>
 <20220627005210.6473-2-chanho61.park@samsung.com>
 <0e9aab63-7ddf-dead-11b2-4ba81235dcb4@linaro.org>
 <001901d88a94$e87208d0$b9561a70$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <001901d88a94$e87208d0$b9561a70$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/06/2022 04:15, Chanho Park wrote:
>> Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov9: correct clock
>> numbering of peric0/c1
>>
>> On 27/06/2022 02:52, Chanho Park wrote:
>>> There are duplicated definitions of peric0 and peric1 cmu blocks.
>>> Thus, they should be defined correctly as numerical order.
>>>
>>> Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding
>>> definitions for Exynos Auto v9")
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>> ---
>>>  .../dt-bindings/clock/samsung,exynosautov9.h  | 56
>>> +++++++++----------
>>>  1 file changed, 28 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h
>>> b/include/dt-bindings/clock/samsung,exynosautov9.h
>>> index ea9f91b4eb1a..a7db6516593f 100644
>>> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
>>> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
>>> @@ -226,21 +226,21 @@
>>>  #define CLK_GOUT_PERIC0_IPCLK_8		28
>>>  #define CLK_GOUT_PERIC0_IPCLK_9		29
>>>  #define CLK_GOUT_PERIC0_IPCLK_10	30
>>> -#define CLK_GOUT_PERIC0_IPCLK_11	30
>>> -#define CLK_GOUT_PERIC0_PCLK_0		31
>>> -#define CLK_GOUT_PERIC0_PCLK_1		32
>>> -#define CLK_GOUT_PERIC0_PCLK_2		33
>>> -#define CLK_GOUT_PERIC0_PCLK_3		34
>>> -#define CLK_GOUT_PERIC0_PCLK_4		35
>>> -#define CLK_GOUT_PERIC0_PCLK_5		36
>>> -#define CLK_GOUT_PERIC0_PCLK_6		37
>>> -#define CLK_GOUT_PERIC0_PCLK_7		38
>>> -#define CLK_GOUT_PERIC0_PCLK_8		39
>>> -#define CLK_GOUT_PERIC0_PCLK_9		40
>>> -#define CLK_GOUT_PERIC0_PCLK_10		41
>>> -#define CLK_GOUT_PERIC0_PCLK_11		42
>>> +#define CLK_GOUT_PERIC0_IPCLK_11	31
>>> +#define CLK_GOUT_PERIC0_PCLK_0		32
>>> +#define CLK_GOUT_PERIC0_PCLK_1		33
>>
>> Is this a fix for current cycle? If yes, it's ok, otherwise all other IDs
>> should not be changed, because it's part of ABI.
> 
> What is the current cycle? 5.19-rc or 5.20?
> I prefer this goes on 5.19-rc but if it's not possible due to the ABI breakage, I'm okay this can be going to v5.20.

The change was introduced indeed in v5.19-rc1, so this should go to
current cycle as well (v5.19) and your patch is fine.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Sylwester or Stephen,

Please kindly grab it for fixes.

Best regards,
Krzysztof
