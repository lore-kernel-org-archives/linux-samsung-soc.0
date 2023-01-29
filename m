Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CC5C636CD
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Jan 2023 10:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjA2KmT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjA2KmQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Jan 2023 05:42:16 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F91623C67
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 02:42:08 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg26so378841wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXgqdoXcUMyMc6/0gA1NBY8dCzPhQWanTxOlJfyNl84=;
        b=FgA4gJMECOxptlCugW/QrkDIOACd+xEinRXDTj128zdqh9c+sYEe0jPuAAVVJR77jU
         GLXawRN2CiFVMFZJHA9qgQFZAqJM09q8QEUb3VXfrRTPyteqfP/lNe3UqVBhDXrWscw2
         LG/1RaoCGYXIEsuRC72KdI3h39KbrANvJfQjE5m0PsgD83bB0xlPeIDNyp0U2mvFoAHi
         +x1tnqSv76ahwu7gwJqoSDaif3wgXsAKoH6QHOyHqdENkmnCCVzfhDLehWvgJIGxDQjq
         i6heOVoAr55ZmohX3AZaoBY52VG8Ybl3pOm0c7hFt/v0AL/LGkvtYFAF5X33lm7QXv2b
         Ec/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXgqdoXcUMyMc6/0gA1NBY8dCzPhQWanTxOlJfyNl84=;
        b=I0YpK8L+pOw2xRPr3KcXsmB180m0STuFwpFZHHzjjJrofAFgNNF4y6JA9tU1KyxTbd
         hDSfNNlsxDL+jUcDoEr17qKUx52v0IJCQZ4XYia8RU5GL2n9TqJXHpx5n1GVFZlw9S3a
         ddzTaqgUXhk9fVOqohIi3UGrMGBgDjQXGULhxBCAAQ5TcXSsIX0AoOu6TLh3+vDF9xTr
         rMAUiHjHDhz5Gm/Pg3RpFapMqQJMBhMm6gv0vHzl7V8gV5BvsjWHieMoN4uX1AQPISPT
         q6gHLN2hYbm2iBBOaniEMpQSQ5g5f/Cjzs5FBtL2IfjeWmO8XiV9FL3zqjVxiDQMNFl0
         OW6A==
X-Gm-Message-State: AFqh2kqVPNeL8iHN22BYFqT31c81BDFQNZOzClO2NWjVGabLIYovKGX7
        gr8ilZMjjXUTj3EwGoJNC1W4Xg==
X-Google-Smtp-Source: AMrXdXt/tOSXhOlfJbbHQeMJB7LiNKFDEtMZmzGAJfxgE51xT3tOibxaBd9wR7NI/IvW5iYYm8Ut/w==
X-Received: by 2002:a05:600c:1c01:b0:3da:fc07:5e80 with SMTP id j1-20020a05600c1c0100b003dafc075e80mr47517410wms.12.1674988927480;
        Sun, 29 Jan 2023 02:42:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g8-20020adfe408000000b002bdda9856b5sm8949084wrm.50.2023.01.29.02.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 02:42:07 -0800 (PST)
Message-ID: <a2a97325-cfdc-5ab0-6abf-8774ff0ac9fd@linaro.org>
Date:   Sun, 29 Jan 2023 11:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/9] ARM: dts: exynos: move exynos-bus nodes out of soc in
 Exynos4210
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
 <20230125094513.155063-4-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125094513.155063-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/01/2023 10:45, Krzysztof Kozlowski wrote:
> The soc node is supposed to have only device nodes with MMIO addresses,
> as reported by dtc W=1:
> 
>   exynos4210.dtsi:218.20-224.5:
>     Warning (simple_bus_reg): /soc/bus-dmc: missing or empty reg/ranges property
> 
> and dtbs_check:
> 
>   exynos4210-i9100.dtb: soc: bus-dmc:
>     {'compatible': ['samsung,exynos-bus'], 'clocks': [[5, 457]], 'clock-names': ['bus'], 'operating-points-v2': [[82]], 'status': ['disabled']} should not be valid under {'type': 'object'}
> 
> Move the bus nodes and their OPP tables out of SoC to fix this.
> Re-order them alphabetically while moving and put some of the OPP tables
> in device nodes (if they are not shared).
> 

Applied.

Best regards,
Krzysztof

