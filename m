Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E105FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 12:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5A2F61056
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 12:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhJNMHy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 08:07:54 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36372
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230241AbhJNMHx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 08:07:53 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 848873FFF4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634213148;
        bh=7DUeJSAMIJhPw/8ePsUW00GrvDqVU0aPI87ZO6EH914=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Oa0OKVgN0bxroOrVwuIWTN/Y65V0C2cOkyfu60/gL4VLNvPoEX5FaNeIQ5LFZU/ct
         ZmfSHVawB4+DWkkZ+z1Ua/UT7JAGjmdjEPZnj4rylgzUTtrgGy5T3wkTXLYJzOO6OH
         SJz1qgZCG+KA4berYIyQPyueWP59yB5+pPsmajwB68kVJ7a8NSRUCe1BazN+9gmDuI
         z3AoY3o2S888wqB16T4EQyO+dw0q8hl2VXEcDrPQv4xsMMTEWYOgUzAMDUy7qUIOdZ
         UFn10v4W5v841agsvVc8BchHuX+kea67AqaPYUC4F4c/I6y/CwCejTAUpC8bBZm7Ro
         5zAFftXrq3XmA==
Received: by mail-lf1-f71.google.com with SMTP id x33-20020a0565123fa100b003fcfd99073dso4232548lfa.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 05:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7DUeJSAMIJhPw/8ePsUW00GrvDqVU0aPI87ZO6EH914=;
        b=yIhuEgJzaX/O4gpy8hqXKj5T7IVaJu6Ls6cYL/ItlYZ7gLenRUn/MUFU+HrZXUt9cP
         IuX0pKkls2HC64LFsves4rKyiAXgVvxv2UEyxEVm/9F3TE1jAxd8DEyeK1g+X/rVxI8d
         UZCWRkjQyfIE8arGh8CBXKGMR/UXBuGGTeRHdYQ0015Taw+cXZ5b1+fZ8kSOSU+DqR8W
         WpLIXF1ZxxYdjWR8Xt62wG5gNZnxJ+FN5mDAjO3RgskmJj/efDdTJ96d6jY/sYbEGK2e
         9A7mVosyTi56LXGKipZD0yIDeGqRjiKk+w7fTZNnJ2ntTjdkAjaJAAnW6Z5zcRwyNUlU
         ZEug==
X-Gm-Message-State: AOAM53053q+xlv1YC+xW9nHaftqoFwfsJ7MteHc6JY+bfUcDOa/TSVPv
        7SIhVe2wcqrKj6bG9oDcj8MNErzHt1bebjNsyTRL/+K5UNjkD0LMONXS6HNiKjMdhh0hJnh0b1C
        rlmHB0GSSAbg1wui3UzrH6wugM40Kihe9+LuIsTVBEDPstHuc
X-Received: by 2002:ac2:53b0:: with SMTP id j16mr4569243lfh.656.1634213147817;
        Thu, 14 Oct 2021 05:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCt+hiQkBxCSZOa/Bi5shuLmxG3lPR3IwYp+KgtXpG96mbai/MNiQv4N/aYOMc/bn4ZM5kOw==
X-Received: by 2002:ac2:53b0:: with SMTP id j16mr4569231lfh.656.1634213147622;
        Thu, 14 Oct 2021 05:05:47 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f10sm212322lfs.56.2021.10.14.05.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 05:05:47 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] soc: samsung: exynos-chipid: Pass revision reg
 offsets
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211013202110.31701-1-semen.protsenko@linaro.org>
 <1cd31098-ba9d-f2e3-e34c-5bada00a2696@canonical.com>
 <CAPLW+4mtSnt8dCCtSeu-yNTR0F5ZO-hdjFjyGChi=tTWQQt85Q@mail.gmail.com>
 <dd61666c-fd1a-c152-9423-9dc6718b1626@canonical.com>
 <CAPLW+4mA64Q8t07tJ_Yi9=AHmGe2NixEmCaMP-Lj65D2TNBt+w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <125ed340-cec7-5f65-c4c1-ab5162b420f6@canonical.com>
Date:   Thu, 14 Oct 2021 14:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mA64Q8t07tJ_Yi9=AHmGe2NixEmCaMP-Lj65D2TNBt+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/10/2021 14:03, Sam Protsenko wrote:
> On Thu, 14 Oct 2021 at 14:48, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>>>
>>>> Did you test it that it produces same result? Looks not - I gave it a
>>>> try and got wrong revision.
>>>>
>>>
>>> I only have Exynos850 based board, and that has 0x0 in Revision ID
>>> register. But for v3 I'll try to emulate register value in the code
>>> and make sure that the read value does not change with patch applied.
>>
>> You should get one of Odroid boards to test it. The MC1 is fairly cheap.
>>
> 
> Will do, I see how it can be useful for further work. For this series,
> I'm pretty sure I can test all cases by emulating the read register
> values. Would it be enough? Also, if you have some time, I'd ask you
> to check v3 on your board.

Yes, it's OK. I can test it.

Best regards,
Krzysztof
