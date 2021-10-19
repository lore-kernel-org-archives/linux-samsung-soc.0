Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63015C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF4A60C51
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhJSQ07 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:26:59 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45534
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229649AbhJSQ06 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:26:58 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 311C04074B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634660685;
        bh=498IUqh7qiqUKcZ9Q0qZOmmm/FH00+0dL2t8BJdk6fA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=apnn2sB5st76EtsitHaukDhDJOObRvaO+OWhM/gtXGB6nbTm9zZMvpAER6CpOdxUO
         Mqi5l5vrbipouLmP+RWop4ljgdceT+52lQUGdsemC2xFBSawiVS19hCmEsYrkqAwod
         oD+IX/S30pRyI8y1id5Up1zELEoBpng9QWrAuryGR+yu/PzSkHYR9jO3HuiU49Z6l1
         Fgv/ejqrxxoj00JxGli/azcfak1l8swCqCc6vBndOrvKTg246qBvuQRPbxud/TBWPE
         plNOxHfkPABtb4QSeYELIxzUDKik7QsRBWtHB19DGkElsb1JcmwJbeq8svbQ34vlzr
         guueitUlLcT/A==
Received: by mail-lj1-f198.google.com with SMTP id u21-20020a2e91d5000000b00210e16996e5so1083830ljg.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=498IUqh7qiqUKcZ9Q0qZOmmm/FH00+0dL2t8BJdk6fA=;
        b=7Bc4bYzTGFZZXi4Hgj2a/2PJswaTKP/KFHWWJF2TZzcdHFoBu2+t4p875yunYfQhm6
         9kC1mqi0aiSSlLlKf9edZnO4uZb3cjmskE8C9XKOrFhpirL7S0BWnHyWGBn1SNWQ7I9A
         FZqDxbnsTMPL6JghjIvDOt8nvvryiHquZU0pimNWcQIQ5XpGDH+iM8tW8oBf6QRDxe1M
         fkQkjuaE4aUIvoCOSdHKjTNF6gVmhGuLbY8SbgfotwPotBXMMH3TU/tIuHJnrv3XGq7N
         2VEeGq0zHNvR8HBc4ZLYY6mfi0xAGZ340za7qo9f5BVwLT3mgNRVe+qDH6s/bHc2W2pu
         hP1Q==
X-Gm-Message-State: AOAM533tuEQp1i7bXLj7DHgC8CLKJgZProdacDXx0m9NX1qhBoLmnJdL
        g0XC13ypFr3y+L9ILN+DjAVAALGgXhk8l+1I2AU/6brhqzb0ksZUuXH98NgSxl+F4O8fBxFF306
        QVSxd7SeySwZbLIJaEra/Wfy0e9LoIBxPRjeEKde5dqOeCrCX
X-Received: by 2002:a2e:9d2:: with SMTP id 201mr7553964ljj.163.1634660684596;
        Tue, 19 Oct 2021 09:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykGa5sogCFDqH8jTBbw0yAdFSWHwImCp941pYeQoMrhNAOHaCU1EWke4ktmA/lwSiGuenk1A==
X-Received: by 2002:a2e:9d2:: with SMTP id 201mr7553945ljj.163.1634660684344;
        Tue, 19 Oct 2021 09:24:44 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f6sm2115939ljo.36.2021.10.19.09.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:24:43 -0700 (PDT)
Subject: Re: [PATCH 3/4] rtc: s3c: Extract read/write IO into separate
 functions
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1a71e63d-0586-2208-bd84-6bc2d15147e4@canonical.com>
Date:   Tue, 19 Oct 2021 18:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019131724.3109-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 15:17, Sam Protsenko wrote:
> Create dedicated functions for I/O operations and BCD conversion. It can
> be useful to separete those from representation conversion and other
> stuff found in RTC callbacks, e.g. for initializing RTC registers.
> This patch does not introduce any functional changes, it's merely
> refactoring change.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 98 +++++++++++++++++++++++++++----------------
>  1 file changed, 61 insertions(+), 37 deletions(-)
> 

Looks correct:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
