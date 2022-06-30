Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB26C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 07:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiF3HL6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 03:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiF3HL5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 03:11:57 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3252FFE9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:11:56 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id k20so3889205edj.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1JnF9FCH107+rnCgnTKrA6bh7uOLfYkwJEC44Tp4oG0=;
        b=tqmxNteBrHNpKcsY4l4MLcq5PYOpyF5j28Z9lNCmyTJizJNEd3uuAZKXr9vATgL8UM
         fZJOzmkfw9iF72T4VZCVvSPnBuArJ8oEVC1b+SoW4NbIUeETBXUFmdY3olZRQ+fW13TC
         h0g3DGwVVAkuTjyMgGekRPomO/26Egr7T55HNC99QZKgo422j2fKY15wTfIbQG+9ANDU
         v7jlAngVhhwVuMwLeyJslVJpnOuGUbRfawqeI5aO/0X3eIlquJbDx2w/NYRvyHuljOG4
         QoP60SYqO9x3zuUIUC9oZcEDNdv9rzA5nP0elglkEjf55ZH2keLhEaSmuo/ArsgX2fre
         6l8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1JnF9FCH107+rnCgnTKrA6bh7uOLfYkwJEC44Tp4oG0=;
        b=r4Q7UB/G58oWQoWKirfQSfRtuicERpiCCWLP02qfNZ4Li84xkrI9AszEASDcShIIQD
         I23ADxV28p9Ss2g2xMvC88y13G/CtbxM6fYo3Yn2nIPnTYPra+7vUkA7Tz//kl0nzKIo
         8RYdLbuaNP+LHqJjYVW+p0pr+AqKmpljiN2A5s13KYhBFh7+IrdFwqtOfBo2v7GKQYP0
         xS9ouY1PDtZpGKP7u21WiDYpA09IClw3Jy09U5aXfw1BWMHSeD3cl5x5idZcGWluoH8+
         Gc7Tt5PDFQsJxA7uPwEJF/KIeAqqHosTlU27lEmkYoubvi0qtDwB2mPDBxnMPv7A3tfR
         dArg==
X-Gm-Message-State: AJIora+Syl/GaLsp3KgBySGpGDInvo+5eHbomKZkSt3HZcDnLWmI8HN2
        iakQOGWEynF92AeuSEND4QaqTg==
X-Google-Smtp-Source: AGRyM1vUqSz513lr544IF6wYf2/WELZsmHa2Ulj31CJPfb/i775RKLhx4h6mQENJr97DBWUQQRpX5w==
X-Received: by 2002:a50:c8cd:0:b0:435:688d:6c59 with SMTP id k13-20020a50c8cd000000b00435688d6c59mr9323009edh.271.1656573115145;
        Thu, 30 Jun 2022 00:11:55 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y14-20020a170906448e00b0072737733f9asm2095042ejo.106.2022.06.30.00.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 00:11:54 -0700 (PDT)
Message-ID: <415e6440-0b46-8d3c-2e29-841bdb16e29a@linaro.org>
Date:   Thu, 30 Jun 2022 09:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: samsung: usi: add
 exynosautov9-usi compatible
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd@epcas2p2.samsung.com>
 <cover.1656554759.git.chanho61.park@samsung.com>
 <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
 <CAPLW+4noFAHc+g7jTaaiMQH871OkqcOWjZ85-mpfPVbjiFO1iA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPLW+4noFAHc+g7jTaaiMQH871OkqcOWjZ85-mpfPVbjiFO1iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/06/2022 07:59, Sam Protsenko wrote:
> Hi Chanho,
> 
> On Thu, 30 Jun 2022 at 05:19, Chanho Park <chanho61.park@samsung.com> wrote:
>>
>> Add samsung,exynosautov9-uart dedicated compatible for representing
>> usi of Exynos Auto v9 SoC.
>>
>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>> ---
>>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> index fde886a8cf43..6e806e950a36 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> @@ -22,8 +22,12 @@ properties:
>>      pattern: "^usi@[0-9a-f]+$"
>>
>>    compatible:
>> -    enum:
>> -      - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
>> +    oneOf:
>> +      - items:
>> +          - const: samsung,exynosautov9-usi
>> +          - const: samsung,exynos850-usi
>> +      - enum:
>> +          - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
>>
> 
> Why "samsung,exynos850-usi" is duplicated? Maybe it would be correct
> to leave only "items" and remove the "enum"?

It has to be like this. Either you use exynos850-usi directly (on
Exynos850) or as a fallback (on Autov9).

Best regards,
Krzysztof
