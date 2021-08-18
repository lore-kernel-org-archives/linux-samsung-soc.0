Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A582C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 14:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31200610D2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 14:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239446AbhHROo1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Aug 2021 10:44:27 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53236
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239302AbhHROo0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 10:44:26 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E5754412C8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629297830;
        bh=Ym2NH7kLd3Wo06ZfZyv8MWAmg9zO0sWLSjyMTnIEUB0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Bz6AGZSlREDUj4xE6/83p/PCZ/puYMFYZHRC6uSDpb0ctspIRyNI2aUNLu8s0+R6N
         MMnPVNeLbgRuz6efi6JjvWi/CZxE7uflqvie4XrNdVg0vxLJNOY6xcbGk9n9Q9QfFA
         b78IbXdGiV6OYco5hFf4SbrmrZmHqK7l0GkFG/0gQ+EFXNT1NnfTUEpZzh9JpABPbg
         Ld7fEP6RgrxZ0qtRSjXinvpGxUIci+a35A3cwbUfs4i2QA4v7R1fvRIe4tPDCAmOi/
         oN4X4bEBvf+/CKQhJVjxh4lEQO77CzeX9wVS6biTcqIAXX6sJlKHioNbrS9Gv1m5YP
         yu3so2iRoJ6gQ==
Received: by mail-ed1-f72.google.com with SMTP id e3-20020a50ec830000b02903be5be2fc73so1141598edr.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 07:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ym2NH7kLd3Wo06ZfZyv8MWAmg9zO0sWLSjyMTnIEUB0=;
        b=K4wtsq5qtZEYSUIwXFdJZ1tRXWaUmJ372q7M2ggCjYByceFsG7lEOgMcf3y4AvVW0M
         KMUS9LqA3BLJkucddDQSmohsobDQgLNdszv9S+VzAIcxaVImIrA9rOKyWVNH1j+3WCL5
         9Zr3Uq9IzNnxU0DKUkD1irQCUO4j376uPPaeFUolG0XGzL/4Uw+l5dXvHRstNL0Ez64f
         Hr7J1U/B++9o9Jp3wDK2bZcaqiu8C3PTH12OuRIiytY+eW2OyIrDnW2KgwW6Fc+NYJUi
         5loVCdDkc7jnzvSx+JOQRG2DZAFFMkCeJqmaYaOoz3gcMH0P31y3C9b6qsOtPSCrIwbJ
         wTDA==
X-Gm-Message-State: AOAM530deiftV1dek8uSs8FnF59Kvihk26csYSm/UNEl44lLTq0nhLub
        4u8vm/9yrTarxquMmRL2fNefHplWo8HwlIv++sJ8FNRAgtMFeceIuarR+9wtZLUtOEj9iUxzqjp
        MeWhe47ZkB38f2xBqAmJxdUzqkmFUpbIH+z5uxn7C4OIruAel
X-Received: by 2002:a50:eb95:: with SMTP id y21mr10368731edr.5.1629297830705;
        Wed, 18 Aug 2021 07:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzChPEIgyhED0qbDqb7annT/YZib35pAtXfFKjieVRsRdjPmve/sr9l695zsiB4e2LvNRwzsg==
X-Received: by 2002:a50:eb95:: with SMTP id y21mr10368717edr.5.1629297830603;
        Wed, 18 Aug 2021 07:43:50 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id g9sm2139187ejo.60.2021.08.18.07.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:43:50 -0700 (PDT)
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <aaa53a2a-c15b-8017-4e44-dd3f883b2378@canonical.com>
Date:   Wed, 18 Aug 2021 16:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLOHY0P=Y8-Ss0cYr54SWgpV0zktEg8p-Cj_F+juDQNoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/08/2021 16:31, Rob Herring wrote:
> On Mon, Aug 16, 2021 at 3:32 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 16/08/2021 09:53, Lukasz Luba wrote:
>>> Hi Krzysztof,
>>>
>>> On 8/13/21 1:54 PM, Krzysztof Kozlowski wrote:
>>>> Convert Samsung Exynos5422 SoC frequency and voltage scaling for
>>>> Dynamic Memory Controller to DT schema format using json-schema.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> ---
>>>>   .../memory-controllers/exynos5422-dmc.txt     |  84 -----------
>>>>   .../samsung,exynos5422-dmc.yaml               | 137 ++++++++++++++++++
>>>>   MAINTAINERS                                   |   2 +-
>>>
>>> I'm not an expert in this DT scripts and why it complains. Maybe it
>>> complains because the "samsung,exynos-ppmu" is defined in the .txt
>>> file... (?)
>>> Although, in general looks OK.
>>>
>>> Acked-by: Lukasz Luba <lukasz.luba@arm.com>
>>
>> I think the warning (triggered by DT_CHECKER_FLAGS=-m) can be ignored
>> because it complains about compatible in example which is not present in
>> the bindings. Usually it means someone wrote example not matching the
>> bindings (e.g. a typo in compatible) but here it is on purpose.
> 
> Ultimately, it will mean the binding is undocumented (or a typo). But
> right now, it means the binding is undocumented with a schema. It's
> off by default because there's still about 80 warnings. It's turned on
> for the bot so we don't add more. So please don't ignore it.
> 

By "Ignore" I meant here that it is a false positive, so it can be
ignored. The warning is about compatible "samsung,exynos-ppmu" used in
the example. However this exynos-ppmu is not part of this bindings and
is documented elsewhere:
Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt


Best regards,
Krzysztof
