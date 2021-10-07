Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C87C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7B51611C1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241013AbhJGNJm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:09:42 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35526
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240974AbhJGNJl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 09:09:41 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A06BF3FFF2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633612066;
        bh=FORzsUXne7M2qBjMCfFLm5GuHPWnU7ify0SwCg4gAzA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=XEqBbV2i2rSqT8ONkBiX0A2Wd5dfk07hslLT/+ZTugU8iIjX3Yv07jynl9t6i687u
         d6gh1EQ759SPJGYRKLeawX9payUCifUnK48USmn49Fvr8Gf059XaOhlFSwCKEi2uud
         kfWHvMzri4As5Vup2egOqCoMA/I0o/jeKPBOrngH1he78HdW4bYR2Ad1zeGLB69xqU
         4hWpsPPqTmDjhnee8yT6T7HpZjO981ih6pbaW1JaulSWI1R8TD6w+T2QIERW0DPsip
         p3mawA6PT3QFQ+iAWzlmCZmTa7gYDYEvmm3ksOS6hsBAAEkxgjSLx1w+RapH0/mvVd
         TF8pI0xzC/4Yg==
Received: by mail-wr1-f71.google.com with SMTP id c2-20020adfa302000000b0015e4260febdso4621555wrb.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 06:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FORzsUXne7M2qBjMCfFLm5GuHPWnU7ify0SwCg4gAzA=;
        b=y4vUs/bnPD9493u1+aZ9M57AkPWYWK2IKPn5c+Zgn8hueLIpgXrZ+jHyycSQaCXqEo
         PsJJRqupvm0O3akBsI5Dr/nPELm2QVj+9i0l48xT3hnyRqOWrHq/M/D6IFADBN/YLhH2
         WRPeUiEmxgriWeIeWlBlBi6TEPzHCrtJSwy1iKsu8L9n/pwYuW+QGVhkFmdm5I4AA05r
         I4f6m7ANplly8T7pYbU0L7KdM6xqBUx2vITkijnYzzPLezaY3lZ85juDUCL2U5gGfGGV
         IGT5AXVaq78juKn/ggFk7pUF7JGpfiAHxmQgXcnkB7ZFokywzQ9c7gxpCvSRDMx0odKK
         te6w==
X-Gm-Message-State: AOAM531N5Gvuz9ZddLkNuiFBwGcqrlxTFXukRjyhNkVYd1coR3PXhqZw
        jJC377EjWdHfJXDnR1YI8+HyiAdbRAVbkQtVpZFRKVjS/eBlldl4mov61y5p0D71yGGRJMKJHQD
        TKeWC8SoW7qznBmm7nIst/0oQSRsksoKD3pbHuZpqdnURhLVY
X-Received: by 2002:adf:b355:: with SMTP id k21mr5428724wrd.380.1633612064190;
        Thu, 07 Oct 2021 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5pF3b8+6MeNpQSCXgOMr7rU57lLrOb+1ZGnujvyw0abYwmsBGvSJGW2lo9jvHE2DDTsCMuQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr5428054wrd.380.1633612059354;
        Thu, 07 Oct 2021 06:07:39 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id d2sm24198585wrc.32.2021.10.07.06.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 06:07:38 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] dt-bindings: mfd: samsung,s5m8767: document buck
 and LDO supplies
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
 <20211006132324.76008-11-krzysztof.kozlowski@canonical.com>
 <CAPLW+4migQ+3NBsHgMd04N-Fc71CTzxoUMS3HN2S8377qFDa6g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <25ecf19b-eb40-ada6-2469-b0c29820b498@canonical.com>
Date:   Thu, 7 Oct 2021 15:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4migQ+3NBsHgMd04N-Fc71CTzxoUMS3HN2S8377qFDa6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/10/2021 22:02, Sam Protsenko wrote:
> On Wed, 6 Oct 2021 at 16:24, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Document the properties with regulator supplies for bucks and LDOs.  At
>> least one board uses it (Exynos5250 Arndale).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> index b2529a48c890..12dea5aac8b6 100644
>> --- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> @@ -96,6 +96,44 @@ properties:
>>      description: |
>>        GPIO specifiers for three host gpio's used for dvs.
>>
>> +  vinb1-supply:
>> +    description: Power supply for buck1
>> +  vinb2-supply:
>> +    description: Power supply for buck1
> 
> Nitpick: all those vinb* are for buck1, or that's a typo (here and below)?

Copy paste and needs fixing. Thanks for checking.

> 
>> +  vinb3-supply:
>> +    description: Power supply for buck1
>> +  vinb4-supply:
>> +    description: Power supply for buck1
>> +  vinb5-supply:
>> +    description: Power supply for buck1
>> +  vinb6-supply:
>> +    description: Power supply for buck1
>> +  vinb7-supply:
>> +    description: Power supply for buck1
>> +  vinb8-supply:
>> +    description: Power supply for buck1
>> +  vinb9-supply:
>> +    description: Power supply for buck1
>> +

Best regards,
Krzysztof
