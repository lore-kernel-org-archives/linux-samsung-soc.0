Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC331C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbiECJYU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiECJYU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:24:20 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F591DA4C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:20:48 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id kq17so32280608ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O1odU0XMaRpIK2hzppRyzyxqn8WEnGsxlvHahk9HDE0=;
        b=dRzLlIzNCQEmufC5WQFnTgNtTn25Tkrmt09tjG5jOiUCAyYL5c0hyv83kTUDaZFg96
         utscISg5ufbC0QmBJ2aT7dy94x8kEzmWL0TiTBoGghT38K55Ji6ufPRluJ6+VCsEr332
         Euliw3NQNx4GDZQ3B1jGmm/DEyjZChThvlhp2Ml5uZQW+t58OHGL12nD2HZYRavfoCmy
         uuKTb2bz1DvEUKvJnRUR+25SqYa22s3PwbZtPS9ZGrrylEbjgtrNLZgJWMk/oWCWktWc
         vmRrJesCqWNc7RmIlNLLle7oI+d0UiU/WTOC9VDzmNkBU+RYNU1Wg31nFcKNWTvHTEVd
         gidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O1odU0XMaRpIK2hzppRyzyxqn8WEnGsxlvHahk9HDE0=;
        b=Vi//Sg8LCpPjV1bXWHImQdA+A5KWayFuS2N7y3QXX5+9Y6GSYFxmgcl6UoIDVhVi9x
         6BjNHNhPccPR5/X3YD9VYELe+uNYyCz64MUafVxWTzfjkgJd0rYBd4Ilya/Sl/eXS9vc
         kvX6H0nOSvx1R6w3o7M6YSYc7M3iq02YkqU7gFTAq9alLnHsWT0dlXs8bh6EhOWC1oG5
         dSifwX//Fs3fdDbJZ0Liqv0Fo+VhmsswwDc0eOJ69I/ss/RrUeez7C5TngS3qjyF1uG8
         A6qZzXcNPTYn/aU+ge0H8u+adTnRtW6qGtODYdLP1XYjl65lMebWklLLUU0vTfpQeFfr
         DsAA==
X-Gm-Message-State: AOAM5304bY8nZYuIY3mQ+O0kMxuLTgtujtZG0sDRMx3W6NxtIdOIacHm
        F+ZYZDL79ma8p6Sef5OdyDGKgA==
X-Google-Smtp-Source: ABdhPJy04b8342NwV0mleKtGOp9vKLZ/nlMjU9t/7NgZqEbrqO6txTlCvRTbQRHe8K84xwsTigEKsA==
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id q11-20020a170906a08b00b006cf65bce7demr15069336ejy.220.1651569646570;
        Tue, 03 May 2022 02:20:46 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u26-20020aa7d99a000000b0042617ba63b7sm7736629eds.65.2022.05.03.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:20:46 -0700 (PDT)
Message-ID: <08e9a67e-42dd-019d-ade8-1d8a53ead4f0@linaro.org>
Date:   Tue, 3 May 2022 11:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/12] arm64: dts: exynosautov9: add initial cmu clock
 nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220502090230.12853-1-chanho61.park@samsung.com>
 <CGME20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043@epcas2p2.samsung.com>
 <20220502090230.12853-11-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-11-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 72 ++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 807d500d6022..6f181632267b 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -6,6 +6,7 @@
>   *
>   */
>  
> +#include <dt-bindings/clock/exynosautov9.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> @@ -190,6 +191,77 @@ chipid@10000000 {
>  			reg = <0x10000000 0x24>;
>  		};
>  
> +		cmu_busmc: clock-controller@1b200000 {
> +			compatible = "samsung,exynosautov9-cmu-busmc";
> +			reg = <0x1b200000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
> +			clock-names = "oscclk", "dout_clkcmu_busmc_bus";
> +		};
> +
> +		cmu_core: clock-controller@1b030000 {

Let's order all these nodes by unit address.

Best regards,
Krzysztof
