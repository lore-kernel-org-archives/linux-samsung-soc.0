Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BCAC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 06:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF91160E76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 06:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238444AbhHRGxq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Aug 2021 02:53:46 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:50432
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238343AbhHRGxp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 02:53:45 -0400
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 73F4240CD4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 06:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629269590;
        bh=+VHxmC5l70aOpP0chSpMVVPtyabgSrUdWjrTOo5Mr8s=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Yzl7gruWkkqaLWV/muBiGy4CdcqfbdJ8ul5L+5I4xyiYV5djPk5AHlgMiuSloyNCy
         5jM18gRxMI8TdlNBZ+HJDgfMMxR2PA0rh+MNrh/Idn45XVi8tRPcrHFiVTQzFjbB2z
         FK6H76FVxO8Lov8qhGrquUeJRKgmlDO285oCKwxOIcYUMl3dxkUvbo+VnT9H3xKuz+
         /fExpZ2OD1Bud8QQb331/dd1fWImaj9++Wy/84509t4cLohGC+0tL4LLHyyYfMtz9M
         AyEwPhA0anqXMnU6Zb0qz5K5mFVaia631GB4sQFj/Vs4KatWdV8ZPtkyE2WcwZvsrQ
         Z4U17Y+Im3y7A==
Received: by mail-ej1-f71.google.com with SMTP id kf21-20020a17090776d5b02905af6ad96f02so500850ejc.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 23:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+VHxmC5l70aOpP0chSpMVVPtyabgSrUdWjrTOo5Mr8s=;
        b=KNJNTsg4yTDrte1a5kqTwm4tPV/aoQhKLKEY/N/Oywk/LbqEQEAKQkZJ230yX8yuAD
         MzkrDCXe+3rnooURNus5xvQ5CNXNfZ3NmqvYDGGaSPbzO5BOWeH8qJOtHocfJukCLXIg
         4uskIiVmRD+zVTgRa2XyaqlU8X4VVgzmBLWbys0ER7dG1hQZOURas0yFOIxGHaRDoIAF
         /exFhW2ApHKlgF7of2gZBNhr1spZQDC54V/fSQLLSbMsPaW3Cw4KqEr2j30pqqb41m2f
         UmXz3xuvy6Q4BF9x67NjcEs2rQi/QygM03/CF5VKF0atqsX6IEW1BVAmamUbh53/ABwp
         NXyg==
X-Gm-Message-State: AOAM530p7il4yPBOrkEFRZaa/xr3puLvPhSiSZbsEeSIu/+hs+kOnZzk
        lJHVe/bFn8KM1gACRMLHiCV6B3aDoXFZEpscNHKyU1+ogN9Ypz74VEqcCL01UBfn5Akzj7C2x9K
        2ZuX/CFLcKDMF+7jtQNYarUFR4NE2V1TD54l9BGyFjSkw+905
X-Received: by 2002:a17:906:c091:: with SMTP id f17mr8342451ejz.134.1629269589714;
        Tue, 17 Aug 2021 23:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3+WDo899fNiEPzqXXLt1bnNf9Gf711soHWYYqOKByubyBSWsbjXdc6rj1N5EDH49lhNEsaA==
X-Received: by 2002:a17:906:c091:: with SMTP id f17mr8342431ejz.134.1629269589552;
        Tue, 17 Aug 2021 23:53:09 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id r19sm2047214edd.49.2021.08.17.23.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 23:53:09 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: samsung: convert Exynos542x to
 dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-4-krzysztof.kozlowski@canonical.com>
 <YRwaMWChKoasAFYh@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4ac27c04-5ee5-b15c-29bd-fce841429522@canonical.com>
Date:   Wed, 18 Aug 2021 08:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRwaMWChKoasAFYh@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/08/2021 22:21, Rob Herring wrote:
> On Tue, Aug 10, 2021 at 11:31:40AM +0200, Krzysztof Kozlowski wrote:
>> Merge Exynos542x clock controller bindings to existing DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/exynos5420-clock.txt       | 42 -------------------
>>  .../bindings/clock/samsung,exynos-clock.yaml  | 11 ++++-
>>  2 files changed, 10 insertions(+), 43 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> deleted file mode 100644
>> index 717a7b1531c7..000000000000
>> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -* Samsung Exynos5420 Clock Controller
>> -
>> -The Exynos5420 clock controller generates and supplies clock to various
>> -controllers within the Exynos5420 SoC and for the Exynos5800 SoC.
>> -
>> -Required Properties:
>> -
>> -- compatible: should be one of the following.
>> -  - "samsung,exynos5420-clock" - controller compatible with Exynos5420 SoC.
>> -  - "samsung,exynos5800-clock" - controller compatible with Exynos5800 SoC.
>> -
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -
>> -- #clock-cells: should be 1.
>> -
>> -Each clock is assigned an identifier and client nodes can use this identifier
>> -to specify the clock which they consume.
>> -
>> -All available clocks are defined as preprocessor macros in
>> -dt-bindings/clock/exynos5420.h header and can be used in device
>> -tree sources.
>> -
>> -Example 1: An example of a clock controller node is listed below.
>> -
>> -	clock: clock-controller@10010000 {
>> -		compatible = "samsung,exynos5420-clock";
>> -		reg = <0x10010000 0x30000>;
>> -		#clock-cells = <1>;
>> -	};
>> -
>> -Example 2: UART controller node that consumes the clock generated by the clock
>> -	   controller. Refer to the standard clock bindings for information
>> -	   about 'clocks' and 'clock-names' property.
>> -
>> -	serial@13820000 {
>> -		compatible = "samsung,exynos4210-uart";
>> -		reg = <0x13820000 0x100>;
>> -		interrupts = <0 54 0>;
>> -		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>> -		clock-names = "uart", "clk_uart_baud0";
>> -	};
>> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> index cd6567bd8cc7..b0f58a1cf6cb 100644
>> --- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> @@ -18,7 +18,16 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    const: samsung,exynos5250-clock
>> +    oneOf:
>> +      - enum:
>> +          - samsung,exynos5250-clock
>> +          - samsung,exynos5420-clock
>> +          - samsung,exynos5800-clock
>> +      - items:
>> +          - enum:
>> +              - samsung,exynos5420-clock
>> +              - samsung,exynos5800-clock
> 
> Is there a reason these are supported with or without 'syscon'?
> 

Yes, the syscon is optional and needed only by the Exynos5422 DMC driver
(exynos5422-dmc.txt/samsung,exynos5422-dmc.yaml with
samsung,exynos5422-dmc compatible). Without that driver, there is no
need for syscon.


Best regards,
Krzysztof
