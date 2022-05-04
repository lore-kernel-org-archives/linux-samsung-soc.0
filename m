Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F988C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 09:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347768AbiEDJvm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 05:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347746AbiEDJvh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:51:37 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FED26556;
        Wed,  4 May 2022 02:48:01 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c9so253161plh.2;
        Wed, 04 May 2022 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bv1h6BXKAjqI8tzaIvnSqEesLBEenCW8SzGMBmOtlg4=;
        b=iVJLHWop2ZRxfyWIVNkZAUYLG7DXvK3EHg77400Okq+sGk0iGK5PJPQsCvTTvcjdJs
         wfmv3z1t6oY4VrRHsyxLRX/wkgNLzi1v4qI+yrx8ejhZv28CX3h67OjQ+S0qsEbGBOxI
         gafnhTkKNkjzNs4xcrNbOab+nvTm5CMfSSRh+WyfQbCKtcRhlupl9JcuTK+3jGlen4Qj
         fJwPnkNnUnJch46qzKcN2OPkGnx7pwNU+98P9b60LpUe/lE1wYwxldErLPA56GSCeGOK
         Dsn3+KsrY8KkIyrl18w6nsGWZugAgURLhcXy3+euFnNVSjTzI6WaknnU3k/Y1yliCMnf
         WQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bv1h6BXKAjqI8tzaIvnSqEesLBEenCW8SzGMBmOtlg4=;
        b=k6m3ebZbO/8cOWg2echAtxkLmGfdrqhWtnMERqZgCAiUROgYNgI1e5FILp+BAmo8a3
         xuV7nh7X6+LWvOXkjAhcHUyZSVF4nhdpGyvJhDC8b+991lZDwxoWZS6mpr3eMJr9Z7Ik
         RFu/c7Zm7c3w7mITWQuk/pYlFXFCEDo9nqjdigakzPA7eCcr7ysQGvCksE5dfPeJspSq
         AnHB7UsJGr2z9zyFCi2e8n4qv/9zHkCSrA5n+/b0/9NxBSTw+MdqSLKu9EuqcXXRpM55
         wQmY8WBIasnoSPV1qxSbpAC5PZyuMwQaqCD7G48DKQtwl3PqC7sVR2gfsFKXt9zxT41U
         y0Hw==
X-Gm-Message-State: AOAM531ObJPXPp66PCCjf63a5xdTzoBay/gLmaR4c8c/FCY9HRjswBxd
        D/PfWTdSRXmgPZ3YtpCgpa0UlmkobiU=
X-Google-Smtp-Source: ABdhPJw8O99jtfB/BwE+sS/fmP60PVcXEPfJ9UI64XaGbU6/sPgo8rbXGGt4WRjOyXYsEsA1OzrTuw==
X-Received: by 2002:a17:902:d48d:b0:15e:a480:78b2 with SMTP id c13-20020a170902d48d00b0015ea48078b2mr13905000plg.19.1651657680824;
        Wed, 04 May 2022 02:48:00 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id v17-20020aa78511000000b0050dc762812asm7783628pfn.4.2022.05.04.02.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 02:48:00 -0700 (PDT)
Message-ID: <849ce462-d753-4c10-d5b6-55f5c47a6c29@gmail.com>
Date:   Wed, 4 May 2022 18:47:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 10/12] arm64: dts: exynosautov9: add initial cmu clock
 nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075004epcas2p44c3c0246988d133a5da1fdfd2f17d0b9@epcas2p4.samsung.com>
 <20220504075154.58819-11-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-11-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 84 ++++++++++++++++++++
>   1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 807d500d6022..c9cd3774f298 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -6,6 +6,7 @@
>    *
>    */
>   
> +#include <dt-bindings/clock/samsung,exynosautov9.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/soc/samsung,exynos-usi.h>
>   
> @@ -190,6 +191,89 @@ chipid@10000000 {
>   			reg = <0x10000000 0x24>;
>   		};
>   
> +		cmu_peris: clock-controller@10020000 {
> +			compatible = "samsung,exynosautov9-cmu-peris";
> +			reg = <0x10020000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIS_BUS>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peris_bus";
> +		};
> +
> +		cmu_peric0: clock-controller@10200000 {
> +			compatible = "samsung,exynosautov9-cmu-peric0";
> +			reg = <0x10200000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_BUS>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peric0_bus",
> +				      "dout_clkcmu_peric0_ip";
> +		};
> +
> +		cmu_peric1: clock-controller@10800000 {
> +			compatible = "samsung,exynosautov9-cmu-peric1";
> +			reg = <0x10800000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC1_BUS>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peric1_bus",
> +				      "dout_clkcmu_peric1_ip";
> +		};
> +
> +		cmu_fsys2: clock-controller@17c00000 {
> +			compatible = "samsung,exynosautov9-cmu-fsys2";
> +			reg = <0x17c00000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
> +				 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_fsys2_bus",
> +				      "dout_fsys2_clkcmu_ufs_embd",
> +				      "dout_fsys2_clkcmu_ethernet";
> +		};
> +
> +		cmu_core: clock-controller@1b030000 {
> +			compatible = "samsung,exynosautov9-cmu-core";
> +			reg = <0x1b030000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_CORE_BUS>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_core_bus";
> +		};
> +
> +		cmu_busmc: clock-controller@1b200000 {
> +			compatible = "samsung,exynosautov9-cmu-busmc";
> +			reg = <0x1b200000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_busmc_bus";
> +		};
> +
> +		cmu_top: clock-controller@1b240000 {
> +			compatible = "samsung,exynosautov9-cmu-top";
> +			reg = <0x1b240000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>;
> +			clock-names = "oscclk";
> +		};
> +
>   		gic: interrupt-controller@10101000 {
>   			compatible = "arm,gic-400";
>   			#interrupt-cells = <3>;

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
