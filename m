Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AFFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237102AbiDGHJt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiDGHJs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:09:48 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A2D12769
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:07:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bq8so8841227ejb.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 00:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jghw2OkvXVrUbJnBfiyQHEku1OBPfvahy/rHA2CJnXo=;
        b=beTc5UmQxUa0QhUYEOTj6ZiwqlMhoA6vkgWaiSqAgHkvaPdGZyhPa3GM6mgoyP0veL
         dSvylu67XwSxmgHdHtvv+qHNgOM+9tEoM0uhCAb6PS7yPpbKdSxoJRWynyKV50rykOAZ
         IJnOnNuZ1/rOakrcZliMhIzNM2Jx2huBGUJLal1rdOYR+7ezZKAWFXwq7WrBSwzy1JHd
         YGKUY3ucVseaBYnOOjvjJUYVbm/wlKoGpZLdUOBHrXScQVfjAfidZvM2Xa7LuvMBCwbk
         ENQfU54CODmx7rq5FgDanrd6TxVyKjFPZHI40jtbnfSrv1kgSbUeYZNrKWcdLP07/S4n
         dGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jghw2OkvXVrUbJnBfiyQHEku1OBPfvahy/rHA2CJnXo=;
        b=q+saVBgR977z/C7E3Gzp0mMltoaayOIjk5/FHOvJM50h1rZtVqU8ZWGpx2+EHAVI8M
         rI6ZktPxSFzu3yBnRY2kxVFP1nrUmFWQx/7blpuqZVTFPhvd7r2fj6yi+9yUwXFI3H/J
         TmdFwnXeqHclqThaPlSJzZ0h3vn7UvTl6VcJSuU7i4ouex9oISiQvH5UjjL3jPN+nbqy
         UaMWCkmZUtwtpnmBG5ZICSkO4Hkec5G6Wl0f1kTl1fS1bEd0MNYd4/zZHkPTqy3foX6B
         lnyWl2eSnz5l5vSR1OouJk7zJ5bpZWG6gnEyhCwtwTgmqWf2MWq9AfpT64BDyay+EUdP
         dGVA==
X-Gm-Message-State: AOAM532BjFiOf7XdB6gnESnkDNRMhB7JubH8893fsyeq0mfJAbc91737
        qdeQCav54r29UfypFW8f9LjnqQ==
X-Google-Smtp-Source: ABdhPJyftBnN/glesDxR41fcaJIB30rH7Lgr8q5QGLP0KBuJcKdwSTpIKpmTuG8T90UOeauLD5Wvug==
X-Received: by 2002:a17:907:3fa6:b0:6e0:dac6:79d8 with SMTP id hr38-20020a1709073fa600b006e0dac679d8mr11736041ejc.86.1649315267817;
        Thu, 07 Apr 2022 00:07:47 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709060e8300b006d0e8ada804sm7312529ejf.127.2022.04.07.00.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:07:47 -0700 (PDT)
Message-ID: <e39d4d71-6ef3-b2b4-3697-1babbadab2ab@linaro.org>
Date:   Thu, 7 Apr 2022 09:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 00/12] ARM: ARMv5 multiplatform conversions
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Hubert Feurstein <hubert.feurstein@contec.at>,
        Lukasz Majewski <lukma@denx.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
References: <20220405091750.3076973-1-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405091750.3076973-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/04/2022 11:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I revisited some patches from a few years back, to see what
> is needed forsome of the remaining platforms to become part of
> CONFIG_ARCH_MULTIPLATFORM.
> 
> A few things happened since I last looked at this, which helps to make
> this easier:
> 
>  - The ixp4xx platform saw a large scale cleanup
> 
>  - The ep93xx platform lost support for MaverickCrunch FPUs and
>    gained support for the common clock subsystem
> 
>  - The OMAP1 platform has a proposed patch for the common
>    clock subsystem.
> 
>  - The generic IRQ entry code is now used everywhere, including
>    on IOP32x.
> 
>  - The s3c24xx platform is scheduled for removal next year

Discussion [1] actually did not end with conclusion, but through all the
time there were no other votes for the platform to stay.

I will resend my above [1] patch to mention the coming removal.

[1]
https://lore.kernel.org/linux-samsung-soc/CAK8P3a2Pg8CkXgN8YNhp2U5Kgwf08kQGpLeTsyWKgNpGChC4uQ@mail.gmail.com/


Best regards,
Krzysztof
