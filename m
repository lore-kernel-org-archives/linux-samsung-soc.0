Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61F5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jun 2022 10:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348063AbiFJKMa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Jun 2022 06:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244063AbiFJKM3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 06:12:29 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A02F68BD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jun 2022 03:12:28 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id fu3so51038265ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jun 2022 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=p/i2+crL1L43GiLXITg/vt3Q+0CXjjKGYscQg4ugrbw=;
        b=m3xGe026GsgzFKujBkFBMFTkrEv5ifTPmlL1JL3mqH3lHNTdAOtZJhFSrHdfi59Mhn
         Cp1pRHFfW4UfO9HOOz02ophvsooVXfRTrZcSj1TMpmtD+KKIfFjU5uLdIWfMJpEMtSTo
         u30C92w2vqpO6VTxPdDGd/nHD8zIZF4E8WCsj5KhxGfpnFUhVhodhQuiO6H8WS1UlytO
         l1JAP9X4Jb0hF2a1/U8nRhg76b27eKJ+L0R6o6xtEnUzSENi7jvrwLHgUMVPT4BKSMfZ
         g0EOQ8Qq7KTbFLuyZpzNZq31vaoGMSKhgD51YNEnjVsOeIIej0NyZr8X610KaMPPOAyu
         SYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p/i2+crL1L43GiLXITg/vt3Q+0CXjjKGYscQg4ugrbw=;
        b=pkrmH0iJJcTvj69RLlBRet83xUFNqZDAT4J8RC8d3b+3H8Uk3CjncfbGZJIwHqDOP/
         hv3IwRuOXmPhPoBdWZ4E5Ht4VyGC7WEPItcXuqra0nz3IUbuUgHz2ZteyJ2c7/ZKsEQ1
         4Lgz5lfPmZTX7faKezM8Xgo9m4EfYFg1bQ05YRNwDU+4H/LzPo6Yh1nX2jDfqO64nhpB
         fdasGlhLDO9qU9oMzcm/E/PRs943UxJ4SjJ+k464zogYYDkecuhTZ2EpskYcgv3MGILG
         jyg3RxSPZYUjI9mmQ1v2aBCka/1UQJK1Gc+uxObxTtaOPSgNWjLjiP9wP8TUI0HYg6pY
         9N+g==
X-Gm-Message-State: AOAM5316CvH0UVNxVOr/fRnFNZj7HbGPWAY0lyugsamK3CG1OOEfS6Ls
        V173tdULyMCoIjK8X28JUE/IYA==
X-Google-Smtp-Source: ABdhPJw0RDXtOcxvfPMtEiDAqOLDHPs1NI+Dt+TuY/tcMv7c9ex+vGJ+hFZbkNUXzQd0E/pMPrBTdg==
X-Received: by 2002:a17:907:2d87:b0:711:dd41:1e72 with SMTP id gt7-20020a1709072d8700b00711dd411e72mr17399697ejc.742.1654855946970;
        Fri, 10 Jun 2022 03:12:26 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906b09900b006f52dbc192bsm12048266ejy.37.2022.06.10.03.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 03:12:26 -0700 (PDT)
Message-ID: <410c5c97-8ff7-2303-5e19-d6053d3779dd@linaro.org>
Date:   Fri, 10 Jun 2022 12:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: leds: skyworks,aat1290: convert to
 dtschema
Content-Language: en-US
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
 <d6d1642c-26b4-e4a8-5ae7-c4b952ae6c62@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d6d1642c-26b4-e4a8-5ae7-c4b952ae6c62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/06/2022 22:28, Jacek Anaszewski wrote:
> Hi Krzysztof,
> 
> On 6/7/22 10:53, Krzysztof Kozlowski wrote:
>> Convert the Skyworks Solutions, Inc. AAT1290 Current Regulator bindings
>> to DT Schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> [...]
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/leds/common.h>
>> +
>> +    // Ct = 220 nF, Rset = 160 kOhm
>> +    led-controller {
>> +        compatible = "skyworks,aat1290";
>> +        flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
>> +        enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
>> +
>> +        pinctrl-names = "default", "host", "isp";
>> +        pinctrl-0 = <&camera_flash_host>;
>> +        pinctrl-1 = <&camera_flash_host>;
>> +        pinctrl-2 = <&camera_flash_isp>;
>> +
>> +        led {
>> +            label = "flash";
> 
> Why are you adding label? It is deprecated, 

Eh, so it should be marked as deprecated:true, not just mentioned in the
description (common.yaml).

> but has the precedence over
> new function and color for backwards compatibility, so it would make
> those unused by the driver now. Please drop the label from this example.

I synced the example with DTS, but I can drop it. No problem.


Best regards,
Krzysztof
