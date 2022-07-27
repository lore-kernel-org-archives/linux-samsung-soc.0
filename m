Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBD0C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiG0Hkl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiG0Hkj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:40:39 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B913220F5E;
        Wed, 27 Jul 2022 00:40:38 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id q16so15246649pgq.6;
        Wed, 27 Jul 2022 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wc/jrBe79t3wTx25xIXH8G4aqNXx6I9OIfWZjqL7SHc=;
        b=kZg+w+KimyxaCjpaCz07aqC4dYHEl/z3HQVxBuv8kpStREFAFMGx+RMcWzLpObIi9L
         gC7XnCfsUqNKSvwJVPjD0IBlj1d8giCUGHKFSRPCDbF1ZP/UeM7dXNg0mijUrPsnotO2
         2hGORsm0Z9JrBd3uifBTbv0tGmgwjhkJGRTlZpZH7heyzWMy0bxrNiYRm/JcDlEcB9MF
         GEk/no6e2uijFWm1GhO1hAkIlUMd6ee7ueBGJ7IGawvWyuwoyx2Np6SxWTTXnGoDvq8L
         78A9Lt4pBtTkbwnqAdhx3W+Syhg0XONhXUFe70OOrX6qWbqEizAvdl64MiEKvKMH9BcG
         aPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wc/jrBe79t3wTx25xIXH8G4aqNXx6I9OIfWZjqL7SHc=;
        b=FP4tKWPGH5WKgS+Y8My4Usg+vgzaPe7sZpWVdYp9z7PRwnokHA1P85zDxtsIIoydKI
         7/rhID/To7jAE6YxcHFeeRGRg/Y4IZa73cNjyAVL/nPRYkm+ooDFSJgAlsud4kEMpFsC
         tmm7I3B78koV3B9JBIY+dUZtjQuQB3f8k6WdD3mt9EIS2jJVr/IzqW3OoT6rTxhtNzVC
         kiugC+1fF0duXjeh6ra3wfnNM6Pf7g8Qr7/lJMJwLQqryx3YNe9KloJD9LsiIo+RHntF
         saJye1acOHJyeG78V9p12sln+zlepwS7ACQHhcLXHJPOReX13U0sA+e39o4+brtfeu6+
         0dMA==
X-Gm-Message-State: AJIora81Oo0gQvN5FmRSAfW1b08CJhdvI4KyqFz6c/qsAQoOakNcxWbg
        H4YVuI6zWdffaaqokwtcaCA=
X-Google-Smtp-Source: AGRyM1v7clYTwHPbjcLEsITvKR1WweWAgRy3l/Dho2N1pxepK1QJeCZohTWTe2rgfJtDG5r5L62FQw==
X-Received: by 2002:a05:6a00:21c2:b0:52b:ff44:6680 with SMTP id t2-20020a056a0021c200b0052bff446680mr10997411pfj.57.1658907638185;
        Wed, 27 Jul 2022 00:40:38 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id w22-20020aa79556000000b005284e98304csm12879994pfq.205.2022.07.27.00.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:40:36 -0700 (PDT)
Message-ID: <2793065b-f22c-ddbb-8d0b-32fca0cf1034@gmail.com>
Date:   Wed, 27 Jul 2022 16:40:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] arm64: dts: exynosautov9: add fsys0/1 clock DT nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p3fa8d9a1e8ab3db929b3518ac8aca770c@epcas2p3.samsung.com>
 <20220727060146.9228-5-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220727060146.9228-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 27. 15:01, Chanho Park wrote:
> Add cmu_fsys0 and cmu_fsys1 for PCIe clocks and USB/MMC clocks
> respectively.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 2013718532f3..58b3b0c5d3fc 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -207,6 +207,34 @@ cmu_peric1: clock-controller@10800000 {
>  				      "dout_clkcmu_peric1_ip";
>  		};
>  
> +		cmu_fsys0: clock-controller@17700000 {
> +			compatible = "samsung,exynosautov9-cmu-fsys0";
> +			reg = <0x17700000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS0_BUS>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS0_PCIE>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_fsys0_bus",
> +				      "dout_clkcmu_fsys0_pcie";
> +		};
> +
> +		cmu_fsys1: clock-controller@17040000 {
> +			compatible = "samsung,exynosautov9-cmu-fsys1";
> +			reg = <0x17040000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS1_BUS>,
> +				 <&cmu_top GOUT_CLKCMU_FSYS1_MMC_CARD>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS1_USBDRD>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_fsys1_bus",
> +				      "gout_clkcmu_fsys1_mmc_card",
> +				      "dout_clkcmu_fsys1_usbdrd";
> +		};
> +
>  		cmu_fsys2: clock-controller@17c00000 {
>  			compatible = "samsung,exynosautov9-cmu-fsys2";
>  			reg = <0x17c00000 0x8000>;

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
