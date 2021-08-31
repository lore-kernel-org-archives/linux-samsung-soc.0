Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A2C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Aug 2021 13:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BB4C6103D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Aug 2021 13:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhHaNEy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Aug 2021 09:04:54 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40638
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233151AbhHaNEx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 09:04:53 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BBDA84017F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Aug 2021 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630415037;
        bh=qDh+jaB0np2Ma4qQPLUONgv0hkCk0/2/t0zPMqiZXPk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=UzTEnwFsdJONS1Cp9/apf1twDjul36NWZFWPANsFja/7BB3ieYJ4H2MRWMwAI6Kbd
         kWdKk/eYLFKKBNlVdlTgFfx4VwkOwl3xDNHG1kdg2v57Ca9d6TIfglj1Y7vFTeRe/a
         E9TqVckQVBkfSBnlpH4xBSD69GTxcSdJq65BkmTp7tZXJuT6/+fh9KmijL4a7oMdxD
         hJupMgWd2rKK+VFr00jafqmgVNCZrXzcDF0ra1ACUuv6QXp1k7kYa1/rtuQ7Bk4UHu
         aeq967iV8q+k200kpmKUYUbxAM34d6Xyh1lqhwdf1htutDUCdwgrn7ld5BCmC6ffQG
         n4o8PMxzD5xkw==
Received: by mail-wr1-f72.google.com with SMTP id i16-20020adfded0000000b001572ebd528eso3972218wrn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Aug 2021 06:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qDh+jaB0np2Ma4qQPLUONgv0hkCk0/2/t0zPMqiZXPk=;
        b=j4ISl1idj8P6ci2FfVSwDLaBP0ymVF40gDVJ7krsGIRKy+dPrSEQsBYGsU00JTQVcf
         4vhbecDDbcAmjnbjttFvvW73EfV2BMqYOABoR7SL82wWzat7yuCVZuEGCRBlGQyJc0KJ
         ZL5IkP6wUfhSe3ZSPr8V+YEy/DFLqrdd7aO5H7eDBjQDXGd701hWTswqGVnzYr3zjIZi
         X7p1bMnekxx9LfIdJjRZjJIboBwMm2KdQIAbVwa+aHUGyPif1tKAd1y+b1IBhhzrCOOL
         8KK0EgL8eT+TyBqsb2PfxPK3rEiYfNlYouUncLES0S4BUZXD3T4SmxvfIsZ1KbiJN5Mq
         qvsw==
X-Gm-Message-State: AOAM533FsPzUE69ESPi5J6RE/A778uJM4n1of+KOt90gEOXNIRKBf+S+
        vC1l+pu5T8atbLVMj6JLw38C4F7fQsROSpI2OmI5/Rj43GKK/pVh6oefeKzwSF15iCieXntECGv
        GJUIVE34FpyVWjOKWDVlSy1tEOoszVJJGDonijpaF+yYHB+aa
X-Received: by 2002:a1c:98d2:: with SMTP id a201mr4148676wme.89.1630415037254;
        Tue, 31 Aug 2021 06:03:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeqlQimbRGjw6jejCDWBCWbWbg+R0a4qSrqXfxkK2pAyisDvv0rWZSb1NBFkB7+rE1teZl2A==
X-Received: by 2002:a1c:98d2:: with SMTP id a201mr4148639wme.89.1630415037010;
        Tue, 31 Aug 2021 06:03:57 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.63])
        by smtp.gmail.com with ESMTPSA id l15sm18300749wrv.84.2021.08.31.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 06:03:56 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] dt-bindings: clock: samsung: convert Exynos4 to
 dtschema
To:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
 <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
 <CAL_JsqJvEgqvnTokdNjOR=XdY89TdZxUXR4--P1FXVj75z3tgA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d5e75754-4724-9cbf-d07e-47c40cfa130f@canonical.com>
Date:   Tue, 31 Aug 2021 15:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJvEgqvnTokdNjOR=XdY89TdZxUXR4--P1FXVj75z3tgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/08/2021 14:36, Rob Herring wrote:
> On Wed, Aug 25, 2021 at 8:41 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
>> schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/exynos4-clock.txt          | 86 -------------------
>>  .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
>>  .../clock/samsung,exynos4412-isp-clock.yaml   | 64 ++++++++++++++
>>  3 files changed, 67 insertions(+), 86 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
> 
> [...]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/exynos4412.h>
> 
> Where is this header? linux-next is now failing:
> 

Argh, it should be exynos4.h. Stephen mentioned it but I missed the
difference in number. I wonder how it passed dt_binding_check on my
machine...

Sorry for the mess, I'll send the fix.



Best regards,
Krzysztof
