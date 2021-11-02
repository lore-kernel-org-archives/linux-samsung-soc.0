Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91201C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 15:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80154610E5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 15:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhKBPCr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 11:02:47 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59924
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234445AbhKBPCn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 11:02:43 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1AB1A3F1B2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635865208;
        bh=tGnGnqPa0VIaAzcsSoeDsG88O6HungA42rCiapiho4E=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=UGPbLTMpb14tVKm/chmKrGPli/OMRa93W7YWRkIEl2K0AVf4Aa4OB81qDiY6Lql83
         AOIt7A7bvf55BjI2i/quDv2DPHtqKqiSr5dr7Z1poGwHuuTXv8j2DRVU5Ra6ngGXtN
         1gB52Wz7Nhi5NzuQOAodOxCwKqVCaLziFNIGTRfsTzi94bIxVPkSWSLI/bkJ7ZHdhV
         vWRHGZvIEErC/pQLujRfM+HEjEt+GTZ4w9xYKIzNkRlLmY6UD2rQzazORjSLp1YESS
         rWg9vtOj1TaycQSvAdXWLnZHMv8Etx3OSlmLtH/9XfJaNziyLs/t7AcI2rwPnsNT3t
         Aawy+yMvDO/gg==
Received: by mail-lf1-f71.google.com with SMTP id t17-20020a056512031100b004000d31b4d5so2402249lfp.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 08:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=tGnGnqPa0VIaAzcsSoeDsG88O6HungA42rCiapiho4E=;
        b=uNGBfOKeK4UbvqndjA2QJ1QFzSxHMrVWU5FWPRfbcMxYTYHu5nwJu2Fg7NAejHPRGN
         wDgSCHDx6DqTIt3YvBJRwwC38Nlo0HfrLrGMk3dSgDw6VqJX4ZZFeKxx/ob0QxPWqBTa
         JFtF4ArTSnDafb9Az/tWRLLVFOIIq0ScYCRbpoHYyyOAOIx5HCLAwHgr3Z0Lg0flVxbq
         CPmRtjSPCglyMkcGwkqgDaurbHaRBeiYZoHtCBXuGpQQsUA02vCRbI6hu5fPQuzrwdIB
         iju51PHO6N4EIn+uVji9A9EfFqQ72mBXLgG49p6mTv8+0MKkoss+z8z8uc+4bXttm1/s
         LY+w==
X-Gm-Message-State: AOAM530N+OUci+77zbrpImjDTaVL8koIIv/qmgoE1jkHbQyqxMjZlYr8
        FezMjKwNFnGlt5GOCyLIUcv3Pa3PqeEOW2u+iXNXMdlz9qbgw1KZjcErxn2qXkrXRJaa4PqqrZs
        EumXJdWDBLlsLsb6mGKXbBeS1ZjtW1U/6TVF0AU+aQgOr+nPc
X-Received: by 2002:a05:6512:aca:: with SMTP id n10mr5861357lfu.352.1635865207336;
        Tue, 02 Nov 2021 08:00:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpKYoWXcb1e5XTY/JXL1RkYaMDhZQt9YsDmmp9yiH9pGznUn64bwUGY7PscyGpzE5rbvxvwQ==
X-Received: by 2002:a05:6512:aca:: with SMTP id n10mr5861272lfu.352.1635865206564;
        Tue, 02 Nov 2021 08:00:06 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s6sm466639lfs.236.2021.11.02.08.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 08:00:05 -0700 (PDT)
Message-ID: <9242ba85-6884-850a-e670-bb9213f0eab6@canonical.com>
Date:   Tue, 2 Nov 2021 16:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a0KqS-OZoo46ajfaXw1aFXR9HouW2ZezKRWCawMa7yuGA@mail.gmail.com>
 <ee51e10d-0fbf-d87f-aa98-a95d97a7e437@canonical.com>
In-Reply-To: <ee51e10d-0fbf-d87f-aa98-a95d97a7e437@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/11/2021 15:55, Krzysztof Kozlowski wrote:
>> The ones that would help the most in removing are probably omap1,
>> pxa, and the strongarm-based platforms: those have a lot of special
>> cases in the code base. At least a year ago the maintainers wanted
>> to keep those around, but maybe the 2022 LTS kernel is a better
>> time for planned EOL.

Yes, either we retire the platform with LTS kernel or we should wait few
releases. Otherwise if we remove the platform on LTS+1, the LTS
effectively won't get any updates specific for that platform.

Best regards,
Krzysztof
