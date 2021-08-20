Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45924C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 15:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 212B26112E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 15:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240607AbhHTPFP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Aug 2021 11:05:15 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38382
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229772AbhHTPFP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 11:05:15 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0E0BE40791
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629471876;
        bh=+9RVHIO7GV1Om2KHgusO6/MXkZN0OfEQMTrFuagDZKI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NiAqpx/BHsRMliyv/ACW72HdBctzKXhU8wc6GSz5C71fXX0iRVWFqa+koZKE3awAl
         FTVtHkJ5jEdcNFtyFXhT8u7C8Vv2oOudbi1p9CcFIWqivU6yYYvTHIJm81hOhLr6S9
         ql0tP5vs8g2vlz2XqYJQAUDRYi5Y6RcMix498XQTaXttCDPCvfrVJvmpN2N0eqtayD
         ySfMzsWlsQU+fw+sOtVs1BNxhgGcQY1JayeYhqvJFoDK2jvvoF3dFwXi6aa+/AEhi0
         F1O+JeE9APlUk7rUuRr2arbcGl9wFKEX7Tz1qY71G8TSPen4J3pEPRzDhyZ5RIaeQ3
         xB9ImzyJEdxzA==
Received: by mail-ed1-f71.google.com with SMTP id x24-20020aa7dad8000000b003bed477317eso4709340eds.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 08:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+9RVHIO7GV1Om2KHgusO6/MXkZN0OfEQMTrFuagDZKI=;
        b=lAHgTn7KKpQr1O0G1vmYv9mMWzE1sx0zMFTy1zCzqFIw+i9Z+ipU+lX1kdSjrGgEbj
         /X8fd2LloTOrZn8vSUgynL4LZn7nE1TZLjdu3/nYQ5N1cIffUI7VjWdwdYAsF449TnAa
         qtI4FHY/PO0rut/ZHaLsG1DfpEWdx5EHIvONgfET/7E0uxWY1kE6FychjkdQGQIoio3Q
         QzHhfIsdK63qKiJ0ojfQ3aLTfE7OT0hvGCAa9NWJc8FGyl2cLz3fx3Lud1K9xlKOsfOl
         kakoW6Z9XdZO1scbt9BwrqyjGVXUFqfG83sK9idAC2ItAah/LtKiwpDov23DXvvVJQ0g
         KyrA==
X-Gm-Message-State: AOAM533Rs8I9Wa5C2C3fOUotfWNM2dQpEuRx/rHLy9BptvLF1OTtA+ue
        GO1qel/67Zw59npWNz/RNoW4QvdmbnoUDWri9U058ebyNMxfbWYy1TeRqXn7eI9AT2uvGSMOj/U
        VTXFwD3PjtxkdtLcM4LxXdF3rHfamE/2zjocgLRKBIjh9mzes
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr23183743edw.90.1629471875798;
        Fri, 20 Aug 2021 08:04:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgDiyfkZv84mpJkewwib7hgZF+c9z+OtbNAQMGJ7h7jHN43rWGybqDCjw2we1dlKuY6kNo0A==
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr23183722edw.90.1629471875595;
        Fri, 20 Aug 2021 08:04:35 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q6sm2960038ejm.106.2021.08.20.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 08:04:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: exynos: align operating-points table name
 with dtschema in Exynos5433
To:     Alim Akhtar <alim.akhtar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
References: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
 <CAGOxZ53oTWuSLupGKWd+XWPXJZQfZ28-Vo=wWT1exty0LpCfOA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ed2e81ce-97ac-be28-8db5-3f1242c64a91@canonical.com>
Date:   Fri, 20 Aug 2021 17:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGOxZ53oTWuSLupGKWd+XWPXJZQfZ28-Vo=wWT1exty0LpCfOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/08/2021 16:44, Alim Akhtar wrote:
> On Fri, Aug 20, 2021 at 1:51 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Align the name of operating-points node to dtschema to fix warnings like:
>>
> Did you miss adding warnings here?

Yeah, I missed. I will add it when applying.

> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
> Rest looks good.
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Thanks!


Best regards,
Krzysztof
