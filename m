Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F83C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 08:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F0C86117A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 08:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhKCIa1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 04:30:27 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:43846
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231511AbhKCIaZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 04:30:25 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 844383F1A6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Nov 2021 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635928068;
        bh=iiMC/TbWwWkVZ6Szlrhxi5wL8pvgvpBMcUFNxm6iENM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BOX0seKZ5eXLs2skVmwt1LcuA/Rf0WM8z2K0XkbPgfaWDH5zymMQgUqrpSp+Aigba
         SaruNtCBsW0w0E7nwcUIFWuYLOysOZv8pgwwlHVxFfSopvuArtp+1JiU0KZj4r0m0s
         OegBmwkMlm2VHC4aH0o6euVv+jVASM6Rf/vEIyUvyzXmPI3OQs4EtgKGnyzIkaoiFt
         5ITrU3rtOuzsc08DZXsGWmy3rdJfN4fbHaTuOTXBvhiI5Htc1hQz6xAdsxJclT2UGP
         wSfF96zDSIoSJ1Eix8r+464PdT+WA89hFi7/y+sGw8zADzTXmVVH8iJSd/DqAFfOkI
         8HUcd/sZBXDaw==
Received: by mail-lf1-f71.google.com with SMTP id d10-20020a0565123d0a00b004002359a671so350129lfv.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Nov 2021 01:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iiMC/TbWwWkVZ6Szlrhxi5wL8pvgvpBMcUFNxm6iENM=;
        b=e9Bzco3YcJPPi0aKjLmF2lkA6PKmjW2U1A90t4du5rHPCvPwlU00a45mXQ18L3+zkM
         0sgN3KwGPe3id9+TbJGTloA6fNymZr5ODFHwRYbQSg4k7Z1ax+ysrd8tMCyyfuKQNzRf
         KR6GuzxA8hmM3oT63lkOt/+pd15DbhnLGw5vaR64b7e8yCliHQhOIz/yxhnxPIeV7vvP
         i/CqPyqf5N8ECxi0lVArlmmgSbgK11vwInB0KoZ583w09Qy7jhvUGN2hA0ZJ4p2J/uwj
         XgX2suM5+jr2CHetaKibt1yUSciPAdikylbnixrDY7kCjgCdqR/YVedr32jLGhRZWKiu
         9HaQ==
X-Gm-Message-State: AOAM533v0ox5GCX/VibJZKgl3REoBjg6HMargOTtH2l07KlHZGhX1JjA
        hQ6hic5dVb61gAxzFvn7ge/6MLJRXioy9hgkbPZEsJJx+UrxJPks849p8wVKtwtnidU0Y+lCRby
        7KlJXNtwzXfPrLtYN93cMAO3ooFSYDkpn8pL99aPPBXeKzrtZ
X-Received: by 2002:a05:6512:3f86:: with SMTP id x6mr40055415lfa.616.1635928067957;
        Wed, 03 Nov 2021 01:27:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu43lUF6yDVHsDvyw6C4kRdXgj4eKQQH3FqgytHu5fTFkfmrcp9ngAlMz7Dgs1vjWLngCPnw==
X-Received: by 2002:a05:6512:3f86:: with SMTP id x6mr40055400lfa.616.1635928067747;
        Wed, 03 Nov 2021 01:27:47 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u6sm128527ljo.105.2021.11.03.01.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 01:27:47 -0700 (PDT)
Message-ID: <217cc985-9c82-f9ad-78ee-4d9d82a894d7@canonical.com>
Date:   Wed, 3 Nov 2021 09:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <YYFpZ9zh5++xl6nr@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YYFpZ9zh5++xl6nr@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/11/2021 17:37, Mark Brown wrote:
> On Tue, Nov 02, 2021 at 12:05:19PM +0100, Krzysztof Kozlowski wrote:
> 
>> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
>> possible removal in one year (after 2022).  The deprecation message will
>> be as text in Kconfig, build message (not a warning though) and runtime
>> print error.
>>
>> If there are any users, they might respond and postpone the removal.
> 
> The Speyside system is s3c64xx based, I'm in the middle of reorganising
> my hardware setup so it's not usable right now but it's quite useful.
> 

Thanks Mark for the feedback! If we keep the s3c64xx, are you able to
provide some tests from time to time?

Best regards,
Krzysztof
