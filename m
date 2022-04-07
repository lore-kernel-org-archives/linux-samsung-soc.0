Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CDFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241749AbiDGHbI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241745AbiDGHbH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:31:07 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F097521B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:29:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id f18so5360129edc.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VCPl4YRRl+vZCau7x55s379oALPyA3xublrB92hsA8Y=;
        b=JmLDOUVhDqi064o/CA5UO2nQTeicGg/x4NBcEk9Zi1uwhZgbkLHFqvrAJum9UQL8me
         zfgUuJ0+gRfbfOnxy/F16k/JpFZJeIvuSH6qiBjVznlCyEYCyNgrolloMAyBfiHXqx4K
         xV5rKlnw1BlVroEpNDTejRpIf1YJEJAZhjHRQyL5MDOkeg3m6DAQuVINHXMJblcx0rqs
         zcB8pUs2RbZWuFFaavfagtO7frzRumRdUrEP62+kTCsvbk7dtshU+KlSfWmMcwDzf8/b
         xUhTRAS0N+JmUHJi/IEamYAdgTtYbKB68akTdg6nTJXb3jWTPOtASQWxjbJdWezWnwF6
         p5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VCPl4YRRl+vZCau7x55s379oALPyA3xublrB92hsA8Y=;
        b=S22QN+FGi0gqZMWA+v6XpdLTvswZMottPMWD5z5mRO5MBw9HMRcwiRGggOjAnj5eYN
         +1uoKARkFabmFn/kugsMyeDUcyS5ujnIr6pq0rkj59WpKsJgmZoRajTahc+eWoGB2FxO
         Tk3kmGMTPbBKE+KCmfv4TPKhcKgHd2djm+sHz5MSiL4vEbc9E1HWKtIrs2AejIc7m8au
         a/0W23DuZFS/tnX17NhtyHgDfVIw0pS85milK7MII2Gy+P1uN4u0g2FANZXvY2kQZS0m
         w9jAQZY7yRLmnEGOW+cPVLD0OlRLxPDdsc+B/l6offnpmnrtdWxTZC/kVoG5UUlj5Xkg
         etww==
X-Gm-Message-State: AOAM532yVAVM6uaT5aajzrMuSFCprnVgmTwPYb2fICvVbtnPYUuejK3M
        z+GQqNS/Mz13pfniPih4FjQKWg==
X-Google-Smtp-Source: ABdhPJwQ2Ds1Umydr/5o+enpSVqH5N8+7ikHzTWeNHBOApVPo/Cn9n18pDrbmh7lgRtutGE1Ma+bYw==
X-Received: by 2002:aa7:de96:0:b0:418:f9ca:67f6 with SMTP id j22-20020aa7de96000000b00418f9ca67f6mr12855139edv.25.1649316546462;
        Thu, 07 Apr 2022 00:29:06 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a170906235400b006e718d8b849sm5472673eja.45.2022.04.07.00.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:29:05 -0700 (PDT)
Message-ID: <28dd4973-06a3-ddf5-4b98-3f7ffbc3cf1b@linaro.org>
Date:   Thu, 7 Apr 2022 09:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 08/12] ARM: s3c24xx: convert to sparse-irq
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
 <20220405091750.3076973-9-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405091750.3076973-9-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/04/2022 11:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As a final bit of preparation for converting to ARCH_MULTIPLATFORM,
> change the interrupt handling for s3c24xx to use sparse IRQs.
> 
> Since the number of possible interrupts is already fixed and relatively
> small per chip, just make it use all legacy interrupts preallocated
> using the .nr_irqs field in the machine descriptor, rather than actually
> allocating domains on the fly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
