Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D9CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 09:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbiARJ5Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 04:57:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:43524
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234406AbiARJ5P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 04:57:15 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2373C3FFDE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 09:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642499830;
        bh=MFO8uJDAvBhLowCeOE4JP5TX6QErB5JH8USU7be5UeE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=lBPektgmsyKjW96R/pn2LLliNCPHGOWZ8dxDOFQB7XVbjjA642LbADMEWzwlU0kSN
         fIVDcS2C6vcA4j4yVuwkCEswc5MB5s1vp0oFlxWOQp0pvQ3j+VoxLF8tSOA8eeF+Au
         v/EWxJwLPxfdZvuyUwakuc+T23tMObbCVpr7dtbrcFmSrxn4WH97MMGDywau9GBLdN
         c6CGd5moqU4j5A7WQyu2dGdv1L3GnRqA2SFnOk1bmPL5HZ50Rxu/Oa+u/XPbY0HL/p
         tb37VjriGQZcJkGylCZXiGI+Di4WRZZVFMViG4+W5yJekuTgS+jSey0pBeKt/9vHhl
         a7RtbszBgZXHQ==
Received: by mail-ed1-f69.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso16539102edb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 01:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MFO8uJDAvBhLowCeOE4JP5TX6QErB5JH8USU7be5UeE=;
        b=ZCmDmMPZOkMUvg2jpSF62gc0S4vl5CvsSsvwIdb2sVxsvTtMwf97qV0x2mv9yQMfrV
         9AfeyWm0y5I6JMibJpAgZsjvYdFjw8YP2o5FUVgD0cuxVfirdDfltr/28WJC1B36af+1
         kWD8IH0U/EFfP5l624MgmhilpoMzCga/q74AHjciqxEryJ6INUUm+Zi7LxLWKEufyi8M
         w6md9EBwqxdZ5wosZ0+IZUVfxcYBhmG/m4Z2ACVl1Mh95HLi+YnzCaQSY6F8/UNEEtVR
         VU/6gAqw4liTAc6yyoH4Zp7KHIElU/PI6YnbqAwdiJVaxyrCSSSF7MBaMIqFNfHONBte
         tE1Q==
X-Gm-Message-State: AOAM533OghYouOyChhm4lSr5axzT3CdFwDZlH3sNHRHzBkWOnwsXMVlv
        qZhCfCV6n1C6vfCiy9cWJgltrfOGdsbTSPTc2Vj+Ak/YX6Hv1uLHA21+UOBsozYvzZEV0cUftBm
        ga8oQAedkF1v93FJ+xI4IXtQw3RVYMUZRz4oA6rWOZ/9H7rPs
X-Received: by 2002:a05:6402:4487:: with SMTP id er7mr22619883edb.80.1642499829412;
        Tue, 18 Jan 2022 01:57:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw82bMu0Ox8GmWEm0lEqeltlKhMHgQUplgcxOT7MOfUNw7zdvb0xlBkR22QRB6PDiK4TTVE8Q==
X-Received: by 2002:a05:6402:4487:: with SMTP id er7mr22619872edb.80.1642499829224;
        Tue, 18 Jan 2022 01:57:09 -0800 (PST)
Received: from [192.168.0.41] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id j13sm6913874edw.89.2022.01.18.01.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 01:57:08 -0800 (PST)
Message-ID: <eeafdcd4-3527-f18e-e92c-0544bf2a83e8@canonical.com>
Date:   Tue, 18 Jan 2022 10:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] spi: s3c64xx: Convert to use GPIO descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20220118023303.104419-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118023303.104419-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 03:33, Linus Walleij wrote:
> Convert the S3C64xx SPI host to use GPIO descriptors.
> 
> In the process we tear out some unused code in the machine,
> such as the unused config options for SPI controller 1 and
> 2. New systems should use the device tree boot to enable these
> SPI hosts.
> 
> We drop the ability to pass a custom pin config function
> to the device while registering since nothing was using this.
> 
> Provide GPIO descriptor tables for the one user with CS
> 0 and 1.
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mach-s3c/Kconfig                 | 12 ----
>  arch/arm/mach-s3c/devs.c                  | 77 +----------------------
>  arch/arm/mach-s3c/mach-crag6410-module.c  | 13 ----
>  arch/arm/mach-s3c/mach-crag6410.c         | 13 +++-
>  arch/arm/mach-s3c/setup-spi-s3c64xx.c     |  9 ---
>  arch/arm/mach-s3c/spi-core-s3c24xx.h      |  6 --
>  drivers/spi/spi-s3c64xx.c                 | 50 ++++-----------
>  include/linux/platform_data/spi-s3c64xx.h | 16 +----
>  8 files changed, 27 insertions(+), 169 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
> index 25606e668cf9..1899fc3f44fd 100644
> --- a/arch/arm/mach-s3c/Kconfig
> +++ b/arch/arm/mach-s3c/Kconfig
> @@ -191,18 +191,6 @@ config S3C64XX_DEV_SPI0
>  	  Compile in platform device definitions for S3C64XX's type
>  	  SPI controller 0
>  
> -config S3C64XX_DEV_SPI1
> -	bool
> -	help
> -	  Compile in platform device definitions for S3C64XX's type
> -	  SPI controller 1
> -
> -config S3C64XX_DEV_SPI2
> -	bool
> -	help
> -	  Compile in platform device definitions for S3C64XX's type
> -	  SPI controller 2
> -
>  config SAMSUNG_DEV_TS
>  	bool
>  	help

Looks good to me, but I would prefer to split the dead code removal
(S3C64XX_DEV_SPI1 and S3C64XX_DEV_SPI2) from actual conversion. Such
split should be doable and would make it much easier to see actual
conversion.


Best regards,
Krzysztof
