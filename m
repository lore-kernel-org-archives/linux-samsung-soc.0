Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1C2C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 15:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbiGFPDS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiGFPDR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 11:03:17 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE83D25EB8
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 08:03:15 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s14so18844984ljs.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IFs4K+vHO4shlMpyGm0KT1ygHT2JQiFDn/WkET9yuB0=;
        b=vmA3fcKDcVjV7b2iQSvzwqDq5nlrjn+sb8pFsaTTMXgNC468AQKTAP2Ee8nYGSkaqH
         WsA9d61yxfuOgLp+r7vPvUvtsdpDgv0zIfpbJrGyZJ6F4Fy5u+M7sQ6m7B8wfoEQfAHZ
         Gjwj5A+VlIMUvT3OYkMPqySYtpce1KGVX2lZeyz0pQTXRngQzPfvMzhyzkVLhxvs8kGw
         Kg7s+hDrpk6ZY9HlMDxW1MVuiVp0rsxl+6Rpp3KIrO4E24rT6xaqIljWnjJIOs4Pkjz7
         7ZPHmYJFbLDcFubTOLgavLFNF3kZHTKlg7a6izX06/g8om7tvV7ixe9x2zYL7WdZD6Ez
         i9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IFs4K+vHO4shlMpyGm0KT1ygHT2JQiFDn/WkET9yuB0=;
        b=GExGIGeYGK/Fegy7CJJEPYXDqjKCVbu9zIW8IqiJKispx0FpbbAAE7KwywIVKQBSeT
         p7gpSwPNrZ//W56ulUmYGlm2STFkazkVrnKdkhMubr8rZS8TicbvEwZF1zRgsKofd1d3
         5CmG81GHgOKCGb1oaHpS6dzG8xIii3OvBJyzOKykUvChJc9iGa3++nekbOuYJyPo8aDX
         cBwfYSwe5bLleAEuUxh24qGD/AaLnZgzNAKaRZRpAG9NoDlJJcGAGayi7QZ/t+vC/NX/
         EHJ0gWTNcK0kWjAjvYCBZe2LkcmTpgU26MUnN1me9FZ2SE09/V2kJNcMo6ZHHO1i26Sb
         mAkg==
X-Gm-Message-State: AJIora/2XZy037skshELNMGZ3yHvAbAKF6HPTsxaQWCnaJdXDE795v1G
        cDtVpk7g6NCKat2Bwniz8Fw/0w==
X-Google-Smtp-Source: AGRyM1vzf+X2DEOP0TXIqFD/djZdIH/lQtaH7PMeSC8hPX5X4b/lW4XYVD3ntTQM0B5I4fKeuAsTyA==
X-Received: by 2002:a2e:9110:0:b0:25d:46ea:3173 with SMTP id m16-20020a2e9110000000b0025d46ea3173mr2230800ljg.80.1657119792752;
        Wed, 06 Jul 2022 08:03:12 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512371300b0047fa16f71e6sm6321366lfr.30.2022.07.06.08.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:03:12 -0700 (PDT)
Message-ID: <e9b0306b-4d4b-72b2-b12d-cea4c3754a58@linaro.org>
Date:   Wed, 6 Jul 2022 17:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: ExynosAutov9 SDAK UFS phy dtbs check error
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Alim Akhtar' <alim.akhtar@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org
References: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
 <CGME20220706095505epcas2p36afb722aa84d41c6d13c825280467258@epcas2p3.samsung.com>
 <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
 <021701d89126$c6e8f410$54badc30$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <021701d89126$c6e8f410$54badc30$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/07/2022 12:54, Chanho Park wrote:
>>> When running dtbs_check I found:
>>> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy@17e04000: clocks:
>>> [[10]] is too short
>>>
>>> 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
>> phy.yaml
>>>
>>> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy@17e04000:
>>> clock-names: ['ref_clk'] is too short
>>>
>>> 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
>> phy.yaml
>>>
>>>
>>> and so on. It seems you miss there clocks.
>>
>> +Cc Alim.
>>
>> Tesla FSD has the same problem:
>> tesla/fsd-evb.dtb: ufs-phy@15124000: clocks: [[35, 2]] is too short
>>
> 
> Thanks for the report.
> Ufs-phy clock of Fsd and Exynos Auto v9 shall be 'ref' clock only unlike previous exynos7's ufs-phy.
> 
> I'm looking into how I can fix the warning.
> I simply made below patch but I'm not sure which is better between minItems/maxItems and oneOf selection.
> 
> --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> @@ -28,17 +28,23 @@ properties: 
> 
>    clocks:
>      items:
> -      - description: PLL reference clock
> -      - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
> -      - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
> -      - description: symbol clock for output symbol ( tx0 symbol clock)
> +      minItems: 1
> +      maxItems: 4
> +      items:
> +        - description: PLL reference clock
> +        - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
> +        - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
> +        - description: symbol clock for output symbol ( tx0 symbol clock) 
> 
>    clock-names:
> -    items:
> -      - const: ref_clk
> -      - const: rx1_symbol_clk
> -      - const: rx0_symbol_clk
> -      - const: tx0_symbol_clk
> +    oneOf:
> +      - items:
> +          - const: ref_clk
> +          - const: rx1_symbol_clk
> +          - const: rx0_symbol_clk
> +          - const: tx0_symbol_clk
> +      - items:
> +          - const: ref_clk 
> 

You need:
1. new compatible
2. min/maxItems in clocks/clock-names in "properties:" part.
3. allOf:if:then: adding constraints per variant to clocks and clock-names.

See:
https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml#L53


Best regards,
Krzysztof
