Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B20BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Jan 2022 07:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241912AbiAXHuB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Jan 2022 02:50:01 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41762
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235644AbiAXHt6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 02:49:58 -0500
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 623C43F1B4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jan 2022 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643010596;
        bh=hKmvn2EoYf7YnUau65urQ+B42XJ4hxu5EUImPMPZJrY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dkzXA8PzM1N+o6Ng4fc+qU8OTC1dprbxYaCETcG3KKNRKHdrFBC554SynrTF9N0VJ
         s9Lgx/BnrzHaJ2yzZ7gw5SCmt+qrPxBRsWU29Wcue9BCmWzd1c3CxJvf8hyKkIqqT8
         8jTslLdLByiI0dSY462Z65p930TpaH1dfMyPei4VnSW3lqS3BLVDEBczdGofU9A+oP
         RZ5S6nIv8WVn9Vvxf/mLWLVanHYYLeJOIOLQgC0EWvbFQudkHgwk4Yfj2yrcbXwYCV
         eG9oAFx/R1nUy1gT1cGjTFdD+XI4oGIXDiFh0T95yrE/OXlrHmSui+wMy4cnyVgy6P
         RZz1ctzDkLdaw==
Received: by mail-wr1-f69.google.com with SMTP id s15-20020adf978f000000b001d776502735so1504968wrb.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 23:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hKmvn2EoYf7YnUau65urQ+B42XJ4hxu5EUImPMPZJrY=;
        b=4SqW8LKPrbNrPwEdPYOy3Wc3AbLwoa/DuUQLkgNyTn9F6K8zr3Cmo8wKq1P08rsUnC
         S1MU1ms1d97DFWtlqLCu6KcP63KvtIttW95cEu0GQ/5yDxiDaaCb7sstIzjxLbQD4xV4
         kEdrCFXQdLA/BWTD0jphg2x+1kbrHDX/LAzaUhL1pK9c0jcSU8xAR9PT8D0AYVi33NHX
         pXr9Ik6j1Bn2YoKTfvFkeptWb94NHhE3lRzWHLd8MDShqFbhclGfPG7dNO6E6U8Pyais
         yLJ9y3XIKQwxQcHVtJ1nkE9J2CoE9YVzKqCcP5kicX7hEzWOcAXgJSlXHRXHg09drS08
         Pj3g==
X-Gm-Message-State: AOAM533Epy6oqGX3XNTMXpZ0YOHeveKHMifOTAuxqGd9EDiJWZGjmjfe
        xky12K1R8fmjWUiRWSbdIykDu44iubcVsN0UA9qQlHSHMeNiQPl7gZRlb1hlaCg63GvsqOiUNW0
        GCsgIqh0xC6BbcX9a+xUKtr79nsnQIF6OM3LDmG7nASRBhA6O
X-Received: by 2002:a5d:65d0:: with SMTP id e16mr12613750wrw.67.1643010596064;
        Sun, 23 Jan 2022 23:49:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIcnH15AU66jsAisZSr3fkWw8w6vsjdp8aAT+bk5H4F86P8SAZvjK6IXPkfLT58mMfJo2OZA==
X-Received: by 2002:a5d:65d0:: with SMTP id e16mr12613733wrw.67.1643010595853;
        Sun, 23 Jan 2022 23:49:55 -0800 (PST)
Received: from [192.168.0.52] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d200sm17545981wmd.28.2022.01.23.23.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 23:49:54 -0800 (PST)
Message-ID: <f04f128f-af7b-93df-0452-4c0e915f2eb7@canonical.com>
Date:   Mon, 24 Jan 2022 08:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 3/4] mfd: dt-bindings: google,cros-ec: reference
 Samsung SPI bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20220120175747.43403-1-krzysztof.kozlowski@canonical.com>
 <20220120175747.43403-4-krzysztof.kozlowski@canonical.com>
 <YenkV2rgEXQJ6Bc5@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YenkV2rgEXQJ6Bc5@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 23:38, Rob Herring wrote:
> On Thu, Jan 20, 2022 at 06:57:46PM +0100, Krzysztof Kozlowski wrote:
>> The ChromeOS Embedded Controller appears on boards with Samsung Exynos
>> SoC, where Exynos SPI bindings expect controller-data node.  Reference
>> newly added dtschema for this property.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/mfd/google,cros-ec.yaml          | 29 ++++++++++---------
>>  1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>> index 58a1a9405228..66a995bbbbe9 100644
>> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>> @@ -31,7 +31,7 @@ properties:
>>  
>>    controller-data:
>>      description:
>> -      SPI controller data, see bindings/spi/spi-samsung.txt
>> +      SPI controller data, see bindings/spi/samsung,spi-peripheral-props.yaml
>>      type: object
> 
> We should be able to drop all of this if unevaluatedProperties is used.
> 
>>  
>>    google,cros-ec-spi-pre-delay:
>> @@ -148,18 +148,21 @@ patternProperties:
>>  required:
>>    - compatible
>>  
>> -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        enum:
>> -          - google,cros-ec-i2c
>> -          - google,cros-ec-rpmsg
>> -then:
>> -  properties:
>> -    google,cros-ec-spi-pre-delay: false
>> -    google,cros-ec-spi-msg-delay: false
>> -    spi-max-frequency: false
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - google,cros-ec-i2c
>> +              - google,cros-ec-rpmsg
>> +    then:
>> +      properties:
>> +        google,cros-ec-spi-pre-delay: false
>> +        google,cros-ec-spi-msg-delay: false
>> +        spi-max-frequency: false
>> +
>> +  - $ref: /schemas/spi/samsung,spi-peripheral-props.yaml
> 
> SPI device schemas should reference spi-peripheral-props.yaml only. 
> spi-peripheral-props.yaml in turn should reference all the vendor 
> specific peripheral property schemas.
> 
> You should be able to do just:
> 
> else:
>   $ref: /schemas/spi/spi-peripheral-props.yaml

I tried now with your changes (no controller-data and else-ref), but
dt_binding_check complains:

linux/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml:
'additionalProperties' is a required property

	hint: A schema without a "$ref" to another schema must define all
properties and use "additionalProperties"

	from schema $id: http://devicetree.org/meta-schemas/base.yaml#


Which makes sense because only one part - SPI devices - get the ref to
spi-perpheral-props.

Best regards,
Krzysztof
