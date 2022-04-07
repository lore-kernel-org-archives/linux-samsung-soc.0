Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9443EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 08:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243228AbiDGIpw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 04:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243232AbiDGIpv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 04:45:51 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602A7D95C1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 01:43:52 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n6so9265348ejc.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AzvrnUgBhvYNXPbA1hicIptk9K8vlP/oQGWNXIHZ2/E=;
        b=DzKHTBQFvU0DQ7nQ5GMZNNg86m//8Ob7ATXrFW3bnVNADYLyiBNImx5JbU9YMO9jNS
         8gsvODTMjJLaHX4Wg15mTVXldih2wJTi4C/PyB5YQ68tBVXxahRdvWveRqHrYsV5l0HU
         fUj+JUaXU9nJ4nFvB5guGJIsG8Ftb435ZMIiZ7DEdApl/FemeiOL7BgSkL2eUPhNdAtW
         FiuC3FGnjZ/sKUeWuWbFWNRHbkJ8KrcpG9A3zW1c1R/n1KA/oWLQ0Tunu8g10EXExWd8
         kSBJD/V555YJtHKEb50r/lFInzMn10kDtNTjmejOK9yPWhCVaeO2LWeh/B9iC3w5wmO3
         LpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AzvrnUgBhvYNXPbA1hicIptk9K8vlP/oQGWNXIHZ2/E=;
        b=wkJcf30HpFfLgcBStzkYY5pR4KSYIuIxrhxgmZPgriVvV4MhrB9HbbjaITYp5TbZTJ
         Q50hT3bOfSD4hFiJ3babgUSq6YAMIvEuI1/D3eU/3NbHld9/OpLI4e8cMx8W7oYfbBMi
         KDcAXJ8U4fOvk94ZoUkhzntRF2TdA791seZmDUzH5wUCfF+jiylLysDFBCqSTj8aYg7r
         l+ruIKG1X9qjEXa9OdUZ9LpqeomUIi3/r4vk9XZuiLbAQByG5Jcd8k/+APhMR4xz/XAh
         A+3ECr3iEvOx8pzBMH2ZIcB/qQer0AZlYnVwzsz2Tg9BFs+dGDYdUT9z+4zZ1/viShQi
         5yiQ==
X-Gm-Message-State: AOAM533keRB4Kj6tWb0+p2hOfaAwu7Zuj0ppnhKsFy6yyKY8Xr0+egy8
        1Od24Y4UbT2HfGeAVRGju1/tDg==
X-Google-Smtp-Source: ABdhPJy92V03/Z7dPcOPlQNI0l13ephK1a9zSR8fU5WUx1PP3AAPuZL2c+Hk5gc8z8t0YbIagEvzww==
X-Received: by 2002:a17:907:6e04:b0:6e0:95c0:47b8 with SMTP id sd4-20020a1709076e0400b006e095c047b8mr12215661ejc.483.1649321030880;
        Thu, 07 Apr 2022 01:43:50 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709066d8700b006d4b4d137fbsm7482790ejt.50.2022.04.07.01.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:43:50 -0700 (PDT)
Message-ID: <d1e40224-9537-1fbc-cf5e-2432fd001a8d@linaro.org>
Date:   Thu, 7 Apr 2022 10:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ARM: s3c: mark as deprecated and schedule removal
Content-Language: en-US
To:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>
References: <20220407072319.75614-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407072319.75614-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 09:23, Krzysztof Kozlowski wrote:
> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
> available anymore - out-of-stock on FriendlyArm (one of manufacturers of
> boards) and only few specialist stores still offer them for quite a high
> price.
> 
> The community around these platforms was not very active, so I suspect
> no one really uses them anymore. Maintenance takes precious time so
> there is little sense in keeping them alive if there are no real users.
> 
> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
> possible removal in after 2022 for the first and 2024 for the lattere.
> The deprecation message will be as text in Kconfig, build message (not a
> warning though) and runtime print error.
> 
> If there are any users, they might respond and postpone the removal.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> ---
> 
> Changes since v1:
> 1. Language: in->for removal.
> 2. Don't show pragma with COMPILE_TEST.
> 3. Add Acks.
> 

I forgot to add important part in changelog - I moved the s3c64xx
removal to 2024. There was an interest from Mark to keep the platform
running and it is a newer SoC than s3c64xx.


Best regards,
Krzysztof
