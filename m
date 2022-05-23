Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D63C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 10:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbiEWKWT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 06:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233991AbiEWKWS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 06:22:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6713B28F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 03:22:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y32so24731164lfa.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HNshsQ+jjwxazxWRShiy1xQPJQNvQBGxNnmIIrcdM+8=;
        b=eWB8K4d6dGx2vtV8LZ16/Z5P9sYbaAwVmxtAmLUbP8zPUkxvDrDQ1Zp35Ehg6Xk0Zt
         f3FnUI2rRroOi5uxhh1TEXOQ51XDnBVWwmZ24lKmC0Agb4jQ8cbQ5f7+nk1jUcyMUde9
         B+XSIeGu886HX7x5VNbKhcO/TQ58/5ZvSZ9O6UtO/YaDbkpv4Hk9R5zZK9jE7+dZAAFk
         c4X/nlbrOwEPtc8yCJ/vIrff9QkxD1kIsV1cADEwBAAloRGQAOEFoN+cfFwKAk0f+xtB
         qIFX8U69PWug5AiZwTx7hOSU+dKbXMaAVGMnanb+h7faMkHGA0HlsaiZfBAtDRI2xtS9
         c2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HNshsQ+jjwxazxWRShiy1xQPJQNvQBGxNnmIIrcdM+8=;
        b=5CgrRcUOIoJ7hfVzWDyA4nbhbNruokhs2jwoKTWgwyFi+4Yc6SpOONavWe2pFEZt7k
         X6zalAz0luXfrCBPFed/XHL4IsPiy2mexUcIyHKvnw9wvCJcs+oAoqOiKWAge6vlMNY9
         tG9aCzQycUbczyqswAfB1/Za0RsN1B8AX/4nsTYDT17xL5eep70GyPGw9fOybkeaQhBb
         bi4gBsx6iZuGdu0DUIthTAromAq/FBwk75+2ETMzBAuC+auIT5zkiO9OjheB/TVYXi3p
         yC862X1M5SHsRn4kREz1xAHIB5T+AGaAV2UbgRJHG+yzKxK3NSJUOE3U8Kfea7LPunzI
         zJ5g==
X-Gm-Message-State: AOAM532S0x0Fkj3Ty8lMZEqN3gMXEpl0A4c5NbIm4dfCgF2mnSs1d3Tb
        QFYsEQBDx3WQ2ZOew8ZmL8Rrmw==
X-Google-Smtp-Source: ABdhPJwlll0aDgo5Ev/QIHW25Kv2LtXA5WwszdfvpkXDcLDBMOGt9NFWl0tHQ0BayjkbbGmbr4cMEw==
X-Received: by 2002:a05:6512:401d:b0:478:69b9:2a39 with SMTP id br29-20020a056512401d00b0047869b92a39mr5175918lfb.500.1653301335563;
        Mon, 23 May 2022 03:22:15 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d11-20020a0565123d0b00b0047862c69e83sm1032131lfv.40.2022.05.23.03.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 03:22:15 -0700 (PDT)
Message-ID: <d04b6d8c-0117-b5a6-dcb5-aa328ad5d1f5@linaro.org>
Date:   Mon, 23 May 2022 12:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arm64: dts: fsd: Add ADC device tree node
Content-Language: en-US
To:     Tamseel Shams <m.shams@samsung.com>, jic23@kernel.org,
        lars@metafoo.de, robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     geert@linux-m68k.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, alim.akhtar@samsung.com,
        paul@crapouillou.net, linux-fsd@tesla.com
References: <20220520145820.67667-1-m.shams@samsung.com>
 <CGME20220520145804epcas5p2925e66d30b18378fc62c92999ec269f7@epcas5p2.samsung.com>
 <20220520145820.67667-4-m.shams@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520145820.67667-4-m.shams@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2022 16:58, Tamseel Shams wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> This patch adds ADC device tree node and enables the same
> on fsd platform.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> ---
> - Changes since v1
> * Addressed Krzysztof's comment for corrections in dt files
> 
>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  4 ++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 11 +++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 5af560c1b5e6..63f26a85053a 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -34,6 +34,10 @@
>  	clock-frequency = <24000000>;
>  };
>  
> +&adc {
> +	status = "okay";

Please test your bindings (`make dtbs_check`). There is no way it passes
since you miss at least supply (maybe more?).




Best regards,
Krzysztof
