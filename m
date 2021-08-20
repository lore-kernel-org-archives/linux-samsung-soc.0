Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB0EC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 13:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62CCD610CC
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 13:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240766AbhHTNyU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Aug 2021 09:54:20 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35738
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238228AbhHTNyU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 09:54:20 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 37A294079C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629467621;
        bh=L6n8EwvoF0TqxFnTQHNETcblmy409V9jfAs/6ldvq4k=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=FeilRYNz1W5Jqhafz4g+znI3Wce/mZtgWiB5qSiU1qXQjTAPqV/4iZAC+NkC34/Cs
         s6HCXvkhXMj1qUQi4FWYqCCU+puaYyVjbAO6323gUIjDPodAX7Zt/e6d7Rgs1hjT+y
         hz/e6bh9m6xsVKrLGhh2secEtD8qZqJ3MsFBuG+/611tYI84PqxC9nwqNas7o+INF1
         VYdOVgT4VntJN1uYfWiQZBRG07uCo0frxtg7pDh5Xc1WxAUcRBPdxvJmKbOj+ZpAF7
         njLMHRvQRk0G1Tw/MB2iNi9pmxvCiWzjyi530b6+TmL5Tewc6/bVlPF6pgp9+AJ82P
         hQL1KCArKSDYg==
Received: by mail-ej1-f70.google.com with SMTP id s11-20020a170906060b00b005be824f15daso3746140ejb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 06:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L6n8EwvoF0TqxFnTQHNETcblmy409V9jfAs/6ldvq4k=;
        b=grcmmJ2E0OaZfnw4ndXBIq7DbJIOQWomTlecqjp1p1huPrK0OwTeXSfyS6B/DaK2Zg
         tpGvoWJGxOL9TLo1JkRmEm6LHynkPMbmt87L0iCack6HwH4d+eFu2IWY0Xzt+RtIv8Sc
         yNkGeAft1lsPuRYhXLU+RF/hVnfV+aMATOJTlQ1//ts/U4VyuwpZlx5vOInQ7/cdbNQA
         yocRByW5C6AB2Td513e2Y7qhU9UtPeyd+Al655V1Nr27OjPeG77/UzbprMsepqUSzI21
         LWNsvgU5ayrGb9xnDa4XImbovuAUA1Ios2t5u0Xoq+VaSvwzzAWN435BUo66xiVYcVWD
         OSWg==
X-Gm-Message-State: AOAM5331Q0oHMP9q7GO4oAp76eMwfakQKUO/QxV20AcdOVlxqSGCi084
        laIcp4nB64xFeuJWp1wZdF7MZD/vhM44IWPMuP39W1CObG3WG4n2VDGbqoHND2mx5fk9JrDlfWQ
        gZ7w2fRBFXrKcNH5LVwgkUwT1HDKCSSi029fmzOWnvzw/uHfB
X-Received: by 2002:a17:907:2168:: with SMTP id rl8mr1189851ejb.42.1629467620858;
        Fri, 20 Aug 2021 06:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRnazCb0WSvIZUIOXuiwlWppcOzwDCP8XkmoOFIi4wo1QoT4XNNQeCS37G86Ssi7hlQsUy1w==
X-Received: by 2002:a17:907:2168:: with SMTP id rl8mr1189834ejb.42.1629467620713;
        Fri, 20 Aug 2021 06:53:40 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id bm26sm2914357ejb.16.2021.08.20.06.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 06:53:40 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: memory: convert Samsung Exynos DMC to
 dtschema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Lukasz Luba <lukasz.luba@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>
References: <20210813125414.104467-1-krzysztof.kozlowski@canonical.com>
 <73eebe7b-46da-137b-1938-09a5b453320a@arm.com>
 <0ec05a0b-9499-3bf4-a231-ea53b1cf99ed@canonical.com>
 <CAL_JsqLOHY0P=Y8-Ss0cYr54SWgpV0zktEg8p-Cj_F+juDQNoA@mail.gmail.com>
 <aaa53a2a-c15b-8017-4e44-dd3f883b2378@canonical.com>
 <CAL_Jsq+iG1t=yxsyp2whd_L4p=9udrSvZMiy-y75ppcLYK9acA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d3cf3485-6996-5cb9-6a8a-9b868f86bbea@canonical.com>
Date:   Fri, 20 Aug 2021 15:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+iG1t=yxsyp2whd_L4p=9udrSvZMiy-y75ppcLYK9acA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/08/2021 15:31, Rob Herring wrote:
> On Wed, Aug 18, 2021 at 9:43 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 18/08/2021 16:31, Rob Herring wrote:
>>> On Mon, Aug 16, 2021 at 3:32 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>>
>>>> On 16/08/2021 09:53, Lukasz Luba wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On 8/13/21 1:54 PM, Krzysztof Kozlowski wrote:
>>>>>> Convert Samsung Exynos5422 SoC frequency and voltage scaling for
>>>>>> Dynamic Memory Controller to DT schema format using json-schema.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>>> ---
>>>>>>   .../memory-controllers/exynos5422-dmc.txt     |  84 -----------
>>>>>>   .../samsung,exynos5422-dmc.yaml               | 137 ++++++++++++++++++
>>>>>>   MAINTAINERS                                   |   2 +-
>>>>>
>>>>> I'm not an expert in this DT scripts and why it complains. Maybe it
>>>>> complains because the "samsung,exynos-ppmu" is defined in the .txt
>>>>> file... (?)
>>>>> Although, in general looks OK.
>>>>>
>>>>> Acked-by: Lukasz Luba <lukasz.luba@arm.com>
>>>>
>>>> I think the warning (triggered by DT_CHECKER_FLAGS=-m) can be ignored
>>>> because it complains about compatible in example which is not present in
>>>> the bindings. Usually it means someone wrote example not matching the
>>>> bindings (e.g. a typo in compatible) but here it is on purpose.
>>>
>>> Ultimately, it will mean the binding is undocumented (or a typo). But
>>> right now, it means the binding is undocumented with a schema. It's
>>> off by default because there's still about 80 warnings. It's turned on
>>> for the bot so we don't add more. So please don't ignore it.
>>>
>>
>> By "Ignore" I meant here that it is a false positive, so it can be
>> ignored. The warning is about compatible "samsung,exynos-ppmu" used in
>> the example. However this exynos-ppmu is not part of this bindings and
>> is documented elsewhere:
>> Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
> 
> Yes, I understood all that. Let me be clear. I don't want examples
> which don't have a schema. So drop the node or convert
> exynos-ppmu.txt.
> 
> First, when we do add a schema, then we likely have to go fix the
> examples. It happens a lot and is not caught with folks using
> DT_SCHEMA_FILES. Second, I don't like reporting errors that users
> should have gotten by default. We can't turn this check on by default
> until the 80 or so cases we already have in the binding examples are
> fixed.

Understood, I'll send both of these bindings.


Best regards,
Krzysztof
