Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEEFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 08:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242691AbiDGIFs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 04:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242812AbiDGIEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 04:04:47 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C79C1AE183
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 01:02:08 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id dr20so9087333ejc.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FtTGYoZBTW8ow+PLX0i7R21myuU0fNNQcMhb+zblPAc=;
        b=uxqRn3a8IF8tiUBOJKawK6cuBCNe0K5brhulWQN8q2hgItAdi1G+c+dXI7QqZE4aUB
         1wkG65UPaesVBVCKQMrS1vu0UlwC6j3d2cNBI1ShEddVE/zRD0LE80pl+zr7jdAMmuPa
         5MTaLIxmhvn9EEfCiOWIHOH4WvtaqiMl8EmOmhH6bbrgQ2oOJylEJL8pMkIU6nVV/bFw
         RtvbJSsX6JC1AsJh9BG0zrmr4YWD7LFc3BZ1zHGgSD+rLnArpq+RbsxPWKtE7B2laCDx
         pZpSWXsmF7esXocSCbMJr/n1Az0KIGD/jABFis9Z+6G5/IJSX9hz0rjSaQmCj2v6dZc6
         jX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FtTGYoZBTW8ow+PLX0i7R21myuU0fNNQcMhb+zblPAc=;
        b=wKMH51Yw3ZoZWCGmRGYZLpc4UqO/awBmUdqfZZxn2qojIBdd6F6UEE2uXEBUtN1i4/
         nwRN4HV1vNnTEIMCFNOjf8DSq5cOQkntV7aaFQPVH7rVugtBa5NkIXcLyXsq9Sg65XOD
         q1IvOl3A4cOtxXIj1gFKcp6MEuNgxfi63xLwAuyziwlToJ9sKGvvHR9WjTBj23DyTQAz
         VfB7hy/nT0FKuN7NWQiWYP4fFyHnsfkkCRvFT1kLGB2PM/AnrSwaozVtWtbh2Agf8eFJ
         8e6UfyjAKvx4j0IOJmWuN6Dfjg1BfO7qLl3y+JxfVlY1CWmwWufs4dTxreMoQMVHGbQC
         Y6kw==
X-Gm-Message-State: AOAM530aSQTFYL23+SFVsVLdzMCDXBZ0VOrpYOzFXVMDqVayiCCtMwUk
        vC8wHqOWPk2gc0FclVmfa+88zLjoU4FcpJx6
X-Google-Smtp-Source: ABdhPJzwHOmJl6pbXXOV9Hl6T1ll6zknKrQ85BVeGuSYhvTIaYNHSBxWnNk6K2YCmPQf56IPUAM/mQ==
X-Received: by 2002:a17:907:7f94:b0:6da:64ec:fabc with SMTP id qk20-20020a1709077f9400b006da64ecfabcmr12353370ejc.717.1649318526653;
        Thu, 07 Apr 2022 01:02:06 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm7408620ejy.93.2022.04.07.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:02:06 -0700 (PDT)
Message-ID: <9bebcd48-b91e-9809-4eea-7c5e818a6b8c@linaro.org>
Date:   Thu, 7 Apr 2022 10:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ARM: s3c: mark as deprecated and schedule removal
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>
References: <20220407072319.75614-1-krzysztof.kozlowski@linaro.org>
 <CAK8P3a07vWeYcVdzNjv4HgP_qhU9rQBkcKKmxoy8Uc9gg_0VUQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a07vWeYcVdzNjv4HgP_qhU9rQBkcKKmxoy8Uc9gg_0VUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 09:40, Arnd Bergmann wrote:
> On Thu, Apr 7, 2022 at 9:23 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
>> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
>> available anymore - out-of-stock on FriendlyArm (one of manufacturers of
>> boards) and only few specialist stores still offer them for quite a high
>> price.
>>
>> The community around these platforms was not very active, so I suspect
>> no one really uses them anymore. Maintenance takes precious time so
>> there is little sense in keeping them alive if there are no real users.
>>
>> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
>> possible removal in after 2022 for the first and 2024 for the lattere.
>> The deprecation message will be as text in Kconfig, build message (not a
>> warning though) and runtime print error.
>>
>> If there are any users, they might respond and postpone the removal.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Heiko Stuebner <heiko@sntech.de>
>> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Should I pick it up through the fixes branch for 5.18 if there are no
> immediate objections, or do you prefer to just do it as part of your
> normal samsung patches for 5.19?
> 
> If you have nothing else planned for mach-s3c, I can also add it
> to the multiplatform branch that already touches the platform.

Feel free to take it as fixes (or s3c multiplatform).

Best regards,
Krzysztof
