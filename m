Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAE7EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 09:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGSJFE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 05:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjGSJEp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 05:04:45 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CF61FFE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:04:03 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e48e1f6d1so9050139a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689757409; x=1692349409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F27XqzzW7q33Wp2g/zPa0ZjiAOOQFuYmftfd3XIZhAs=;
        b=of+NxapxRHk7sPoO2GDjV8/dEpSvL+JPj+b3TQjro2J/OONXL5F24nML0veN2dbGd7
         hbztLZJA27hKTQ7P1ZoRp3y1FqdLDV9zZ+YWjW5NcDZC9WurReshTLW/p5XO6Iww8uru
         yu70gS37m0NWvGbqazmD63IYfgHLbXpZ6jFySLeCIXLotmNowGErMHMX7mrV3r9+at4t
         ZZz2s+QZPuRK84YAMNb7/usoo727fiFhySVaTbmx6ofNWXjdfqSx3OFfY10Adcmsxe3L
         IrautOd9Q/Dqa6u0z8iEffKk4dexRMYNG3Be43T9d/9SULY+6bW0U3YJhWlMaw9v6ODL
         fOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689757409; x=1692349409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F27XqzzW7q33Wp2g/zPa0ZjiAOOQFuYmftfd3XIZhAs=;
        b=JKcUcXfc2ivscM0R638z01LrOEIZyrER6XJIqVqCykitvrlNegccMlktf3Ah/go0ls
         QjngEgSoieaXsXgW3IMXejmUvf8uWOMpLdZ0V8v7J/5Mz6SqQN2zyDThbWeOFTmvAuv7
         +t5udkaufEMux40cJb4JTgo90kZKBqPTyO7TQJovIZPt+LNnbC1My05e1ZW3w9QrJAjT
         uivEtepbqBJ8sVwkmK+/u3EUjWe6UDVo8uXuoWbMYbYa9SQ1Uj+nlqz+jEQmfACxSn61
         grgS02ht/+ZPNHZFuNysKkR4R2he9eIHHlKmHesP4VpR+fMv6V+mB1qHMi2kIP1DFhAY
         0W/w==
X-Gm-Message-State: ABy/qLb4bcP62r8lWXsP7PpvIuQKc8OKnt9i2H8Vo25ebTF/0gP2TR8Z
        fZlSWjHtMHc3bQGUju1tLDu7Jky2fa5Llh/a5SUURw==
X-Google-Smtp-Source: APBJJlFrkRPClUnfh/JJzNMCAHo32TQNnRfm7MaFZDw62cPVBJ4liki4XCE9v26LoPpFN9NJk3rCAA==
X-Received: by 2002:a17:906:1010:b0:993:d6e8:2386 with SMTP id 16-20020a170906101000b00993d6e82386mr1740257ejm.16.1689757408921;
        Wed, 19 Jul 2023 02:03:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906851200b009887c9b2812sm2074162ejx.8.2023.07.19.02.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 02:03:28 -0700 (PDT)
Message-ID: <8891e583-ac91-8650-7032-d18603bbbeb9@linaro.org>
Date:   Wed, 19 Jul 2023 11:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/7] Add various peripheral support for K3G
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230716220644.22158-1-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230716220644.22158-1-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/07/2023 00:05, Markuss Broks wrote:
> This series adds support for some peripherals installed on
> Samsung Galaxy S5 (SM-G900H). This includes the WiFi card,
> GPIO keys, fuel gauge, touchkeys, notification LED and display.
> Also documents the peripherals for which we currently lack drivers.
> 
> Markuss Broks (7):
>   ARM: dts: exynos: k3g: Add WiFi card support
>   ARM: dts: exynos: Add GPIO keys support for k3g
>   ARM: dts: exynos: k3g: Add fuel gauge support
>   ARM: dts: exynos: k3g: Add touchkeys support
>   ARM: dts: exynos: k3g: Add notification LED support
>   ARM: dts: exynos: k3g: Document the devices which are not supported
>   ARM: dts: exynos: k3g: Add display support
> 
>  arch/arm/boot/dts/exynos5422-samsung-k3g.dts | 256 +++++++++++++++++++

I don't think you based your tree on anything recent. Looks like
something 1 month old or even older. Please always, always base your
patches on maintainer's tree or recent linux-next.

Best regards,
Krzysztof

