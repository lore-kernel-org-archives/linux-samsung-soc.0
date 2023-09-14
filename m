Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E69EDE98C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Sep 2023 08:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjINIBh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Sep 2023 04:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235939AbjINIBd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 04:01:33 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838B31BFB
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:01:29 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401b0d97850so6619975e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694678488; x=1695283288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=neHhhzHlruzM/bvrwbdgCTOdYr0CjWOhZQjc/HyIrV8=;
        b=ytX8ohi/O3UPOQQi9W8ghuKqmcStYEagdhfO8nUAc+R+H+DAJxz9VR1X92j1wBKkEy
         nC6+6pHzBKc4t5Bfdszaju10fCvDnWoX1V7Hm/HLga8PPoABErBki177GZC1QaG9mCtF
         crpxYmTSKsAkLAnerMDWb09pDB1BoAU2ZrwRZHszeouJSf/4nfaEsuFFRpMj4lubPWqS
         f53WLOhklK/uc9xm0/tRc2S6oNvbkB8MFrmaulq1mS5RY/TVQfLjcYDTQoiet5cx6ns9
         ehobsAw6UwB7f2EtEO3Ble8dtnN7DPOKfcklRNHNMLgnm8650xXN9MfBJc79YczCoSgj
         Q8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694678488; x=1695283288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=neHhhzHlruzM/bvrwbdgCTOdYr0CjWOhZQjc/HyIrV8=;
        b=wo0tkSjxNoIHaaQadAzBRmjnHpAXvBcRLY/ItckLXI40tlgqlgAq7bNLGbdqb61ZDy
         jIGH1GK9eErByQntdmOGYPWpSOrXbALUUMq2AdDB6o3GQUce+b70bC3DyHuVZp81AACp
         R7lvx2Xx1e9Sg3UGE3HKyb7VC1oekXVRKcFYl0xj1089tf7KTasYTNhsA7/5adnLDp5A
         RbU26fL4wsuontchS7w4cmq4zDTkCUanhITYs74P5lOHrq7o9BRbfTngIrxxdhpYIiQP
         wpyPGKF53qqj9b47rQF2bpgr+TkmixOLsDt3DmUe01cAVQZ2NQimVHA1kVwYrY2l5bAZ
         hmFA==
X-Gm-Message-State: AOJu0YwqxgGkoDBldU5FRm6mKXA2QWcBFFsu7O87tpXwtL19aWZBpEDA
        ir+R2ejOCGiMJZOt6ZrfN8wdKg==
X-Google-Smtp-Source: AGHT+IFso3OC//te/RXHvw1AW0IiU72BrrwKpr4DwwZ5HlU8y8W3tOtFzamFowjrziqS++NJdjIMFA==
X-Received: by 2002:a05:600c:219:b0:3fe:f45:772d with SMTP id 25-20020a05600c021900b003fe0f45772dmr3841053wmi.28.1694678487884;
        Thu, 14 Sep 2023 01:01:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id v26-20020a1cf71a000000b003fe1630a8f0sm4126065wmh.24.2023.09.14.01.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:01:25 -0700 (PDT)
Message-ID: <e30a38fd-ea70-d5de-795f-9c8ea3177ac4@linaro.org>
Date:   Thu, 14 Sep 2023 10:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] ARM: dts: exynos: enable polling in Exynos 4210
Content-Language: en-US
To:     Mateusz Majewski <m.majewski2@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CGME20230911133431eucas1p2631e7060cecb0914933ed45b837cf8eb@eucas1p2.samsung.com>
 <20230911133417.14042-1-m.majewski2@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911133417.14042-1-m.majewski2@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/09/2023 15:34, Mateusz Majewski wrote:
> It seems that thermal in Exynos 4210 is broken without this, as it will
> never decrease cooling after increasing it.
> 
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---
> v1 -> v2: Just uploaded separately from all the thermal: exynos:
>   patches with a shorter recipient list, no change otherwise.
> 
>  arch/arm/boot/dts/samsung/exynos4210.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
> index 0e27c3375e2e..aae185b7f91c 100644
> --- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
> @@ -391,8 +391,14 @@ &cpu_alert2 {
>  };
>  
>  &cpu_thermal {
> -	polling-delay-passive = <0>;
> -	polling-delay = <0>;
> +	/* Exynos 4210 supports thermal interrupts, but only for the rising threshold.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

I fixed it up and applied.

Best regards,
Krzysztof

