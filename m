Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62B7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 17:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiANRaG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 12:30:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55472
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239452AbiANRaG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 12:30:06 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3828A4005A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642181398;
        bh=kSUOA6eu0O+UW0vLcKxkWwcyF3yL+qtVXixl34s36ws=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=SsZuJhDF4/A60OUePqrIgbKflA7so1GGzLNQqk9zLIVrf9EapcT7NKhctCMZtKvsd
         wo6jmBTbauVubpQgrt7BDWNOS4nsvvEYKoY0PWRooM3fpiAquEkUO6BVSoYCGdIDN1
         qFf80BwejyrQqn7FxwFumakjEPCcOlyY6pFh1y8Pxfm/7+woKmuDXn+Tdm+e+T7JBA
         +rSRORsNoav244dVqhu6x9iyuteJpKwTy2dHEV4z/wLd/JtVUyVOOq970qLLxQ43Pe
         TV7jEwJqOH57m/vcvNr56evGPwf9jcrI6GvOwcJid+EXUcltb4ROvkhGXtRql/HM/T
         COdkhbX+Ud/Eg==
Received: by mail-wm1-f71.google.com with SMTP id c5-20020a1c3505000000b00345c92c27c6so8408165wma.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 09:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kSUOA6eu0O+UW0vLcKxkWwcyF3yL+qtVXixl34s36ws=;
        b=JDcsmCFjAOVpzVjPO/hc0/dxfLigwFSMsC5ddMkk/r7kSW9oOn3pGnadUXHtX06QFP
         m0laWoU9Gd7PQB96yEvHtMUGfnYPVckS2jqjSkFKPp0Lm8rT9IWOnxNhZ3aUqpUqvGA9
         P8jcpHVbKvpTvfvBZQMXxJhOmaQkOvHB4B97ZxFXdEP29SfZWNu7qGkMT2oYsgDlhYyr
         YEX8mfuUVExPfdd034ZsYoyJZOvFLnBywqV2Eak140boKTn4VknAPMyOgd503wCmY37X
         A1yLtd/2bAEtZj3kFem7HQYUeuT6WjdNZoe1gQZxFVavy/aYC6t0oqgY/itJlyjzP04x
         k7Zg==
X-Gm-Message-State: AOAM532wPLCSFZ5lnE2PWO49CrYl+NUHeYoFOa+Xzx9Kta88hPXPrSaZ
        lDPciDT5nn2it/CuMk4HnxG2UK8u/o+67aBWcCMptfoFu7OoINBJdpP+PioIPWa3IcdlalKlq2f
        Av1dLVO/dKWqiBWEQHl6oXRcJerqo+9bvm534GG1iVrEYUXLN
X-Received: by 2002:a05:600c:4111:: with SMTP id j17mr16217229wmi.7.1642181397871;
        Fri, 14 Jan 2022 09:29:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhY93VtI7Hfef3tetrtvklPvij90gP8kRdDlDMTKls2xXg+wMF2VUZtbhFCZaNJhKvsY7+jw==
X-Received: by 2002:a05:600c:4111:: with SMTP id j17mr16217205wmi.7.1642181397684;
        Fri, 14 Jan 2022 09:29:57 -0800 (PST)
Received: from [192.168.0.31] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b6sm6496840wri.56.2022.01.14.09.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 09:29:56 -0800 (PST)
Message-ID: <5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com>
Date:   Fri, 14 Jan 2022 18:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 13/23] dt-bindings: arm: add Tesla FSD ARM SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122408epcas5p45053d1bf0acf2d8233a98b6c1abab6eb@epcas5p4.samsung.com>
 <20220113121143.22280-14-alim.akhtar@samsung.com>
 <53c17ddc-a049-72ed-7237-de23db7889da@canonical.com>
 <085801d80967$e4b8fe00$ae2afa00$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <085801d80967$e4b8fe00$ae2afa00$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/01/2022 17:57, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Thursday, January 13, 2022 6:03 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; linus.walleij@linaro.org; catalin.marinas@arm.com;
>> robh+dt@kernel.org; s.nawrocki@samsung.com; linux-samsung-
>> soc@vger.kernel.org; pankaj.dubey@samsung.com; linux-fsd@tesla.com
>> Subject: Re: [PATCH 13/23] dt-bindings: arm: add Tesla FSD ARM SoC
>>
>> On 13/01/2022 13:11, Alim Akhtar wrote:
>>> Add device tree bindings for the Tesla FSD ARM SoC.
>>>
>>> Cc: linux-fsd@tesla.com
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  .../devicetree/bindings/arm/tesla.yaml        | 25 +++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/tesla.yaml
>>> b/Documentation/devicetree/bindings/arm/tesla.yaml
>>> new file mode 100644
>>> index 000000000000..9f89cde76c85
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/tesla.yaml
>>> @@ -0,0 +1,25 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
>>> +---
>>> +$id:
>>> +https://protect2.fireeye.com/v1/url?k=2f0fac44-70949546-2f0e270b-0cc4
>>> +7a312ab0-50c826f7b1999a5f&q=1&e=bcbf277f-4e93-4705-8f6a-
>> 2beaa7eb31e2&
>>> +u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Farm%2Ftesla.yaml%23
>>> +$schema:
>>> +https://protect2.fireeye.com/v1/url?k=d8493fe2-87d206e0-d848b4ad-0cc4
>>> +7a312ab0-f4e5046adc7da972&q=1&e=bcbf277f-4e93-4705-8f6a-
>> 2beaa7eb31e2&
>>> +u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>>> +
>>> +title: Tesla Full Self Driving(FSD) platforms device tree bindings
>>> +
>>> +maintainers:
>>> +  - Alim Akhtar <alim.akhtar@samsung.com>
>>> +  - linux-fsd@tesla.com
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    const: '/'
>>> +  compatible:
>>> +    oneOf:
>>> +
>>> +      - description: FSD SoC board
>>> +        items:
>>> +          - const: tesla,fsd
>>
>> Either this is a SoC or a board compatible... Cannot be both.
>>
> Actually we call this as fsd board, so let me add accordingly compatible (fsd-baord) for board.
> Thanks

It's confusing and probably not accurate. In your series fsd is three
things in the same time: an architecture, a SoC and a board (DTS). The
last two should definitely be different. You probably have some eval
board (how it is called also in Tesla open source git) or some specific
product board.

I cannot judge how different this is from Exynos subarchitecture -
looking at patches it is not different - so I could understand a FSD
sub-arch with only one SoC.


Best regards,
Krzysztof
