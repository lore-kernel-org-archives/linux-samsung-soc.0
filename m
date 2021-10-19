Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65534C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B39960F93
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhJSQTm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:19:42 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59286
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229649AbhJSQTj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:19:39 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CA9323FFEE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634660245;
        bh=5n5+BxtpU2/SfKCGjzGsocxWMJKbzYIF01K9nkKGecI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SzzC7Yb3BVlKIz5HOb+z9MBLBlphCd4Eix4C7QRaETxHu/BECTVP32cuqouPAkzPV
         Ia1CrIP4Hcom8Oaoy987xPJ89weI7tq/DKhuQiTn/iTXx/sgk4lGejeBdkME0qb0MQ
         4Occ2N767gA6rXZkmYZNLuT2SLFbJrgLJoBqoQ3n+IlgUMd8FLZt+YCHCqU5E7cE3k
         DO7PwcRV6Cua+JINKU78rhYiqCR5l966r6NNc6kgkH3A5Sin0eJqNcC8OF7UvATlTi
         9IW505NkOrfh0pytdLpstnLi+BfcPnvJ+MHLz+ewGYOmkPSQ8bE11OurnuH/CxQaLB
         cTFtEXPatDC4w==
Received: by mail-lj1-f199.google.com with SMTP id k12-20020a2ea26c000000b00210f22d4769so1085527ljm.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5n5+BxtpU2/SfKCGjzGsocxWMJKbzYIF01K9nkKGecI=;
        b=tN5F1XymEfB6qzL48JhCVgDmDrKzj5Y1rd6qQ/F5PcRbdes8iFzSKXCRr4Aidd3ACD
         qXDDYqicxT9sqZ7oKgqKndJ2NaRZN2Ca0uzSOxTMSnQ0vHkwiWyODBchasEizUQFIs04
         uXiIaan3USAdAqMr28oSuysqjLXILvF/zchT0JJ+gQNuz34TT2Y9wcQHIt7T2J8Ak3d4
         xd6+bZY8AaKvOfiKluIFujqBEfZ8E8s7s23xHSNmXrLLmjVuTgzpZDS6QQPAXUNRwKC6
         oIMXuD57HHq2DnCqbVx2z44r1n+kCXcsJH7AizMoSSnt4V+qEiZO7pkVqOVzJR872NiZ
         JfZg==
X-Gm-Message-State: AOAM530Ay8vZJqJx8dvKKrGcW6qj8ZxtpIR7k7008aXnMgRq3awvE2Ix
        DKCnczfBqv+DVrFBAccgP/Sqb7DIvmXpNha29Rf9E8O2S5Doqqt3TGRIBWL3dAZhBNLVMot9uHN
        ugrCRgjhuA0aiPfFXFLtpwOdnCPvpT97x17ics3gDr01PVLSk
X-Received: by 2002:a05:651c:20a:: with SMTP id y10mr7999404ljn.419.1634660245226;
        Tue, 19 Oct 2021 09:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG1Sp0dwU5JJ3Hz/2pBUPlBlkL6ysw3jgDv0PJbao5+s3gI6bl1xAX0wMkZ22JEX4N7QaW0g==
X-Received: by 2002:a05:651c:20a:: with SMTP id y10mr7999385ljn.419.1634660245071;
        Tue, 19 Oct 2021 09:17:25 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p7sm1708111lfr.203.2021.10.19.09.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:17:24 -0700 (PDT)
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
Date:   Tue, 19 Oct 2021 18:17:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019131724.3109-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 15:17, Sam Protsenko wrote:
> This RTC driver only accepts dates from 2000 to 2099 year. It starts
> counting from 2000 to avoid Y2K problem, 

1. Where is the minimum (2000) year set in the RTC driver?

> and S3C RTC only supports 100

On some of the devices 100, on some 1000, therefore, no. This does not
look correct.

> years range. Provide this info to RTC framework.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Best regards,
Krzysztof
